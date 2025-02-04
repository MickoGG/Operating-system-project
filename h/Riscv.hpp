#ifndef PROJECT_BASE_V1_1_RISCV_HPP
#define PROJECT_BASE_V1_1_RISCV_HPP

#include "../lib/hw.h"

extern "C" void interrupt();

class Riscv {
private:
    static void handleSoftwareInterrupt();
    static void handleTimerInterrupt();
    static void handleConsoleInterrupt();

    enum BitMaskSstatus {
        SSTATUS_SIE = (1 << 1),
        SSTATUS_SPIE = (1 << 5),
        SSTATUS_SPP = (1 << 8)
    };

    enum BitMaskSip {
        SIP_SSIP = (1 << 1),
        SIP_SEIP = (1 << 9)
    };

    static uint64 read_scause();

    static uint64 read_sepc();
    static void write_sepc(uint64 sepc);

    static uint64 read_sstatus();
    static void write_sstatus(uint64 sstatus);
    static void setBit_sstatus(uint64 mask);
    static void clearBit_sstatus(uint64 mask);

    static void clearBit_sip(uint64 mask);
public:
    enum Mode {USER_MODE, PRIVILEGED_MODE};
    static Mode mode;

    enum Code {
        MEM_ALLOC = 0x01,
        MEM_FREE = 0x02,
        THREAD_CREATE = 0x11,
        THREAD_EXIT = 0x12,
        THREAD_DISPATCH = 0x13,
        THREAD_JOIN = 0x14,
        SEM_OPEN = 0x21,
        SEM_CLOSE = 0x22,
        SEM_WAIT = 0x23,
        SEM_SIGNAL = 0x24,
        GETC = 0x41,
        PUTC = 0x42,
        getThreadId = 0x51
    };

    static void checkThreadMode();
};


inline uint64 Riscv::read_scause() {
    volatile uint64 scause;
    asm volatile ("csrr %0, scause" : "=r" (scause));
    return scause;
}

inline uint64 Riscv::read_sepc() {
    volatile uint64 sepc;
    asm volatile ("csrr %0, sepc" : "=r" (sepc));
    return sepc;
}

inline void Riscv::write_sepc(uint64 sepc) {
    asm volatile ("csrw sepc, %0" : : "r" (sepc));
}

inline uint64 Riscv::read_sstatus() {
    volatile uint64 sstatus;
    asm volatile ("csrr %0, sstatus" : "=r" (sstatus));
    return sstatus;
}

inline void Riscv::write_sstatus(uint64 sstatus) {
    asm volatile ("csrw sstatus, %0" : : "r" (sstatus));
}

inline void Riscv::setBit_sstatus(uint64 mask) {
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
}

inline void Riscv::clearBit_sstatus(uint64 mask) {
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
}

inline void Riscv::clearBit_sip(uint64 mask) {
    asm volatile ("csrc sip, %0" : : "r" (mask));
}

#endif