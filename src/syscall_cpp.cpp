#include "../h/syscall_cpp.hpp"
#include "../h/Scheduler.hpp"
#include "../h/_sem.hpp"

void* operator new (size_t size) {
    return mem_alloc(size);
}

void operator delete (void *p) {
    mem_free(p);
}

void* operator new[] (size_t size) {
    return mem_alloc(size);
}

void operator delete[] (void* p) {
    mem_free(p);
}


Thread::Thread(void (*body)(void *), void *arg) : myHandle(nullptr), body(body), arg(arg) {
    thread_create(&myHandle, body, arg);
}

Thread::Thread() : myHandle(nullptr), body(threadWrapper), arg(this) {
    thread_create(&myHandle, body, arg);
}

Thread::~Thread() {
    myHandle->setFinished();
    delete myHandle;
}

int Thread::start() {
    if (body != threadWrapper) return -1;
    Scheduler::put(myHandle);
    return 0;
}

void Thread::join() {
    if (myHandle) thread_join(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return 0;
}

void Thread::threadWrapper(void *arg) {
    ((Thread *) arg)->run();
}

int Thread::getThreadId() {
    return ::getThreadId();
}

void Thread::setMaximumThreads(int num_of_threads) {
    TCB::setMaximumThreads(num_of_threads);
}


Semaphore::Semaphore(unsigned init) {
    this->myHandle = nullptr;
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}


char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
