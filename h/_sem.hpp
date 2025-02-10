#ifndef PROJECT_BASE_V1_1__SEM_HPP
#define PROJECT_BASE_V1_1__SEM_HPP

#include "../h/syscall_c.hpp"
#include "List.hpp"

class _sem {
private:
    int value;
    List<TCB *> blockedList;

    bool closed = false;

    static int open(_sem **handle, uint32 init);
    static int close(_sem *handle);
    static int wait(_sem *id);
    static int signal(_sem *id);

    static void block(_sem *id);
    static void unblock(_sem *id);

    explicit _sem(uint32 init) : value((int) init) {}
public:
    friend class Riscv;

    ~_sem();

    void* operator new(size_t size);
    void operator delete(void *p);
    void* operator new[](size_t size);
    void operator delete[](void *p);

    int getValue() const { return value; }
};

#endif