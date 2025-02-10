#include "../h/MemoryAllocator.hpp"

MemoryAllocator::Node* MemoryAllocator::freeSegmentsHead = nullptr;
bool MemoryAllocator::initDone = false;

void MemoryAllocator::initFreeSegmentsList() {
    if (!initDone) {
        freeSegmentsHead = (Node *) ((void *) HEAP_START_ADDR);
        freeSegmentsHead->limit = (uint64) HEAP_END_ADDR - (uint64) HEAP_START_ADDR;
        freeSegmentsHead->next = nullptr;
        initDone = true;
    }
}


void* MemoryAllocator::memoryAllocate(uint64 numOfBlocks) {
    volatile size_t size = numOfBlocks * MEM_BLOCK_SIZE;

    // Try to find free segment
    Node *curr = freeSegmentsHead, *prev = nullptr;

    for (; curr; curr = curr->next) {
        if (curr->limit >= size) {
            if (curr->limit > size) {
                Node *newNode = (Node *) ((char *) curr + size);
                if (prev) prev->next = newNode;
                else freeSegmentsHead = newNode;
                newNode->next = curr->next;
                newNode->limit = curr->limit - size;

                curr->limit = size;
            } else {
                if (prev) prev->next = curr->next;
                else freeSegmentsHead = curr->next;
            }

            curr->next = nullptr;

            return (char *) curr + sizeof(Node);
        }
        prev = curr;
    }

    // If free segment is not found
    return nullptr;
}


int MemoryAllocator::memoryFree(void *p) {
    if (p == nullptr) return -1;
    p = (void *) ((char *) p - sizeof(Node));
    size_t size = ((Node *) p)->limit;
    Node *curr = freeSegmentsHead, *prev = nullptr;

    for (; curr; curr = curr->next) {
        if (prev != nullptr && (char *) p == (char *) prev + prev->limit && (char *) p + size == (char *) curr) {   // Tacno izmedju dva free segmenta
            prev->limit += size + curr->limit;

            prev->next = curr->next;
            curr->next = nullptr;
            break;
        } else if (prev != nullptr && (char *) p == (char *) prev + prev->limit) {   // Odma nakon free segmenta
            prev->limit += size;
            break;
        } else if ((char *) p + size == (char *) curr) {   // Odma pre free segmenta
            Node *mergedFreeSegment = (Node *) p;
            if (prev) prev->next = mergedFreeSegment;
            else freeSegmentsHead = mergedFreeSegment;
            mergedFreeSegment->next = curr->next;
            curr->next = nullptr;
            mergedFreeSegment->limit += curr->limit;
            break;
        } else if ((char *) p < (char *) curr) {   // Negde izmedju bez dodirivanja bilo kog free segmenta
            Node *newFreeSegment = (Node *) p;
            if (prev) prev->next = newFreeSegment;
            else freeSegmentsHead = newFreeSegment;
            newFreeSegment->next = curr;
            break;
        }
        prev = curr;
    }

    if (curr == nullptr) {
        Node *newFreeSegment = (Node *) p;
        if (prev) prev->next = newFreeSegment;
        else freeSegmentsHead = newFreeSegment;
        newFreeSegment->next = curr;
    }

    return 0;
}
