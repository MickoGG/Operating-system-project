#ifndef PROJECT_BASE_V1_1_SYSCALL_CPP_HPP
#define PROJECT_BASE_V1_1_SYSCALL_CPP_HPP

#include "syscall_c.hpp"

void* operator new (size_t size);
void operator delete (void *p);
void* operator new[] (size_t size);
void operator delete[] (void *p);


class Thread {
public:
    Thread(void (*body)(void *), void *arg);
    virtual ~Thread();

    int start();
    void join();
    static void dispatch();

    static int sleep(time_t time);

    static int getThreadId();
    static void setMaximumThreads(int num_of_threads = 5);

    friend class TCB;
protected:
    Thread();
    virtual void run() {}
private:
    thread_t myHandle;
    void (*body)(void *);
    void *arg;
    static void threadWrapper(void *arg);
};


class Semaphore {
public:
    Semaphore(unsigned init = 1);
    virtual ~Semaphore();

    int wait();
    int signal();
private:
    sem_t myHandle;
};


class Console {
public:
    static char getc();
    static void putc(char c);
};

#endif