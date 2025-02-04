#include "../h/Scheduler.hpp"

TCB* Scheduler::readyThreadsHead = nullptr;
TCB* Scheduler::readyThreadsTail = nullptr;

TCB* Scheduler::get() {
    TCB *tcb = readyThreadsHead;
    if (tcb) {
        readyThreadsHead = tcb->getNextInScheduler();
        if (!readyThreadsHead) readyThreadsTail = nullptr;
        tcb->setNextInScheduler(nullptr);
    }
    return tcb;
}

void Scheduler::put(TCB *tcb) {
    if (readyThreadsHead == nullptr){
        readyThreadsHead = tcb;
        readyThreadsTail = tcb;
    }
    else {
        readyThreadsTail->setNextInScheduler(tcb);
        readyThreadsTail = tcb;
    }
}
