#include "../h/_sem.hpp"
#include "../h/Scheduler.hpp"

void* _sem::operator new(size_t size) {
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    return MemoryAllocator::memoryAllocate(numOfBlocks);
}

void _sem::operator delete(void *p) {
    MemoryAllocator::memoryFree(p);
}

void* _sem::operator new[](size_t size) {
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    return MemoryAllocator::memoryAllocate(numOfBlocks);
}

void _sem::operator delete[](void *p) {
    MemoryAllocator::memoryFree(p);
}


_sem::~_sem() {
    closed = true;
    for (int i = 0; i < -value; i++) unblock(this);
    value = 0;
}


void _sem::block(_sem *id) {
    TCB *running = TCB::getRunningThread();
    id->blockedList.add(running);
    running->status = TCB::BLOCKED;
    TCB::dispatch();
}


void _sem::unblock(_sem *id) {
    id->blockedList.setCurrentOnFirst();
    TCB *tcb = id->blockedList.getCurrent();
    id->blockedList.removeCurrent();

    tcb->status = TCB::RUNNABLE;
    Scheduler::put(tcb);
}


int _sem::open(_sem **handle, uint32 init) {
    *handle = new _sem(init);

    if (*handle != nullptr) return 0;
    else return -1;
}


int _sem::close(_sem *handle) {
    if (!handle) return -1;
    else if (handle->closed) return -2;
    delete handle;
    return 0;
}


int _sem::wait(_sem *id) {
    if (!id) return -1;
    else if (id->closed) return -2;
    else if (--id->value < 0) block(id);

    if (id->closed) return -3;    // If _sem is dealocated while thread is blocked on it
    return 0;
}


int _sem::signal(_sem *id) {
    if (!id) return -1;
    else if (id->closed) return -2;
    else if (++id->value <= 0) unblock(id);
    return 0;
}
