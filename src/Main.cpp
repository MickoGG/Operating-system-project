#include "../h/Riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"
#include "../test/printing.hpp"

extern void userMain();

void userWrapper(void *arg) {
    printString("---User Main started.---\n");
    userMain();
    printString("---User Main ended.---\n");
    *(bool *) arg = true;
}

int main() {
    // Initialization
    asm volatile ("csrw stvec, %0" : : "r" ((uint64) &interrupt | 0b01));
    MemoryAllocator::initFreeSegmentsList();
    TCB::initBlockedThreadsList();

    // Main thread
    TCB *mainThread;
    thread_create(&mainThread, nullptr, nullptr);
    TCB::initRunningThread(mainThread);

    // Starting user mode
    Riscv::mode = Riscv::USER_MODE;
    asm volatile ("ecall");
    printString("---User mode started.---\n");

    bool userMainEnded = false;

    // User thread
    TCB *userThread;
    thread_create(&userThread, userWrapper, &userMainEnded);

    // Wait for user main to finish
    while (!userMainEnded) {
        thread_dispatch();
    }

    // Ending user mode
    printString("---User mode ended.---\n\n");
    Riscv::mode = Riscv::PRIVILEGED_MODE;
    asm volatile ("ecall");

    // Finalize
    TCB::finalizeTCB();
    delete userThread;
    delete mainThread;

    return 0;
}
