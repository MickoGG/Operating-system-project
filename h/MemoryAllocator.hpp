#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator {
private:
    typedef struct FreeSegments {
        struct FreeSegments *next;
        size_t limit;
    } Node;

    static Node *freeSegmentsHead;
    static bool initDone;

    static void* memoryAllocate(uint64 numOfBlocks);
    static int memoryFree(void *p);
public:
    friend class Riscv;
    friend class TCB;
    friend class _sem;
    template<typename T> friend class List;

    static void initFreeSegmentsList();

    static uint64 getSizeOfNode() {
        return sizeof(Node);
    }

//    static Node* getFreeSegmentsHead() {
//        return freeSegmentsHead;
//    }
};

#endif