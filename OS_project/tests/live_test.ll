; ModuleID = 'tests/live_test.c'
source_filename = "tests/live_test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ProcessControlBlock = type { i32, [50 x i8], i32, ptr, ptr }
%struct.ExecutionMetrics = type { i64, double, ptr }
%struct.ThreadStatus = type { i32, ptr, ptr }

@.str = private unnamed_addr constant [20 x i8] c"Worker_Thread_Alpha\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [54 x i8] c"Process initialized successfully with secure context.\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [48 x i8] c"Initializing OS Kernel Module: PCB Memory Test\0A\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [18 x i8] c"Virtual_OS_Daemon\00", align 1, !dbg !17
@.str.4 = private unnamed_addr constant [50 x i8] c"Process [%s] allocated successfully with PID: %d\0A\00", align 1, !dbg !22
@.str.5 = private unnamed_addr constant [35 x i8] c"Kernel module execution finished.\0A\00", align 1, !dbg !27

; Function Attrs: nounwind uwtable
define dso_local ptr @create_process_control_block(i32 noundef %0, ptr noundef %1) #0 !dbg !70 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4, !tbaa !79
  call void @llvm.dbg.declare(metadata ptr %4, metadata !76, metadata !DIExpression()), !dbg !83
  store ptr %1, ptr %5, align 8, !tbaa !84
  call void @llvm.dbg.declare(metadata ptr %5, metadata !77, metadata !DIExpression()), !dbg !86
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #6, !dbg !87
  call void @llvm.dbg.declare(metadata ptr %6, metadata !78, metadata !DIExpression()), !dbg !88
  %8 = call noalias ptr @malloc(i64 noundef 80) #7, !dbg !89
  store ptr %8, ptr %6, align 8, !dbg !88, !tbaa !84
  %9 = load ptr, ptr %6, align 8, !dbg !90, !tbaa !84
  %10 = icmp ne ptr %9, null, !dbg !90
  br i1 %10, label %12, label %11, !dbg !92

11:                                               ; preds = %2
  store ptr null, ptr %3, align 8, !dbg !93
  store i32 1, ptr %7, align 4
  br label %89, !dbg !93

12:                                               ; preds = %2
  %13 = load i32, ptr %4, align 4, !dbg !94, !tbaa !79
  %14 = load ptr, ptr %6, align 8, !dbg !95, !tbaa !84
  %15 = getelementptr inbounds %struct.ProcessControlBlock, ptr %14, i32 0, i32 0, !dbg !96
  store i32 %13, ptr %15, align 8, !dbg !97, !tbaa !98
  %16 = load ptr, ptr %6, align 8, !dbg !100, !tbaa !84
  %17 = getelementptr inbounds %struct.ProcessControlBlock, ptr %16, i32 0, i32 1, !dbg !101
  %18 = getelementptr inbounds [50 x i8], ptr %17, i64 0, i64 0, !dbg !100
  %19 = load ptr, ptr %5, align 8, !dbg !102, !tbaa !84
  %20 = call ptr @strncpy(ptr noundef %18, ptr noundef %19, i64 noundef 49) #6, !dbg !103
  %21 = load ptr, ptr %6, align 8, !dbg !104, !tbaa !84
  %22 = getelementptr inbounds %struct.ProcessControlBlock, ptr %21, i32 0, i32 2, !dbg !105
  store i32 1, ptr %22, align 8, !dbg !106, !tbaa !107
  %23 = call noalias ptr @malloc(i64 noundef 24) #7, !dbg !108
  %24 = load ptr, ptr %6, align 8, !dbg !109, !tbaa !84
  %25 = getelementptr inbounds %struct.ProcessControlBlock, ptr %24, i32 0, i32 3, !dbg !110
  store ptr %23, ptr %25, align 8, !dbg !111, !tbaa !112
  %26 = load ptr, ptr %6, align 8, !dbg !113, !tbaa !84
  %27 = getelementptr inbounds %struct.ProcessControlBlock, ptr %26, i32 0, i32 3, !dbg !115
  %28 = load ptr, ptr %27, align 8, !dbg !115, !tbaa !112
  %29 = icmp ne ptr %28, null, !dbg !113
  br i1 %29, label %30, label %80, !dbg !116

30:                                               ; preds = %12
  %31 = load ptr, ptr %6, align 8, !dbg !117, !tbaa !84
  %32 = getelementptr inbounds %struct.ProcessControlBlock, ptr %31, i32 0, i32 3, !dbg !119
  %33 = load ptr, ptr %32, align 8, !dbg !119, !tbaa !112
  %34 = getelementptr inbounds %struct.ExecutionMetrics, ptr %33, i32 0, i32 0, !dbg !120
  store i64 154000, ptr %34, align 8, !dbg !121, !tbaa !122
  %35 = load ptr, ptr %6, align 8, !dbg !126, !tbaa !84
  %36 = getelementptr inbounds %struct.ProcessControlBlock, ptr %35, i32 0, i32 3, !dbg !127
  %37 = load ptr, ptr %36, align 8, !dbg !127, !tbaa !112
  %38 = getelementptr inbounds %struct.ExecutionMetrics, ptr %37, i32 0, i32 1, !dbg !128
  store double 6.450000e+01, ptr %38, align 8, !dbg !129, !tbaa !130
  %39 = call noalias ptr @malloc(i64 noundef 24) #7, !dbg !131
  %40 = load ptr, ptr %6, align 8, !dbg !132, !tbaa !84
  %41 = getelementptr inbounds %struct.ProcessControlBlock, ptr %40, i32 0, i32 3, !dbg !133
  %42 = load ptr, ptr %41, align 8, !dbg !133, !tbaa !112
  %43 = getelementptr inbounds %struct.ExecutionMetrics, ptr %42, i32 0, i32 2, !dbg !134
  store ptr %39, ptr %43, align 8, !dbg !135, !tbaa !136
  %44 = load ptr, ptr %6, align 8, !dbg !137, !tbaa !84
  %45 = getelementptr inbounds %struct.ProcessControlBlock, ptr %44, i32 0, i32 3, !dbg !139
  %46 = load ptr, ptr %45, align 8, !dbg !139, !tbaa !112
  %47 = getelementptr inbounds %struct.ExecutionMetrics, ptr %46, i32 0, i32 2, !dbg !140
  %48 = load ptr, ptr %47, align 8, !dbg !140, !tbaa !136
  %49 = icmp ne ptr %48, null, !dbg !137
  br i1 %49, label %50, label %79, !dbg !141

50:                                               ; preds = %30
  %51 = load ptr, ptr %6, align 8, !dbg !142, !tbaa !84
  %52 = getelementptr inbounds %struct.ProcessControlBlock, ptr %51, i32 0, i32 3, !dbg !144
  %53 = load ptr, ptr %52, align 8, !dbg !144, !tbaa !112
  %54 = getelementptr inbounds %struct.ExecutionMetrics, ptr %53, i32 0, i32 2, !dbg !145
  %55 = load ptr, ptr %54, align 8, !dbg !145, !tbaa !136
  %56 = getelementptr inbounds %struct.ThreadStatus, ptr %55, i32 0, i32 0, !dbg !146
  store i32 101, ptr %56, align 8, !dbg !147, !tbaa !148
  %57 = call noalias ptr @malloc(i64 noundef 30) #7, !dbg !150
  %58 = load ptr, ptr %6, align 8, !dbg !151, !tbaa !84
  %59 = getelementptr inbounds %struct.ProcessControlBlock, ptr %58, i32 0, i32 3, !dbg !152
  %60 = load ptr, ptr %59, align 8, !dbg !152, !tbaa !112
  %61 = getelementptr inbounds %struct.ExecutionMetrics, ptr %60, i32 0, i32 2, !dbg !153
  %62 = load ptr, ptr %61, align 8, !dbg !153, !tbaa !136
  %63 = getelementptr inbounds %struct.ThreadStatus, ptr %62, i32 0, i32 1, !dbg !154
  store ptr %57, ptr %63, align 8, !dbg !155, !tbaa !156
  %64 = load ptr, ptr %6, align 8, !dbg !157, !tbaa !84
  %65 = getelementptr inbounds %struct.ProcessControlBlock, ptr %64, i32 0, i32 3, !dbg !158
  %66 = load ptr, ptr %65, align 8, !dbg !158, !tbaa !112
  %67 = getelementptr inbounds %struct.ExecutionMetrics, ptr %66, i32 0, i32 2, !dbg !159
  %68 = load ptr, ptr %67, align 8, !dbg !159, !tbaa !136
  %69 = getelementptr inbounds %struct.ThreadStatus, ptr %68, i32 0, i32 1, !dbg !160
  %70 = load ptr, ptr %69, align 8, !dbg !160, !tbaa !156
  %71 = call ptr @strcpy(ptr noundef %70, ptr noundef @.str) #6, !dbg !161
  %72 = call noalias ptr @malloc(i64 noundef 32) #7, !dbg !162
  %73 = load ptr, ptr %6, align 8, !dbg !163, !tbaa !84
  %74 = getelementptr inbounds %struct.ProcessControlBlock, ptr %73, i32 0, i32 3, !dbg !164
  %75 = load ptr, ptr %74, align 8, !dbg !164, !tbaa !112
  %76 = getelementptr inbounds %struct.ExecutionMetrics, ptr %75, i32 0, i32 2, !dbg !165
  %77 = load ptr, ptr %76, align 8, !dbg !165, !tbaa !136
  %78 = getelementptr inbounds %struct.ThreadStatus, ptr %77, i32 0, i32 2, !dbg !166
  store ptr %72, ptr %78, align 8, !dbg !167, !tbaa !168
  br label %79, !dbg !169

79:                                               ; preds = %50, %30
  br label %80, !dbg !170

80:                                               ; preds = %79, %12
  %81 = call noalias ptr @malloc(i64 noundef 256) #7, !dbg !171
  %82 = load ptr, ptr %6, align 8, !dbg !172, !tbaa !84
  %83 = getelementptr inbounds %struct.ProcessControlBlock, ptr %82, i32 0, i32 4, !dbg !173
  store ptr %81, ptr %83, align 8, !dbg !174, !tbaa !175
  %84 = load ptr, ptr %6, align 8, !dbg !176, !tbaa !84
  %85 = getelementptr inbounds %struct.ProcessControlBlock, ptr %84, i32 0, i32 4, !dbg !177
  %86 = load ptr, ptr %85, align 8, !dbg !177, !tbaa !175
  %87 = call ptr @strcpy(ptr noundef %86, ptr noundef @.str.1) #6, !dbg !178
  %88 = load ptr, ptr %6, align 8, !dbg !179, !tbaa !84
  store ptr %88, ptr %3, align 8, !dbg !180
  store i32 1, ptr %7, align 4
  br label %89, !dbg !180

89:                                               ; preds = %80, %11
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #6, !dbg !181
  %90 = load ptr, ptr %3, align 8, !dbg !181
  ret ptr %90, !dbg !181
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind allocsize(0)
declare !dbg !182 noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare !dbg !190 ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #4

; Function Attrs: nounwind
declare !dbg !196 ptr @strcpy(ptr noundef, ptr noundef) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local void @cleanup_process_control_block(ptr noundef %0) #0 !dbg !199 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !84
  call void @llvm.dbg.declare(metadata ptr %2, metadata !203, metadata !DIExpression()), !dbg !204
  %3 = load ptr, ptr %2, align 8, !dbg !205, !tbaa !84
  %4 = icmp ne ptr %3, null, !dbg !205
  br i1 %4, label %6, label %5, !dbg !207

5:                                                ; preds = %1
  br label %25, !dbg !208

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8, !dbg !209, !tbaa !84
  %8 = getelementptr inbounds %struct.ProcessControlBlock, ptr %7, i32 0, i32 3, !dbg !211
  %9 = load ptr, ptr %8, align 8, !dbg !211, !tbaa !112
  %10 = icmp ne ptr %9, null, !dbg !209
  br i1 %10, label %11, label %25, !dbg !212

11:                                               ; preds = %6
  %12 = load ptr, ptr %2, align 8, !dbg !213, !tbaa !84
  %13 = getelementptr inbounds %struct.ProcessControlBlock, ptr %12, i32 0, i32 3, !dbg !216
  %14 = load ptr, ptr %13, align 8, !dbg !216, !tbaa !112
  %15 = getelementptr inbounds %struct.ExecutionMetrics, ptr %14, i32 0, i32 2, !dbg !217
  %16 = load ptr, ptr %15, align 8, !dbg !217, !tbaa !136
  %17 = icmp ne ptr %16, null, !dbg !213
  br i1 %17, label %18, label %24, !dbg !218

18:                                               ; preds = %11
  %19 = load ptr, ptr %2, align 8, !dbg !219, !tbaa !84
  %20 = getelementptr inbounds %struct.ProcessControlBlock, ptr %19, i32 0, i32 3, !dbg !221
  %21 = load ptr, ptr %20, align 8, !dbg !221, !tbaa !112
  %22 = getelementptr inbounds %struct.ExecutionMetrics, ptr %21, i32 0, i32 2, !dbg !222
  %23 = load ptr, ptr %22, align 8, !dbg !222, !tbaa !136
  call void @free(ptr noundef %23) #6, !dbg !223
  br label %24, !dbg !224

24:                                               ; preds = %18, %11
  br label %25, !dbg !225

25:                                               ; preds = %5, %24, %6
  ret void, !dbg !226
}

; Function Attrs: nounwind
declare !dbg !227 void @free(ptr noundef) #4

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 !dbg !230 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !235
  call void @llvm.lifetime.start.p0(i64 8, ptr %2) #6, !dbg !236
  call void @llvm.dbg.declare(metadata ptr %2, metadata !234, metadata !DIExpression()), !dbg !237
  %4 = call ptr @create_process_control_block(i32 noundef 42, ptr noundef @.str.3), !dbg !238
  store ptr %4, ptr %2, align 8, !dbg !237, !tbaa !84
  %5 = load ptr, ptr %2, align 8, !dbg !239, !tbaa !84
  %6 = icmp ne ptr %5, null, !dbg !239
  br i1 %6, label %7, label %15, !dbg !241

7:                                                ; preds = %0
  %8 = load ptr, ptr %2, align 8, !dbg !242, !tbaa !84
  %9 = getelementptr inbounds %struct.ProcessControlBlock, ptr %8, i32 0, i32 1, !dbg !244
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0, !dbg !242
  %11 = load ptr, ptr %2, align 8, !dbg !245, !tbaa !84
  %12 = getelementptr inbounds %struct.ProcessControlBlock, ptr %11, i32 0, i32 0, !dbg !246
  %13 = load i32, ptr %12, align 8, !dbg !246, !tbaa !98
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %10, i32 noundef %13), !dbg !247
  br label %15, !dbg !248

15:                                               ; preds = %7, %0
  %16 = load ptr, ptr %2, align 8, !dbg !249, !tbaa !84
  call void @cleanup_process_control_block(ptr noundef %16), !dbg !250
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.5), !dbg !251
  call void @llvm.lifetime.end.p0(i64 8, ptr %2) #6, !dbg !252
  ret i32 0, !dbg !253
}

declare !dbg !254 i32 @printf(ptr noundef, ...) #5

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!32}
!llvm.module.flags = !{!63, !64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 43, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "tests/live_test.c", directory: "/home/cse-sdpl/Desktop/OS_project", checksumkind: CSK_MD5, checksum: "277afd6a8ff066dbd13b52a093eed2b2")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 20)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 432, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 54)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 69, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 384, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 48)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !2, line: 71, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 18)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(scope: null, file: !2, line: 74, type: !24, isLocal: true, isDefinition: true)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(scope: null, file: !2, line: 79, type: !29, isLocal: true, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 280, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 35)
!32 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !33, globals: !62, splitDebugInlining: false, nameTableKind: None)
!33 = !{!34, !43, !52, !58, !60}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "ProcessControlBlock", file: !2, line: 23, baseType: !36)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 17, size: 640, elements: !37)
!37 = !{!38, !40, !41, !42, !61}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "pid", scope: !36, file: !2, line: 18, baseType: !39, size: 32)
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "process_name", scope: !36, file: !2, line: 19, baseType: !24, size: 400, offset: 32)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !36, file: !2, line: 20, baseType: !39, size: 32, offset: 448)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "metrics", scope: !36, file: !2, line: 21, baseType: !43, size: 64, offset: 512)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "ExecutionMetrics", file: !2, line: 15, baseType: !45)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 11, size: 192, elements: !46)
!46 = !{!47, !49, !51}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "instructions_executed", scope: !45, file: !2, line: 12, baseType: !48, size: 64)
!48 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "memory_usage_mb", scope: !45, file: !2, line: 13, baseType: !50, size: 64, offset: 64)
!50 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "active_thread", scope: !45, file: !2, line: 14, baseType: !52, size: 64, offset: 128)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "ThreadStatus", file: !2, line: 9, baseType: !54)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 5, size: 192, elements: !55)
!55 = !{!56, !57, !59}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "thread_id", scope: !54, file: !2, line: 6, baseType: !39, size: 32)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "thread_name", scope: !54, file: !2, line: 7, baseType: !58, size: 64, offset: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "cpu_registers", scope: !54, file: !2, line: 8, baseType: !60, size: 64, offset: 128)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "audit_log", scope: !36, file: !2, line: 22, baseType: !58, size: 64, offset: 576)
!62 = !{!0, !7, !12, !17, !22, !27}
!63 = !{i32 7, !"Dwarf Version", i32 5}
!64 = !{i32 2, !"Debug Info Version", i32 3}
!65 = !{i32 1, !"wchar_size", i32 4}
!66 = !{i32 8, !"PIC Level", i32 2}
!67 = !{i32 7, !"PIE Level", i32 2}
!68 = !{i32 7, !"uwtable", i32 2}
!69 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!70 = distinct !DISubprogram(name: "create_process_control_block", scope: !2, file: !2, line: 25, type: !71, scopeLine: 25, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, retainedNodes: !75)
!71 = !DISubroutineType(types: !72)
!72 = !{!34, !39, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!75 = !{!76, !77, !78}
!76 = !DILocalVariable(name: "process_id", arg: 1, scope: !70, file: !2, line: 25, type: !39)
!77 = !DILocalVariable(name: "name", arg: 2, scope: !70, file: !2, line: 25, type: !73)
!78 = !DILocalVariable(name: "pcb", scope: !70, file: !2, line: 26, type: !34)
!79 = !{!80, !80, i64 0}
!80 = !{!"int", !81, i64 0}
!81 = !{!"omnipotent char", !82, i64 0}
!82 = !{!"Simple C/C++ TBAA"}
!83 = !DILocation(line: 25, column: 55, scope: !70)
!84 = !{!85, !85, i64 0}
!85 = !{!"any pointer", !81, i64 0}
!86 = !DILocation(line: 25, column: 79, scope: !70)
!87 = !DILocation(line: 26, column: 5, scope: !70)
!88 = !DILocation(line: 26, column: 26, scope: !70)
!89 = !DILocation(line: 26, column: 54, scope: !70)
!90 = !DILocation(line: 27, column: 10, scope: !91)
!91 = distinct !DILexicalBlock(scope: !70, file: !2, line: 27, column: 9)
!92 = !DILocation(line: 27, column: 9, scope: !70)
!93 = !DILocation(line: 27, column: 15, scope: !91)
!94 = !DILocation(line: 29, column: 16, scope: !70)
!95 = !DILocation(line: 29, column: 5, scope: !70)
!96 = !DILocation(line: 29, column: 10, scope: !70)
!97 = !DILocation(line: 29, column: 14, scope: !70)
!98 = !{!99, !80, i64 0}
!99 = !{!"", !80, i64 0, !81, i64 4, !80, i64 56, !85, i64 64, !85, i64 72}
!100 = !DILocation(line: 30, column: 13, scope: !70)
!101 = !DILocation(line: 30, column: 18, scope: !70)
!102 = !DILocation(line: 30, column: 32, scope: !70)
!103 = !DILocation(line: 30, column: 5, scope: !70)
!104 = !DILocation(line: 31, column: 5, scope: !70)
!105 = !DILocation(line: 31, column: 10, scope: !70)
!106 = !DILocation(line: 31, column: 19, scope: !70)
!107 = !{!99, !80, i64 56}
!108 = !DILocation(line: 33, column: 39, scope: !70)
!109 = !DILocation(line: 33, column: 5, scope: !70)
!110 = !DILocation(line: 33, column: 10, scope: !70)
!111 = !DILocation(line: 33, column: 18, scope: !70)
!112 = !{!99, !85, i64 64}
!113 = !DILocation(line: 34, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !70, file: !2, line: 34, column: 9)
!115 = !DILocation(line: 34, column: 14, scope: !114)
!116 = !DILocation(line: 34, column: 9, scope: !70)
!117 = !DILocation(line: 35, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !2, line: 34, column: 23)
!119 = !DILocation(line: 35, column: 14, scope: !118)
!120 = !DILocation(line: 35, column: 23, scope: !118)
!121 = !DILocation(line: 35, column: 45, scope: !118)
!122 = !{!123, !124, i64 0}
!123 = !{!"", !124, i64 0, !125, i64 8, !85, i64 16}
!124 = !{!"long long", !81, i64 0}
!125 = !{!"double", !81, i64 0}
!126 = !DILocation(line: 36, column: 9, scope: !118)
!127 = !DILocation(line: 36, column: 14, scope: !118)
!128 = !DILocation(line: 36, column: 23, scope: !118)
!129 = !DILocation(line: 36, column: 39, scope: !118)
!130 = !{!123, !125, i64 8}
!131 = !DILocation(line: 38, column: 54, scope: !118)
!132 = !DILocation(line: 38, column: 9, scope: !118)
!133 = !DILocation(line: 38, column: 14, scope: !118)
!134 = !DILocation(line: 38, column: 23, scope: !118)
!135 = !DILocation(line: 38, column: 37, scope: !118)
!136 = !{!123, !85, i64 16}
!137 = !DILocation(line: 39, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !118, file: !2, line: 39, column: 13)
!139 = !DILocation(line: 39, column: 18, scope: !138)
!140 = !DILocation(line: 39, column: 27, scope: !138)
!141 = !DILocation(line: 39, column: 13, scope: !118)
!142 = !DILocation(line: 40, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !2, line: 39, column: 42)
!144 = !DILocation(line: 40, column: 18, scope: !143)
!145 = !DILocation(line: 40, column: 27, scope: !143)
!146 = !DILocation(line: 40, column: 42, scope: !143)
!147 = !DILocation(line: 40, column: 52, scope: !143)
!148 = !{!149, !80, i64 0}
!149 = !{!"", !80, i64 0, !85, i64 8, !85, i64 16}
!150 = !DILocation(line: 42, column: 63, scope: !143)
!151 = !DILocation(line: 42, column: 13, scope: !143)
!152 = !DILocation(line: 42, column: 18, scope: !143)
!153 = !DILocation(line: 42, column: 27, scope: !143)
!154 = !DILocation(line: 42, column: 42, scope: !143)
!155 = !DILocation(line: 42, column: 54, scope: !143)
!156 = !{!149, !85, i64 8}
!157 = !DILocation(line: 43, column: 20, scope: !143)
!158 = !DILocation(line: 43, column: 25, scope: !143)
!159 = !DILocation(line: 43, column: 34, scope: !143)
!160 = !DILocation(line: 43, column: 49, scope: !143)
!161 = !DILocation(line: 43, column: 13, scope: !143)
!162 = !DILocation(line: 45, column: 64, scope: !143)
!163 = !DILocation(line: 45, column: 13, scope: !143)
!164 = !DILocation(line: 45, column: 18, scope: !143)
!165 = !DILocation(line: 45, column: 27, scope: !143)
!166 = !DILocation(line: 45, column: 42, scope: !143)
!167 = !DILocation(line: 45, column: 56, scope: !143)
!168 = !{!149, !85, i64 16}
!169 = !DILocation(line: 46, column: 9, scope: !143)
!170 = !DILocation(line: 47, column: 5, scope: !118)
!171 = !DILocation(line: 49, column: 29, scope: !70)
!172 = !DILocation(line: 49, column: 5, scope: !70)
!173 = !DILocation(line: 49, column: 10, scope: !70)
!174 = !DILocation(line: 49, column: 20, scope: !70)
!175 = !{!99, !85, i64 72}
!176 = !DILocation(line: 50, column: 12, scope: !70)
!177 = !DILocation(line: 50, column: 17, scope: !70)
!178 = !DILocation(line: 50, column: 5, scope: !70)
!179 = !DILocation(line: 52, column: 12, scope: !70)
!180 = !DILocation(line: 52, column: 5, scope: !70)
!181 = !DILocation(line: 53, column: 1, scope: !70)
!182 = !DISubprogram(name: "malloc", scope: !183, file: !183, line: 672, type: !184, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!183 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "7fa2ecb2348a66f8b44ab9a15abd0b72")
!184 = !DISubroutineType(types: !185)
!185 = !{!186, !187}
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !188, line: 18, baseType: !189)
!188 = !DIFile(filename: "/usr/lib/llvm-18/lib/clang/18/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!189 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!190 = !DISubprogram(name: "strncpy", scope: !191, file: !191, line: 144, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!191 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "165db1185644f68894fa9e0d17055d70")
!192 = !DISubroutineType(types: !193)
!193 = !{!58, !194, !195, !187}
!194 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !58)
!195 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !73)
!196 = !DISubprogram(name: "strcpy", scope: !191, file: !191, line: 141, type: !197, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!197 = !DISubroutineType(types: !198)
!198 = !{!58, !194, !195}
!199 = distinct !DISubprogram(name: "cleanup_process_control_block", scope: !2, file: !2, line: 55, type: !200, scopeLine: 55, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, retainedNodes: !202)
!200 = !DISubroutineType(types: !201)
!201 = !{null, !34}
!202 = !{!203}
!203 = !DILocalVariable(name: "pcb", arg: 1, scope: !199, file: !2, line: 55, type: !34)
!204 = !DILocation(line: 55, column: 57, scope: !199)
!205 = !DILocation(line: 56, column: 10, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !2, line: 56, column: 9)
!207 = !DILocation(line: 56, column: 9, scope: !199)
!208 = !DILocation(line: 56, column: 15, scope: !206)
!209 = !DILocation(line: 58, column: 9, scope: !210)
!210 = distinct !DILexicalBlock(scope: !199, file: !2, line: 58, column: 9)
!211 = !DILocation(line: 58, column: 14, scope: !210)
!212 = !DILocation(line: 58, column: 9, scope: !199)
!213 = !DILocation(line: 59, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !215, file: !2, line: 59, column: 13)
!215 = distinct !DILexicalBlock(scope: !210, file: !2, line: 58, column: 23)
!216 = !DILocation(line: 59, column: 18, scope: !214)
!217 = !DILocation(line: 59, column: 27, scope: !214)
!218 = !DILocation(line: 59, column: 13, scope: !215)
!219 = !DILocation(line: 60, column: 18, scope: !220)
!220 = distinct !DILexicalBlock(scope: !214, file: !2, line: 59, column: 42)
!221 = !DILocation(line: 60, column: 23, scope: !220)
!222 = !DILocation(line: 60, column: 32, scope: !220)
!223 = !DILocation(line: 60, column: 13, scope: !220)
!224 = !DILocation(line: 61, column: 9, scope: !220)
!225 = !DILocation(line: 63, column: 5, scope: !215)
!226 = !DILocation(line: 66, column: 1, scope: !199)
!227 = !DISubprogram(name: "free", scope: !183, file: !183, line: 687, type: !228, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!228 = !DISubroutineType(types: !229)
!229 = !{null, !186}
!230 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 68, type: !231, scopeLine: 68, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, retainedNodes: !233)
!231 = !DISubroutineType(types: !232)
!232 = !{!39}
!233 = !{!234}
!234 = !DILocalVariable(name: "my_process", scope: !230, file: !2, line: 71, type: !34)
!235 = !DILocation(line: 69, column: 5, scope: !230)
!236 = !DILocation(line: 71, column: 5, scope: !230)
!237 = !DILocation(line: 71, column: 26, scope: !230)
!238 = !DILocation(line: 71, column: 39, scope: !230)
!239 = !DILocation(line: 73, column: 9, scope: !240)
!240 = distinct !DILexicalBlock(scope: !230, file: !2, line: 73, column: 9)
!241 = !DILocation(line: 73, column: 9, scope: !230)
!242 = !DILocation(line: 74, column: 70, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !2, line: 73, column: 21)
!244 = !DILocation(line: 74, column: 82, scope: !243)
!245 = !DILocation(line: 74, column: 96, scope: !243)
!246 = !DILocation(line: 74, column: 108, scope: !243)
!247 = !DILocation(line: 74, column: 9, scope: !243)
!248 = !DILocation(line: 75, column: 5, scope: !243)
!249 = !DILocation(line: 77, column: 35, scope: !230)
!250 = !DILocation(line: 77, column: 5, scope: !230)
!251 = !DILocation(line: 79, column: 5, scope: !230)
!252 = !DILocation(line: 81, column: 1, scope: !230)
!253 = !DILocation(line: 80, column: 5, scope: !230)
!254 = !DISubprogram(name: "printf", scope: !255, file: !255, line: 363, type: !256, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!255 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "1e435c46987a169d9f9186f63a512303")
!256 = !DISubroutineType(types: !257)
!257 = !{!39, !195, null}
