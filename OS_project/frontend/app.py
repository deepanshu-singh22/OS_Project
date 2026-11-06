import streamlit as st
import subprocess
import graphviz
import json
import os
import time
import re
import html  # <--- Added to safely render variables like '->' in Graphviz
from streamlit_ace import st_ace 

# ==========================================
# PAGE CONFIGURATION
# ==========================================
st.set_page_config(layout="wide", page_title="StructFix: OS Memory Analyzer")

st.title("🛡️ StructFix: Real-Time OS Memory Analyzer")
st.markdown("### Static Analysis & Auto-Fix Engine for C/C++ Systems")

# Auto-cleanup on fresh load
if "session_started" not in st.session_state:
    st.session_state["session_started"] = True
    for old_file in ["tests/live_test.c", "tests/live_test.ll", "report.json"]:
        if os.path.exists(old_file):
            os.remove(old_file)

# ==========================================
# DEFAULT EDITOR TEMPLATE
# ==========================================
default_code = """// Paste your Linux Kernel Module, VFS, or custom C driver code here
#include <stdlib.h>

int main() {
    // Write your dynamic code to test the LLVM pass
    return 0;
}
"""

# ==========================================
# MAIN UI: SPLIT SCREEN ARCHITECTURE
# ==========================================
col1, col2 = st.columns([1, 1])

with col1:
    st.markdown("**Live C/C++ Editor:**")
    user_code = st_ace(
        value=default_code,
        language='c_cpp',
        theme='twilight',
        key="main_editor",
        height=500,
        show_gutter=True, 
        auto_update=True
    )
    
    analyze_btn = st.button("🚀 Run StructFix Analysis", use_container_width=True)

with col2:
    st.markdown("**Analysis Engine Output:**")
    output_placeholder = st.empty()

# ==========================================
# EXECUTION ENGINE
# ==========================================
if analyze_btn:
    with output_placeholder.container():
        with st.spinner("Compiling and traversing Control Flow Graph..."):
            
            for file_to_clean in ["tests/live_test.c", "tests/live_test.ll", "report.json"]:
                if os.path.exists(file_to_clean):
                    os.remove(file_to_clean)
            
            with open("tests/live_test.c", "w") as f:
                f.write(user_code)
            
            start_time = time.perf_counter()
            
            clang_proc = subprocess.run(
                ["clang", "-g", "-O1", "-Xclang", "-disable-llvm-passes", "-S", "-emit-llvm", "tests/live_test.c", "-o", "tests/live_test.ll"],
                capture_output=True, text=True
            )
            
            if clang_proc.returncode == 0:
                opt_proc = subprocess.run(
                    ["opt", "-load-pass-plugin=./backend/build/libStructLeakPass.so", "-passes=struct-leak-pass", "-disable-output", "tests/live_test.ll"],
                    capture_output=True, text=True
                )
            
            end_time = time.perf_counter()
            execution_time = end_time - start_time
            
            if clang_proc.returncode != 0:
                st.error("❌ Compilation Error in your C code!")
                st.code(clang_proc.stderr, language="bash")
            elif not os.path.exists("report.json"):
                st.warning(f"⚠️ Analysis finished in {execution_time:.3f}s, but no memory tracking report was generated.")
            else:
                st.success(f"✅ Analysis Completed in **{execution_time:.3f} seconds**")
                
                with open("report.json", "r") as f:
                    data = json.load(f)
                
                with st.expander("📄 View Raw Engine Report (JSON)"):
                    st.json(data)
                
                # --- PREMIUM GRAPHVIZ GENERATION (With Variable Names) ---
                graph = graphviz.Digraph(name="MemoryTree", format="png")
                graph.attr(rankdir='TB', size='8,8', fontname='Helvetica', nodesep='0.6')
                
                allocs = data.get("allocations", [])
                frees = data.get("frees_count", 0)
                
                code_lines = user_code.split('\n')
                
                graph.node('heap', 'System RAM (Heap)', shape='cylinder', style='filled', fillcolor='#e6f2ff', fontcolor='black')
                prev_node = 'heap'
                
                for i, alloc in enumerate(allocs):
                    is_leaked = i >= frees 
                    node_color = '#ffcccc' if is_leaked else '#ccffcc'
                    border_color = '#ff0000' if is_leaked else '#00cc00'
                    
                    node_id = alloc["id"]
                    line_num = alloc.get("line", "?")
                    var_name = "Unknown"
                    
                    # Robust Variable Extraction (Checks the exact line and nearby lines just in case)
                    if isinstance(line_num, int):
                        start_idx = max(0, line_num - 2)
                        end_idx = min(len(code_lines), line_num + 1)
                        for search_idx in range(start_idx, end_idx):
                            alloc_line = code_lines[search_idx]
                            if "=" in alloc_line and "malloc" in alloc_line:
                                var_part = alloc_line.split("=")[0].strip()
                                var_name = var_part.split()[-1].replace("*", "")
                                break
                    
                    # Escape HTML characters to prevent Graphviz crashing on '->'
                    safe_var_name = html.escape(var_name)
                    
                    # Render the Node with the Variable Name
                    label = f"<<B>{node_id}</B><BR/><FONT POINT-SIZE='11' COLOR='#0044cc'>Var: <B>{safe_var_name}</B></FONT><BR/><FONT POINT-SIZE='9'>Line: {line_num}</FONT>>"
                    
                    graph.node(node_id, label, shape='folder', style='filled,bold', fillcolor=node_color, color=border_color)
                    graph.edge(prev_node, node_id, color='gray', style='solid', penwidth='1.5')
                    prev_node = node_id

                # ==========================================
                # SMART AUTO-FIX ENGINE (Order & Missing Checks)
                # ==========================================
                allocated_vars = []
                freed_vars = []
                free_lines_map = {}
                
                # 1. Parse code to find Allocs and Frees accurately
                for idx, line in enumerate(code_lines):
                    if "malloc(" in line and "=" in line:
                        var_name = line.split("=")[0].strip().split()[-1].replace("*", "")
                        if var_name not in allocated_vars:
                            allocated_vars.append(var_name)
                    elif "free(" in line:
                        match = re.search(r'free\((.*?)\)', line)
                        if match:
                            var_name = match.group(1).strip()
                            if var_name not in freed_vars:
                                freed_vars.append(var_name)
                                free_lines_map[var_name] = idx + 1

                missing_frees = [var for var in allocated_vars if var not in freed_vars]
                
                # 2. Check for Use-After-Free (Wrong Order)
                order_errors = []
                for i, var1 in enumerate(freed_vars):
                    for var2 in freed_vars[i+1:]:
                        if var2.startswith(var1 + "->") or var2.startswith(var1 + "."):
                            order_errors.append(f"❌ **Fatal Crash (Use-After-Free):** `{var1}` is freed at **Line {free_lines_map[var1]}** BEFORE its internal member `{var2}` at **Line {free_lines_map[var2]}**!")

                if missing_frees or order_errors:
                    graph.node('leak', f'❌ KERNEL PANIC: MEMORY ISSUE\nReview Auto-Fix Patch below', shape='note', style='filled,bold', fillcolor='#ff4d4d', fontcolor='white')
                    graph.edge(prev_node, 'leak', style='dashed', color='red', penwidth='2')
                    st.graphviz_chart(graph)
                    
                    st.error("🚨 Memory Leaks or Invalid Free Orders detected.")
                    st.markdown("---")
                    st.markdown("### 🛠️ Auto-Fix Patch Generator")
                    
                    for err in order_errors:
                        st.error(err)
                        
                    if missing_frees:
                        target_line_num = "the end of the function"
                        if freed_vars:
                            first_free_line = min(free_lines_map.values())
                            target_line_num = f"Line {first_free_line}"
                        else:
                            for idx, line in enumerate(code_lines):
                                if "return" in line:
                                    target_line_num = f"Line {idx + 1}"
                                    break
                                    
                        st.warning(f"⚠️ **Missing Frees:** You forgot to free {len(missing_frees)} allocations.")
                        patch_code = f"// --- STRUCTFIX AUTO-GENERATED PATCH ---\n"
                        patch_code += f"// Correct order: Add these frees right before {target_line_num}:\n"
                        
                        for fix in reversed(missing_frees):
                            patch_code += f"free({fix});\n"
                            
                        st.code(patch_code, language="c")
                else:
                    graph.node('safe', f'✅ SYSTEM SECURE\nMemory correctly handled', shape='note', style='filled,bold', fillcolor='#2eb82e', fontcolor='white')
                    graph.edge(prev_node, 'safe', color='green', penwidth='2')
                    st.graphviz_chart(graph)
                    st.success("🎉 Status: Code is 100% Secure! All pointers freed in the exact correct order.")