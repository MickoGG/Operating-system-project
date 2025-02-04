#include "../h/Riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"
#include "../h/_sem.hpp"
#include "../lib/console.h"
#include "../test/printing.hpp"

extern volatile uint64 ret;

Riscv::Mode Riscv::mode = PRIVILEGED_MODE;

void Riscv::checkThreadMode() {
    if (mode == USER_MODE) {
        clearBit_sstatus(SSTATUS_SPP);    // clear SPP bit in sstatus register
    }
    else {
        setBit_sstatus(SSTATUS_SPP);    // set SPP bit in sstatus register
        clearBit_sstatus(SSTATUS_SPIE);    // disallow interrupts in privileged mode
    }

    asm volatile("csrw sepc, ra");
    asm volatile("sret");
}


void Riscv::handleSoftwareInterrupt() {
    // Get parameters
    volatile uint64 param4;
    volatile uint64 param3;
    volatile uint64 param2;
    volatile uint64 param1;
    volatile uint64 functionCode;

    asm volatile ("mv %0, a4" : "=r" (param4));
    asm volatile ("mv %0, a3" : "=r" (param3));
    asm volatile ("mv %0, a2" : "=r" (param2));
    asm volatile ("mv %0, a1" : "=r" (param1));
    asm volatile ("mv %0, a0" : "=r" (functionCode));

    // Handle interrupt
    volatile uint64 scause = read_scause();

    if (scause == 0x0000000000000008 || scause == 0x0000000000000009) {
        // Get pc and sstatus
        volatile uint64 sepc = read_sepc();
        volatile uint64 sstatus = read_sstatus();

        switch (functionCode) {
            case MEM_ALLOC:
                ret = (uint64) MemoryAllocator::memoryAllocate(param1);
                break;
            case MEM_FREE:
                ret = MemoryAllocator::memoryFree((void *) param1);
                break;
            case THREAD_CREATE:
                ret = TCB::createTCB
                        ((TCB **) param1, (void (*)(void *)) param2, (void *) param3, (uint64 *) param4);
                break;
            case THREAD_EXIT:
                TCB::exit();
                break;
            case THREAD_DISPATCH:
                TCB::dispatch();
                break;
            case THREAD_JOIN:
                TCB::join((TCB *) param1);
                break;
            case SEM_OPEN:
                ret = _sem::open((_sem **) param1, param2);
                break;
            case SEM_CLOSE:
                ret = _sem::close((_sem *) param1);
                break;
            case SEM_WAIT:
                ret = _sem::wait((_sem *) param1);
                break;
            case SEM_SIGNAL:
                ret = _sem::signal((_sem *) param1);
                break;
            case GETC: {
                volatile char c = __getc();
                if (c == 0) asm volatile ("mv a0, %0" : : "r" (EOF));
                else asm volatile ("mv a0, %0" : : "r" (c));
                break;
            }
            case PUTC:
                __putc((char) param1);
                break;
            case getThreadId:
                ret = TCB::getRunningThread()->id;
                break;
            default:
                break;
        }

        // Set sepc, sstatus and clear SSIP bit
        clearBit_sip(SIP_SSIP);
        write_sstatus(sstatus);
        write_sepc(sepc + 4);
    }
    else {

        // Unexpected scause
        printString("ERROR! scause=");
        printInt((int) scause);
        printString("\n");

    }
}


void Riscv::handleTimerInterrupt() {
    clearBit_sip(SIP_SSIP);
}


void Riscv::handleConsoleInterrupt() {
    console_handler();
}
