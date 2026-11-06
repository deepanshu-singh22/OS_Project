# StructFix: OS Memory Analyzer

StructFix is a small C/C++ memory-analysis prototype for OS and systems-code examples. It combines an LLVM module pass with a Streamlit interface to show detected `malloc` calls, a heap diagram, and suggested `free` calls.

> **Prototype notice:** The current checks are heuristic and do not perform full pointer or control-flow analysis. Treat the results and generated suggestions as guidance for experimentation—not as proof that code is memory-safe or ready for production.

## Features

- Accepts C/C++ source in a browser-based editor.
- Compiles the source to LLVM IR with debug information.
- Runs the `struct-leak-pass` LLVM plugin and writes an allocation report to `report.json`.
- Displays the report and a Graphviz allocation diagram.
- Compares simple `malloc` and `free` patterns in the source and suggests missing frees.

## Requirements

Run the project in a Linux environment (or WSL) with:

- Python 3
- CMake and a C++ compiler
- LLVM development files and tools: `clang`, `opt`, and the LLVM CMake package
- Matching LLVM versions for the development files, `clang`, and `opt`
- Graphviz
- Python packages: `streamlit`, `streamlit-ace`, and `graphviz`

The LLVM plugin is built as `libStructLeakPass.so`, and the app invokes Linux-style tool paths. Native Windows setup is not currently supported.

## Setup

From the repository root, install the Python packages:

```bash
python3 -m pip install streamlit streamlit-ace graphviz
```

Build the LLVM pass:

```bash
cd OS_project/backend
cmake -S . -B build
cmake --build build
cd ../..
```

If CMake cannot locate LLVM, set `LLVM_DIR` to the directory containing LLVM's `LLVMConfig.cmake`, for example:

```bash
cmake -S OS_project/backend -B OS_project/backend/build \
  -DLLVM_DIR=/path/to/llvm/lib/cmake/llvm
cmake --build OS_project/backend/build
```

## Run

From the repository root:

```bash
cd OS_project
streamlit run frontend/app.py
```

Open the local URL printed by Streamlit, enter C code in the editor, and select **Run StructFix Analysis**. The app expects the LLVM plugin at `backend/build/libStructLeakPass.so` and writes the generated report to `OS_project/report.json`.

## Project layout

```text
OS_project/
├── backend/
│   ├── CMakeLists.txt       # LLVM plugin build configuration
│   └── src/
│       └── StructLeakPass.cpp
├── frontend/
│   └── app.py               # Streamlit UI and analysis workflow
├── tests/                   # C and LLVM IR examples
└── report.json              # Example/generated analysis report
```

## Current analysis limitations

- The LLVM pass counts direct calls to `malloc` and `free` across the module; it does not match each allocation to its corresponding free or track pointer aliases.
- Loop detection currently checks only self-predecessor basic blocks, so it does not identify every loop.
- The UI uses simple source-text matching to identify allocated and freed variables. It is not a C/C++ parser and may misinterpret complex expressions, scopes, branches, or nested structures.
- The suggested cleanup patch is not applied automatically. Review any suggestion and validate the code with appropriate tests and analysis tools.
