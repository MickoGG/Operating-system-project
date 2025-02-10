#include "../h/syscall_c.hpp"
#include "../h/Riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"

volatile uint64 ret;

void* mem_alloc(size_t size) {
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;

    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (numOfBlocks));
    asm volatile ("mv a0, %0" : : "r" (Riscv::MEM_ALLOC));
    asm volatile ("ecall");

    return (void *) ret;
}

int mem_free(void *p) {
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (p));
    asm volatile ("mv a0, %0" : : "r" (Riscv::MEM_FREE));
    asm volatile ("ecall");

    return (int) ret;
}

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    // Alocate stack
    uint64 *stack_space = nullptr;
    if (start_routine != nullptr) stack_space = (uint64 *) new uint64[STACK_SIZE];

    // Going into interrupt routine
    asm volatile ("mv a4, %0" : : "r" (stack_space));
    asm volatile ("mv a3, %0" : : "r" (arg));
    asm volatile ("mv a2, %0" : : "r" (start_routine));
    asm volatile ("mv a1, %0" : : "r" (handle));
    asm volatile ("mv a0, %0" : : "r" (Riscv::THREAD_CREATE));
    asm volatile ("ecall");

    return (int) ret;
}

int thread_exit() {
    if (TCB::getRunningThread()->getIsMainThread()) return -1;

    // Going into interrupt routine
    asm volatile ("mv a0, %0" : : "r" (Riscv::THREAD_EXIT));
    asm volatile ("ecall");

    return 0;
}

void thread_dispatch(){
    // Going into interrupt routine
    asm volatile ("mv a0, %0" : : "r" (Riscv::THREAD_DISPATCH));
    asm volatile ("ecall");
}

void thread_join(thread_t handle){
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (handle));
    asm volatile ("mv a0, %0" : : "r" (Riscv::THREAD_JOIN));
    asm volatile ("ecall");
}

int sem_open(sem_t *handle, unsigned init) {
    // Going into interrupt routine
    asm volatile ("mv a2, %0" : : "r" (init));
    asm volatile ("mv a1, %0" : : "r" (handle));
    asm volatile ("mv a0, %0" : : "r" (Riscv::SEM_OPEN));
    asm volatile ("ecall");

    return (int) ret;
}

int sem_close(sem_t handle) {
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (handle));
    asm volatile ("mv a0, %0" : : "r" (Riscv::SEM_CLOSE));
    asm volatile ("ecall");

    return (int) ret;
}

int sem_wait(sem_t id) {
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (id));
    asm volatile ("mv a0, %0" : : "r" (Riscv::SEM_WAIT));
    asm volatile ("ecall");

    return (int) ret;
}

int sem_signal(sem_t id) {
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (id));
    asm volatile ("mv a0, %0" : : "r" (Riscv::SEM_SIGNAL));
    asm volatile ("ecall");

    return (int) ret;
}

char getc() {
    // Going into interrupt routine
    asm volatile ("mv a0, %0" : : "r" (Riscv::GETC));
    asm volatile ("ecall");

    volatile char c;
    asm volatile ("mv %0, a0" : "=r" (c));

    return c;
}

void putc(char c) {
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (c));
    asm volatile ("mv a0, %0" : : "r" (Riscv::PUTC));
    asm volatile ("ecall");
}

int getThreadId() {
    // Going into interrupt routine
    asm volatile ("mv a0, %0" : : "r" (Riscv::getThreadId));
    asm volatile ("ecall");

    int r = (int) ret;
    thread_dispatch();

    return r;
}
