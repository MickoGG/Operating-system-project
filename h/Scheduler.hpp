#ifndef PROJECT_BASE_V1_1_SCHEDULER_HPP
#define PROJECT_BASE_V1_1_SCHEDULER_HPP

#include "../h/TCB.hpp"

class Scheduler {
private:
    static TCB *readyThreadsHead;
    static TCB *readyThreadsTail;

    Scheduler() {};
public:
    static TCB* get();

    static void put(TCB *tcb);
};

#endif