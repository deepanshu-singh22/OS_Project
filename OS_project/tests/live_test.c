#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int thread_id;
    char* thread_name;
    int* cpu_registers;
} ThreadStatus;

typedef struct {
    unsigned long long instructions_executed;
    double memory_usage_mb;
    ThreadStatus* active_thread;
} ExecutionMetrics;

typedef struct {
    int pid;
    char process_name[50];
    int priority;
    ExecutionMetrics* metrics;
    char* audit_log;
} ProcessControlBlock;

ProcessControlBlock* create_process_control_block(int process_id, const char* name) {
    ProcessControlBlock* pcb = (ProcessControlBlock*)malloc(sizeof(ProcessControlBlock));
    if (!pcb) return NULL;

    pcb->pid = process_id;
    strncpy(pcb->process_name, name, sizeof(pcb->process_name) - 1);
    pcb->priority = 1;

    pcb->metrics = (ExecutionMetrics*)malloc(sizeof(ExecutionMetrics));
    if (pcb->metrics) {
        pcb->metrics->instructions_executed = 154000;
        pcb->metrics->memory_usage_mb = 64.5;

        pcb->metrics->active_thread = (ThreadStatus*)malloc(sizeof(ThreadStatus));
        if (pcb->metrics->active_thread) {
            pcb->metrics->active_thread->thread_id = 101;
            
            pcb->metrics->active_thread->thread_name = (char*)malloc(30 * sizeof(char));
            strcpy(pcb->metrics->active_thread->thread_name, "Worker_Thread_Alpha");

            pcb->metrics->active_thread->cpu_registers = (int*)malloc(8 * sizeof(int));
        }
    }

    pcb->audit_log = (char*)malloc(256 * sizeof(char));
    strcpy(pcb->audit_log, "Process initialized successfully with secure context.");

    return pcb;
}

void cleanup_process_control_block(ProcessControlBlock* pcb) {
    if (!pcb) return;
    
    if (pcb->metrics) {
        if (pcb->metrics->active_thread) {
            free(pcb->metrics->active_thread);
        }
        // free(pcb->metrics);
    }

    // free(pcb);
}

int main() {
    printf("Initializing OS Kernel Module: PCB Memory Test\n");
    
    ProcessControlBlock* my_process = create_process_control_block(42, "Virtual_OS_Daemon");
    
    if (my_process) {
        printf("Process [%s] allocated successfully with PID: %d\n", my_process->process_name, my_process->pid);
    }

    cleanup_process_control_block(my_process);

    printf("Kernel module execution finished.\n");
    return 0;
}