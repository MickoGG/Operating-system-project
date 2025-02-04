#ifndef PROJECT_BASE_V1_1_LIST_HPP
#define PROJECT_BASE_V1_1_LIST_HPP

#include "MemoryAllocator.hpp"

template<typename T>
class List {
private:
    typedef struct elem {
        struct elem *next;
        T data;

        void* operator new(size_t size);
        void operator delete(void *p);
        void* operator new[](size_t size);
        void operator delete[](void *p);
    } Elem;

    Elem *head = nullptr, *tail = nullptr, *current = nullptr;
public:
    List() = default;
    List(const List &) = delete;
    List& operator=(const List &) = delete;
    ~List();

    int getSize() const;

    void add(T data);

    void removeCurrent();

    void setCurrentOnFirst();

    void setCurrentOnNext();

    bool isEnd() const;

    T getCurrent() const;
};


template<typename T>
List<T>::~List() {
    while (head) {
        Elem *old = head;
        head = head->next;
        delete old;
    }
    head = tail = current = nullptr;
}

template<typename T>
int List<T>::getSize() const {
    int size = 0;
    for (Elem *elem = head; elem; elem = elem->next) size++;
    return size;
}

template<typename T>
void List<T>::add(T data) {
    Elem *elem = new Elem();
    elem->data = data;
    elem->next = nullptr;

    (head == nullptr) ? head = elem : tail->next = elem;
    tail = elem;
}

template<typename T>
void List<T>::removeCurrent() {
    if (current == nullptr) return;
    else if (current == head) {
        head = head->next;
        if (!head) tail = nullptr;
        delete current;
        current = head;
    }
    else {
        Elem *prev = head;
        while (prev->next != current) prev = prev->next;
        if (tail == current) tail = prev;
        prev->next = current->next;
        delete current;
        current = prev->next;
    }
}

template<typename T>
void List<T>::setCurrentOnFirst() {
    current = head;
}

template<typename T>
void List<T>::setCurrentOnNext() {
    if (current) current = current->next;
}

template<typename T>
bool List<T>::isEnd() const {
    return !current;
}

template<typename T>
T List<T>::getCurrent() const {
    if (current) return current->data;
    else return 0;
}


template<typename T>
void* List<T>::Elem::operator new(size_t size) {
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    return MemoryAllocator::memoryAllocate(numOfBlocks);
}

template<typename T>
void List<T>::Elem::operator delete(void *p) {
    MemoryAllocator::memoryFree(p);
}

template<typename T>
void* List<T>::Elem::operator new[](size_t size) {
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    return MemoryAllocator::memoryAllocate(numOfBlocks);
}

template<typename T>
void List<T>::Elem::operator delete[](void *p) {
    MemoryAllocator::memoryFree(p);
}

#endif