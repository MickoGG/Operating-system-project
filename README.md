# Operating system project

### Implementation of an operating system kernel for the RISC-V architecture.

This is a university project, and the text of the project can be found in **`Project.pdf`** (Serbian language).

The OS kernel is implemented for the **RISC-V architecture** and runs in the **QEMU emulator**. QEMU is used for emulation of **64-bit RISC-V architecture**. No external libraries are used, meaning that it's not allowed to use any system calls from the host operating system (memory allocation, threads, semaphores, interrupts etc.) and everything is written from scratch.

## Layers:

The kernel provides **three interfaces** to the user program that are organized in layers:
- **C++ OO API**
- **C API**
- **ABI**

Code for all the layers is being run in a unique address space. Kernel code and code with hardware access runs in **privileged mode** (system mode), while everything else runs in **user mode**.

**ABI (Application Binary Interface)** is a binary interface for system calls, which are called by software interrupts. This layer provides passing arguments to system calls through processor registers, switching to privileged mode and going into kernel code.

**C API (Application Programming Interface)** is a classic, procedural programming interface for system calls, implemented as a set of C functions. These functions act as a wrapper around the ABI interface.

**C++ API** is an object oriented API that provides an object oriented view on concepts that the kernel supports. It serves as an object oriented wrapper around the functions from the C API.

## Available system calls:

| Number | C API System Call | Description |
| ------ | ------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 0x01   | `void* mem_alloc(size_t size);`                                                                                          | Allocates `size` bytes of memory, rounded up and aligned to a block of size MEM_BLOCK_SIZE. Returns a pointer to the allocated memory block in case of success, otherwise, returns null.                                                                                                   |
| 0x02   | `int mem_free(void*);`                                                                                                   | Frees memory previously allocated with `mem_alloc`. Returns 0 in case of success, otherwise, a negative value (error code). The argument must be a returned value of `mem_alloc`. If that's not the case, the behavior is undefined: kernel might return an error or do something unpredictable. |
| 0x11   | `class _thread; typedef _thread* thread_t; int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);` | Starts a thread on the function `start_routine`, calling it with the argument `arg`. In case of success, `*handle` will contain the thread's handle and the return value will be 0, otherwise, a negative value is returned (error code).                                                   |
| 0x12   | `int thread_exit(); `                                                                                                    | Terminates the active thread. In case of an error, returns a negative value (error code).                                                                                                                                                                                           |
| 0x13   | `void thread_dispach();`                                                                                                 | Potentially takes the processor from the active thread and gives it to some other (or the same) thread.                                                                                                                                                                                |
| 0x14   | `void thread_join(thread_t handle);`                                                                                     | Suspends the active thread until the thread with the given `handle` terminates.                                                                                                                                                                                                      |
| 0x21   | `class _sem; typedef _sem* sem_t; int sem_open(sem_t* handle, unsigned init);`                                           | Creates a semaphore with an initial value of `init`. In case of success, `*handle` will contain the semaphore’s handle and the return value will be 0, otherwise, a negative value is returned (error code).                                                                          |
| 0x22   | `int sem_close(sem_t handle);`                                                                                           | Frees the semaphore with the given `handle`. All threads blocked on this semaphore are unblocked, and their `wait` returns an error. Returns 0 in case of success, otherwise, a negative value (error code).                                                                |
| 0x23   | `int sem_wait(sem_t id);`                                                                                                | Operation wait on the semaphore with the given `id`. Returns 0 in case of success, otherwise, including the case when the semaphore is deallocated while the threads are waiting on it, returns a negative value (error code).                                                                         |
| 0x24   | `int sem_signal(sem_t id);`                                                                                              | Operation signal on the semaphore with the given `id`. Returns 0 in case of success, otherwise, a negative value (error code).                                                                                                                                                                                 |
| 0x41   | `const int EOF = -1; char getc();`                                                                                       | Loads one character from the character's buffer loaded from the console. In case that the buffer is empty, suspends the calling thread until a character appears. Returns a loaded character in case of success, otherwise, returns `EOF`.                                                                               |
| 0x42   | `void putc(char);`                                                                                                       | Writes the given `char` to the console.                                                                                                                                                                                                                                       |

### In short, the kernel provides:
- Memory allocation and deallocation
- Threads and thread scheduling
- Semaphores
- Synchronous context switching
- Asynchronous context switching (not yet implemented)
- Console interface (not yet implemented, currently using an existing implementation from **`lib/console.lib`**)

## Building and running the project:

A **`Makefile`** is included in the project for compiling and building it.

The project was built using the Ubuntu VM provided by the university, which has all the necessary tools installed in order to be able to run the project. This includes the QEMU emulator for emulating the RISC-V CPU, as well as the CLion IDE (but you can use any IDE you prefer). The virtual machine can be downloaded from [here](https://drive.google.com/file/d/1edGYFcvdnV0pbKws_1G1vePtEec0qC0G/view), and its password is "os".

Run the project:
```plaintext
make qemu
```

Clean the project:
```plaintext
make clean
```
