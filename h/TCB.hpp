#ifndef PROJECT_BASE_V1_1_TCB_HPP
#define PROJECT_BASE_V1_1_TCB_HPP

#include "List.hpp"

class TCB {
private:
    static TCB *runningThread;

    TCB *nextInScheduler = nullptr;

    TCB* getNextInScheduler() const {
        return nextInScheduler;
    }

    void setNextInScheduler(TCB *tcb) {
        nextInScheduler = tcb;
    }

    void (*body)(void *) = nullptr;
    void *arg = nullptr;
    uint64 *stack = nullptr;

    struct Context {
        uint64 sp;
        uint64 ra;
    };

    Context context{};

    enum Status{RUNNABLE, FINISHED, JOINED, BLOCKED};
    Status status = RUNNABLE;

    List<TCB *> listOfJoins;    // All threads that joined to this thread

    static int staticID;
    int id = staticID++;

    static int maxNumOfThreads;
    static int currNumOfThreads;
    static List<TCB *> *blockedThreads;

    static void thread_wrapper();
    static void releaseJoinedThreads();
    static void switchContext(Context *oldContext, Context *newContext);
    static void releaseBlockedThread();

    static int createTCB(TCB **handle, void (*start_routine)(void *), void *arg, uint64 *stack_space);
    static int exit();
    static void dispatch();
    static void join(TCB *handle);

    TCB(void (*start_routine)(void *), void *arg, uint64 *stack_space);
public:
    friend class Riscv;
    friend class Scheduler;
    friend class _sem;

    ~TCB() {
        delete[] stack;
    }

    void* operator new(size_t size);
    void operator delete(void *p);
    void* operator new[](size_t size);
    void operator delete[](void *p);

    static void initRunningThread(TCB *tcb) { if (!runningThread) runningThread = tcb; }

    static void initBlockedThreadsList() { if (!runningThread) blockedThreads = new List<TCB *>(); }

    static void finalizeTCB() { delete blockedThreads; }    // if (userMain ended) delete blockedThreads;

    static void yield();

    static TCB* getRunningThread() { return runningThread; }

    bool getFinished() const { return status == FINISHED; }

    void setFinished() { status = FINISHED; }

    int getID() const { return id; }

    bool getIsMainThread() const { return body == nullptr; }

    static void setMaximumThreads(int num_of_threads = 5);
};

#endif