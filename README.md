# Operating system project

### Implementation of operating system kernel for RISC-V architecture.

This is a college project and the text of the project can be found in **`Project.pdf`** (Serbian language).

OS kernel is implemented for **RISC-V** architecture and is ran in **qemu emulator**. Qemu is used for emulation of 64-bit RISC-V architecture. No external libraries are used, meaning that it's not allowed to use any system calls from host's operating system (memory allocation, threads, semaphores, interrupts etc.) and everything is written from scratch.

## Layers

The kernel provides **three interfaces** to the user program that are organized in layers:
- **C++ OO API**
- **C API**
- **ABI**

Code for all the layers is being run in a unique address space. Kernel code and code with hardware access runs in a **privileged mode** (system mode), while everything else runs in a **user mode**.

**ABI (Application Binary Interface)** is a binary interface for system calls, which are called by software interrupts. This layer provides sending arguments to system calls through processor registers, switching to privileged mode and going into kernel code.

**C API (Application Programming Interface)** is a classic, procedural programming interface for system calls implemented as set of C functions. These functions act as a wrapper for ABI interface.

**C++ API** is an object oriented API that provides an object view on concepts that the kernel supports. It serves as an object oriented wrapper for functions from C API.

## Available system calls

| Number | C API System Call | Description |
| ------ | ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 0x01   | `void* mem_alloc(size_t size);`                                                                                          | Alocates size bytes of memory, rounded and aligned on block of size MEM_BLOCK_SIZE. Returns a pointer to the memory block if successfull, or null if not.                                                                                                                      |
| 0x02   | `int mem_free(void*);`                                                                                                   | Free's memory previously alocated with mem_alloc. Return's 0 in case of success or else, negative value (error code). Argument must be a returned value of mem_alloc. If that's not the case, action is undefined: kernel might return an error or do something unpredictable. |
| 0x11   | `class _thread; typedef _thread* thread_t; int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);` | Starts a thread of function start_routine, calling it with argument arg. In case of success, \*handle will contain the handle for the thread and return value will be 0, or else a negative value. "Handle" is used to indentify threads.                                      |
| 0x12   | `int thread_exit(); `                                                                                                    | Turns off the active thread. In case of an error, return a negative value.                                                                                                                                                                                                     |
| 0x13   | `void thread_dispach();`                                                                                                 | Potentially takes the processor from active thread and gives it to some other thread.                                                                                                                                                                                          |
| 0x14   | `void thread_join(thread_t handle);`                                                                                     | Suspends the running thread until the thread with the given handle terminates.                                                                                                                                                                                                 |
| 0x21   | `class _sem; typedef _sem* sem_t; int sem_open(sem_t* handle, unsigned init);`                                           | Creates a semaphore with an initial value of init. In case of success, \*handle will contain the handle for the semaphore and the return value will be 0, or else, return would be a negative value. "Handle" is used to identify semaphores.                                  |
| 0x22   | `int sem_close(sem_t handle);`                                                                                           | Free's the semaphore with the handle identifier. All threads that were blocked on this semaphore are deblocked, and their `wait` returns an error. Returns 0 in case of succes, or else a negative value.                                                                      |
| 0x23   | `int sem_wait(sem_t id);`                                                                                                | Operation wait for semaphore in argument. Returns 0 in case of succes, or else even in the situation when the semaphore is dealocated while the active thread is waiting on him, returns a negative value.                                                                     |
| 0x24   | `int sem_signal(sem_t id);`                                                                                              | Operation signal for semaphore in argument. Returns 0 in case of succes, or else a negative value.                                                                                                                                                                             |
| 0x41   | `const int EOF = -1; char getc();`                                                                                       | Loads a character from the character buffer loaded from console. In case the buffer is empty, suspends active thread until a character appears. Returns loaded char in case of success, or else EOF.                                                                           |
| 0x42   | `void putc(char);`                                                                                                       | Writes char from argument in to the console.                                                                                                                                                                                                                                   |

### In short, the kernel provides:
- Memory allocation and deallocation
- Threads and thread scheduling
- Semaphores
- Synchronous context switching
- Asynchronous context switching (not yet implemented)
- Console interface (not yet implemented, it's using an existing implementation from **`lib/console.lib`**)
