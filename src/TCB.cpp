#include "../h/TCB.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/Riscv.hpp"
#include "../h/Scheduler.hpp"

TCB* TCB::runningThread = nullptr;
int TCB::staticID = 0;
int TCB::maxNumOfThreads = 5;
int TCB::currNumOfThreads = -2;
List<TCB *>* TCB::blockedThreads = nullptr;


void* TCB::operator new(size_t size) {
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    return MemoryAllocator::memoryAllocate(numOfBlocks);
}

void TCB::operator delete(void *p) {
    MemoryAllocator::memoryFree(p);
}

void* TCB::operator new[](size_t size) {
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    return MemoryAllocator::memoryAllocate(numOfBlocks);
}

void TCB::operator delete[](void *p) {
    MemoryAllocator::memoryFree(p);
}


TCB::TCB(void (*start_routine)(void *), void *arg, uint64 *stack_space) : body(start_routine), arg(arg), stack(stack_space) {
    context.sp = stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0;
    context.ra = (uint64) &thread_wrapper;

    if (++currNumOfThreads > maxNumOfThreads) {
        this->status = BLOCKED;
        blockedThreads->add(this);
    }
    else if (start_routine && start_routine != Thread::threadWrapper) Scheduler::put(this);
}


int TCB::createTCB(TCB **handle, void (*start_routine)(void *), void *arg, uint64 *stack_space) {
    *handle = new TCB(start_routine, arg, stack_space);

    if (*handle != nullptr) return 0;
    else return -1;
}


void TCB::yield() {
    asm volatile ("mv a0, %0" : : "r" (0x13));
    asm volatile ("ecall");
}


void TCB::releaseJoinedThreads() {
    runningThread->listOfJoins.setCurrentOnFirst();
    while (!runningThread->listOfJoins.isEnd()) {
        TCB *tcb = runningThread->listOfJoins.getCurrent();
        tcb->status = RUNNABLE;
        Scheduler::put(tcb);
        runningThread->listOfJoins.removeCurrent();    // Removes current and sets current on next
    }
}


void TCB::releaseBlockedThread() {
    blockedThreads->setCurrentOnFirst();
    TCB *tcb = blockedThreads->getCurrent();
    if (tcb) {
        tcb->status = RUNNABLE;
        Scheduler::put(tcb);
        blockedThreads->removeCurrent();
    }
}


void TCB::thread_wrapper() {
    Riscv::checkThreadMode();
    runningThread->body(runningThread->arg);

    releaseJoinedThreads();
    if (currNumOfThreads > maxNumOfThreads) releaseBlockedThread();
    runningThread->status = FINISHED;
    currNumOfThreads--;
    yield();
}


int TCB::exit() {
    releaseJoinedThreads();
    if (currNumOfThreads > maxNumOfThreads) releaseBlockedThread();
    runningThread->status = FINISHED;
    currNumOfThreads--;

    TCB *old = runningThread;
    runningThread = Scheduler::get();
    Context oldContext = old->context;
    delete old;
    TCB::switchContext(&oldContext, &runningThread->context);

    return 0;
}


void TCB::dispatch() {
    TCB *old = runningThread;
    if (old->status == RUNNABLE) Scheduler::put(old);
    runningThread = Scheduler::get();

    if (old != runningThread) TCB::switchContext(&old->context, &runningThread->context);
}


void TCB::join(TCB *handle) {
    if (handle && handle->status != FINISHED) {
        runningThread->status = JOINED;
        handle->listOfJoins.add(runningThread);
        dispatch();
    }
}


void TCB::setMaximumThreads(int num_of_threads) {
    if (num_of_threads < 1) return;
    maxNumOfThreads = num_of_threads;
}
