cmake_minimum_required(VERSION 3.13.4)
project(StructFix_OS_Analyzer)

find_package(LLVM REQUIRED CONFIG)
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

add_library(StructLeakPass MODULE src/StructLeakPass.cpp)
target_link_options(StructLeakPass PRIVATE "-Wl,-Bsymbolic")
