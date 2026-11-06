; ModuleID = '/home/sahil/Desktop/OS_Project/OS_project/tests/live_test.c'
source_filename = "/home/sahil/Desktop/OS_Project/OS_project/tests/live_test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  call void @llvm.lifetime.start.p0(i64 8, ptr %2) #5, !dbg !18
  call void @llvm.dbg.declare(metadata ptr %2, metadata !15, metadata !DIExpression()), !dbg !19
  %4 = call noalias ptr @malloc(i64 noundef 4) #6, !dbg !20
  store ptr %4, ptr %2, align 8, !dbg !19, !tbaa !21
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #5, !dbg !25
  call void @llvm.dbg.declare(metadata ptr %3, metadata !17, metadata !DIExpression()), !dbg !26
  %5 = call noalias ptr @malloc(i64 noundef 4) #6, !dbg !27
  store ptr %5, ptr %3, align 8, !dbg !26, !tbaa !21
  %6 = load ptr, ptr %3, align 8, !dbg !28, !tbaa !21
  call void @free(ptr noundef %6) #5, !dbg !29
  call void @llvm.lifetime.end.p0(i64 8, ptr %3) #5, !dbg !30
  call void @llvm.lifetime.end.p0(i64 8, ptr %2) #5, !dbg !30
  ret i32 0, !dbg !31
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind allocsize(0)
declare !dbg !32 noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare !dbg !40 void @free(ptr noundef) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/sahil/Desktop/OS_Project/OS_project/tests/live_test.c", directory: "/home/sahil/Desktop/OS_Project/OS_project", checksumkind: CSK_MD5, checksum: "20951d825296a40c7611f58a1127b4ce")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "tests/live_test.c", directory: "/home/sahil/Desktop/OS_Project/OS_project", checksumkind: CSK_MD5, checksum: "20951d825296a40c7611f58a1127b4ce")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{!15, !17}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 4, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!17 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 5, type: !16)
!18 = !DILocation(line: 4, column: 5, scope: !9)
!19 = !DILocation(line: 4, column: 10, scope: !9)
!20 = !DILocation(line: 4, column: 14, scope: !9)
!21 = !{!22, !22, i64 0}
!22 = !{!"any pointer", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C/C++ TBAA"}
!25 = !DILocation(line: 5, column: 5, scope: !9)
!26 = !DILocation(line: 5, column: 10, scope: !9)
!27 = !DILocation(line: 5, column: 14, scope: !9)
!28 = !DILocation(line: 6, column: 10, scope: !9)
!29 = !DILocation(line: 6, column: 5, scope: !9)
!30 = !DILocation(line: 8, column: 1, scope: !9)
!31 = !DILocation(line: 7, column: 5, scope: !9)
!32 = !DISubprogram(name: "malloc", scope: !33, file: !33, line: 672, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!33 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "7fa2ecb2348a66f8b44ab9a15abd0b72")
!34 = !DISubroutineType(types: !35)
!35 = !{!36, !37}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 18, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-18/lib/clang/18/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DISubprogram(name: "free", scope: !33, file: !33, line: 687, type: !41, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !36}
