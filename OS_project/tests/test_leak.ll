; ModuleID = 'test_leak.c'
source_filename = "test_leak.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.IO_Request = type { ptr }
%struct.Buffer = type { ptr }

; Function Attrs: nounwind uwtable
define dso_local ptr @create_request(i32 noundef %0) #0 !dbg !20 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4, !tbaa !26
  call void @llvm.dbg.declare(metadata ptr %2, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #5, !dbg !31
  call void @llvm.dbg.declare(metadata ptr %3, metadata !25, metadata !DIExpression()), !dbg !32
  %4 = call noalias ptr @malloc(i64 noundef 8) #6, !dbg !33
  store ptr %4, ptr %3, align 8, !dbg !32, !tbaa !34
  %5 = call noalias ptr @malloc(i64 noundef 8) #6, !dbg !36
  %6 = load ptr, ptr %3, align 8, !dbg !37, !tbaa !34
  %7 = getelementptr inbounds %struct.IO_Request, ptr %6, i32 0, i32 0, !dbg !38
  store ptr %5, ptr %7, align 8, !dbg !39, !tbaa !40
  %8 = load i32, ptr %2, align 4, !dbg !42, !tbaa !26
  %9 = sext i32 %8 to i64, !dbg !42
  %10 = mul i64 %9, 4, !dbg !43
  %11 = call noalias ptr @malloc(i64 noundef %10) #6, !dbg !44
  %12 = load ptr, ptr %3, align 8, !dbg !45, !tbaa !34
  %13 = getelementptr inbounds %struct.IO_Request, ptr %12, i32 0, i32 0, !dbg !46
  %14 = load ptr, ptr %13, align 8, !dbg !46, !tbaa !40
  %15 = getelementptr inbounds %struct.Buffer, ptr %14, i32 0, i32 0, !dbg !47
  store ptr %11, ptr %15, align 8, !dbg !48, !tbaa !49
  %16 = load ptr, ptr %3, align 8, !dbg !51, !tbaa !34
  call void @llvm.lifetime.end.p0(i64 8, ptr %3) #5, !dbg !52
  ret ptr %16, !dbg !53
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind allocsize(0)
declare !dbg !54 noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local void @process_and_cleanup(ptr noundef %0) #0 !dbg !62 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !34
  call void @llvm.dbg.declare(metadata ptr %2, metadata !66, metadata !DIExpression()), !dbg !67
  %3 = load ptr, ptr %2, align 8, !dbg !68, !tbaa !34
  call void @free(ptr noundef %3) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nounwind
declare !dbg !71 void @free(ptr noundef) #4

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 !dbg !74 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  call void @llvm.lifetime.start.p0(i64 8, ptr %2) #5, !dbg !79
  call void @llvm.dbg.declare(metadata ptr %2, metadata !78, metadata !DIExpression()), !dbg !80
  %3 = call ptr @create_request(i32 noundef 1024), !dbg !81
  store ptr %3, ptr %2, align 8, !dbg !80, !tbaa !34
  %4 = load ptr, ptr %2, align 8, !dbg !82, !tbaa !34
  call void @process_and_cleanup(ptr noundef %4), !dbg !83
  call void @llvm.lifetime.end.p0(i64 8, ptr %2) #5, !dbg !84
  ret i32 0, !dbg !85
}

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test_leak.c", directory: "/home/cse-sdpl/Desktop/OS_project", checksumkind: CSK_MD5, checksum: "140cc7fa412c70ab72b5669f16e19f08")
!2 = !{!3, !7, !11}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "IO_Request", file: !1, line: 7, size: 64, elements: !5)
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_member, name: "internal_buf", scope: !4, file: !1, line: 8, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Buffer", file: !1, line: 3, size: 64, elements: !9)
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "data_array", scope: !8, file: !1, line: 4, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 5}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 8, !"PIC Level", i32 2}
!17 = !{i32 7, !"PIE Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 2}
!19 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!20 = distinct !DISubprogram(name: "create_request", scope: !1, file: !1, line: 11, type: !21, scopeLine: 11, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{!3, !12}
!23 = !{!24, !25}
!24 = !DILocalVariable(name: "size", arg: 1, scope: !20, file: !1, line: 11, type: !12)
!25 = !DILocalVariable(name: "req", scope: !20, file: !1, line: 12, type: !3)
!26 = !{!27, !27, i64 0}
!27 = !{!"int", !28, i64 0}
!28 = !{!"omnipotent char", !29, i64 0}
!29 = !{!"Simple C/C++ TBAA"}
!30 = !DILocation(line: 11, column: 39, scope: !20)
!31 = !DILocation(line: 12, column: 5, scope: !20)
!32 = !DILocation(line: 12, column: 24, scope: !20)
!33 = !DILocation(line: 12, column: 50, scope: !20)
!34 = !{!35, !35, i64 0}
!35 = !{!"any pointer", !28, i64 0}
!36 = !DILocation(line: 13, column: 41, scope: !20)
!37 = !DILocation(line: 13, column: 5, scope: !20)
!38 = !DILocation(line: 13, column: 10, scope: !20)
!39 = !DILocation(line: 13, column: 23, scope: !20)
!40 = !{!41, !35, i64 0}
!41 = !{!"IO_Request", !35, i64 0}
!42 = !DILocation(line: 14, column: 50, scope: !20)
!43 = !DILocation(line: 14, column: 55, scope: !20)
!44 = !DILocation(line: 14, column: 43, scope: !20)
!45 = !DILocation(line: 14, column: 5, scope: !20)
!46 = !DILocation(line: 14, column: 10, scope: !20)
!47 = !DILocation(line: 14, column: 24, scope: !20)
!48 = !DILocation(line: 14, column: 35, scope: !20)
!49 = !{!50, !35, i64 0}
!50 = !{!"Buffer", !35, i64 0}
!51 = !DILocation(line: 15, column: 12, scope: !20)
!52 = !DILocation(line: 16, column: 1, scope: !20)
!53 = !DILocation(line: 15, column: 5, scope: !20)
!54 = !DISubprogram(name: "malloc", scope: !55, file: !55, line: 672, type: !56, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!55 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "7fa2ecb2348a66f8b44ab9a15abd0b72")
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !59}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !60, line: 18, baseType: !61)
!60 = !DIFile(filename: "/usr/lib/llvm-18/lib/clang/18/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!61 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!62 = distinct !DISubprogram(name: "process_and_cleanup", scope: !1, file: !1, line: 18, type: !63, scopeLine: 18, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !65)
!63 = !DISubroutineType(types: !64)
!64 = !{null, !3}
!65 = !{!66}
!66 = !DILocalVariable(name: "req", arg: 1, scope: !62, file: !1, line: 18, type: !3)
!67 = !DILocation(line: 18, column: 45, scope: !62)
!68 = !DILocation(line: 20, column: 10, scope: !62)
!69 = !DILocation(line: 20, column: 5, scope: !62)
!70 = !DILocation(line: 21, column: 1, scope: !62)
!71 = !DISubprogram(name: "free", scope: !55, file: !55, line: 687, type: !72, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!72 = !DISubroutineType(types: !73)
!73 = !{null, !58}
!74 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 23, type: !75, scopeLine: 23, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !77)
!75 = !DISubroutineType(types: !76)
!76 = !{!12}
!77 = !{!78}
!78 = !DILocalVariable(name: "my_req", scope: !74, file: !1, line: 24, type: !3)
!79 = !DILocation(line: 24, column: 5, scope: !74)
!80 = !DILocation(line: 24, column: 24, scope: !74)
!81 = !DILocation(line: 24, column: 33, scope: !74)
!82 = !DILocation(line: 25, column: 25, scope: !74)
!83 = !DILocation(line: 25, column: 5, scope: !74)
!84 = !DILocation(line: 27, column: 1, scope: !74)
!85 = !DILocation(line: 26, column: 5, scope: !74)
