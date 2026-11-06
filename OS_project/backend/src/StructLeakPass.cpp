#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include <vector>
#include <string>

using namespace llvm;

namespace {
    struct StructLeakPass : public PassInfoMixin<StructLeakPass> {
        PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM) {
            std::error_code EC;
            // Overwrite JSON file completely every time it runs
            raw_fd_ostream JsonFile("report.json", EC, sys::fs::OF_Text);
            
            std::vector<std::string> alloc_objects;
            int total_allocs = 0;
            int total_frees = 0;
            bool loop_detected = false;

            for (Function &F : M) {
                if (F.isDeclaration()) continue;

                for (BasicBlock &BB : F) {
                    bool in_loop = false;
                    for (BasicBlock *Pred : predecessors(&BB)) {
                        if (Pred == &BB) {
                            in_loop = true;
                            loop_detected = true;
                        }
                    }

                    for (Instruction &I : BB) {
                        unsigned line_no = 0;
                        if (const DebugLoc &Loc = I.getDebugLoc()) { line_no = Loc.getLine(); }

                        if (CallInst *Call = dyn_cast<CallInst>(&I)) {
                            if (Function *CalledFn = Call->getCalledFunction()) {
                                // Track ANY Allocation
                                if (CalledFn->getName() == "malloc") {
                                    total_allocs++;
                                    std::string var_name = "MemBlock_" + std::to_string(total_allocs);
                                    std::string obj = "{ \"id\": \"" + var_name + "\", \"line\": " + std::to_string(line_no) + ", \"in_loop\": " + (in_loop ? "true" : "false") + " }";
                                    alloc_objects.push_back(obj);
                                }
                                // Track ANY Free (Even Aliased pointers trigger this)
                                if (CalledFn->getName() == "free") {
                                    total_frees++;
                                }
                            }
                        }
                    }
                }
            }

            // Write strict JSON
            JsonFile << "{\n  \"allocations\": [\n";
            for(size_t i = 0; i < alloc_objects.size(); i++) {
                JsonFile << "    " << alloc_objects[i];
                if (i < alloc_objects.size() - 1) JsonFile << ",";
                JsonFile << "\n";
            }
            JsonFile << "  ],\n  \"frees_count\": " << total_frees << ",\n";
            JsonFile << "  \"total_allocs\": " << total_allocs << ",\n";
            JsonFile << "  \"loop_warning\": " << (loop_detected ? "true" : "false") << "\n}\n";
            
            return PreservedAnalyses::all();
        }
    };
}

extern "C" ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return { LLVM_PLUGIN_API_VERSION, "StructLeakPass", LLVM_VERSION_STRING,
        [](PassBuilder &PB) { PB.registerPipelineParsingCallback(
                [](StringRef Name, ModulePassManager &MPM, ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "struct-leak-pass") { MPM.addPass(StructLeakPass()); return true; }
                    return false;
                });
        }
    };
}
