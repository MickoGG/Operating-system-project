
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000b117          	auipc	sp,0xb
    80000004:	67013103          	ld	sp,1648(sp) # 8000b670 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	691050ef          	jal	ra,80005eac <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <interrupt>:
.align 4
.global interrupt
.type interrupt, @function

interrupt:
    j softwareInterruptHandler
    80001000:	0280006f          	j	80001028 <softwareInterruptHandler>
    j timerInterruptHandler
    80001004:	1240006f          	j	80001128 <timerInterruptHandler>
    sret
    80001008:	10200073          	sret
    sret
    8000100c:	10200073          	sret
    sret
    80001010:	10200073          	sret
    sret
    80001014:	10200073          	sret
    sret
    80001018:	10200073          	sret
    sret
    8000101c:	10200073          	sret
    sret
    80001020:	10200073          	sret
    j consoleInterruptHandler
    80001024:	2140006f          	j	80001238 <consoleInterruptHandler>

0000000080001028 <softwareInterruptHandler>:


softwareInterruptHandler:
    # push all registers to stack
    addi sp, sp, -256
    80001028:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000102c:	00113423          	sd	ra,8(sp)
    80001030:	00213823          	sd	sp,16(sp)
    80001034:	00313c23          	sd	gp,24(sp)
    80001038:	02413023          	sd	tp,32(sp)
    8000103c:	02513423          	sd	t0,40(sp)
    80001040:	02613823          	sd	t1,48(sp)
    80001044:	02713c23          	sd	t2,56(sp)
    80001048:	04813023          	sd	s0,64(sp)
    8000104c:	04913423          	sd	s1,72(sp)
    80001050:	04b13c23          	sd	a1,88(sp)
    80001054:	06c13023          	sd	a2,96(sp)
    80001058:	06d13423          	sd	a3,104(sp)
    8000105c:	06e13823          	sd	a4,112(sp)
    80001060:	06f13c23          	sd	a5,120(sp)
    80001064:	09013023          	sd	a6,128(sp)
    80001068:	09113423          	sd	a7,136(sp)
    8000106c:	09213823          	sd	s2,144(sp)
    80001070:	09313c23          	sd	s3,152(sp)
    80001074:	0b413023          	sd	s4,160(sp)
    80001078:	0b513423          	sd	s5,168(sp)
    8000107c:	0b613823          	sd	s6,176(sp)
    80001080:	0b713c23          	sd	s7,184(sp)
    80001084:	0d813023          	sd	s8,192(sp)
    80001088:	0d913423          	sd	s9,200(sp)
    8000108c:	0da13823          	sd	s10,208(sp)
    80001090:	0db13c23          	sd	s11,216(sp)
    80001094:	0fc13023          	sd	t3,224(sp)
    80001098:	0fd13423          	sd	t4,232(sp)
    8000109c:	0fe13823          	sd	t5,240(sp)
    800010a0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv23handleSoftwareInterruptEv
    800010a4:	341010ef          	jal	ra,80002be4 <_ZN5Riscv23handleSoftwareInterruptEv>

    # pop all registers from stack
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010a8:	00813083          	ld	ra,8(sp)
    800010ac:	01013103          	ld	sp,16(sp)
    800010b0:	01813183          	ld	gp,24(sp)
    800010b4:	02013203          	ld	tp,32(sp)
    800010b8:	02813283          	ld	t0,40(sp)
    800010bc:	03013303          	ld	t1,48(sp)
    800010c0:	03813383          	ld	t2,56(sp)
    800010c4:	04013403          	ld	s0,64(sp)
    800010c8:	04813483          	ld	s1,72(sp)
    800010cc:	05813583          	ld	a1,88(sp)
    800010d0:	06013603          	ld	a2,96(sp)
    800010d4:	06813683          	ld	a3,104(sp)
    800010d8:	07013703          	ld	a4,112(sp)
    800010dc:	07813783          	ld	a5,120(sp)
    800010e0:	08013803          	ld	a6,128(sp)
    800010e4:	08813883          	ld	a7,136(sp)
    800010e8:	09013903          	ld	s2,144(sp)
    800010ec:	09813983          	ld	s3,152(sp)
    800010f0:	0a013a03          	ld	s4,160(sp)
    800010f4:	0a813a83          	ld	s5,168(sp)
    800010f8:	0b013b03          	ld	s6,176(sp)
    800010fc:	0b813b83          	ld	s7,184(sp)
    80001100:	0c013c03          	ld	s8,192(sp)
    80001104:	0c813c83          	ld	s9,200(sp)
    80001108:	0d013d03          	ld	s10,208(sp)
    8000110c:	0d813d83          	ld	s11,216(sp)
    80001110:	0e013e03          	ld	t3,224(sp)
    80001114:	0e813e83          	ld	t4,232(sp)
    80001118:	0f013f03          	ld	t5,240(sp)
    8000111c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001120:	10010113          	addi	sp,sp,256

    sret
    80001124:	10200073          	sret

0000000080001128 <timerInterruptHandler>:


timerInterruptHandler:
    # push all registers to stack
    addi sp, sp, -256
    80001128:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000112c:	00013023          	sd	zero,0(sp)
    80001130:	00113423          	sd	ra,8(sp)
    80001134:	00213823          	sd	sp,16(sp)
    80001138:	00313c23          	sd	gp,24(sp)
    8000113c:	02413023          	sd	tp,32(sp)
    80001140:	02513423          	sd	t0,40(sp)
    80001144:	02613823          	sd	t1,48(sp)
    80001148:	02713c23          	sd	t2,56(sp)
    8000114c:	04813023          	sd	s0,64(sp)
    80001150:	04913423          	sd	s1,72(sp)
    80001154:	04a13823          	sd	a0,80(sp)
    80001158:	04b13c23          	sd	a1,88(sp)
    8000115c:	06c13023          	sd	a2,96(sp)
    80001160:	06d13423          	sd	a3,104(sp)
    80001164:	06e13823          	sd	a4,112(sp)
    80001168:	06f13c23          	sd	a5,120(sp)
    8000116c:	09013023          	sd	a6,128(sp)
    80001170:	09113423          	sd	a7,136(sp)
    80001174:	09213823          	sd	s2,144(sp)
    80001178:	09313c23          	sd	s3,152(sp)
    8000117c:	0b413023          	sd	s4,160(sp)
    80001180:	0b513423          	sd	s5,168(sp)
    80001184:	0b613823          	sd	s6,176(sp)
    80001188:	0b713c23          	sd	s7,184(sp)
    8000118c:	0d813023          	sd	s8,192(sp)
    80001190:	0d913423          	sd	s9,200(sp)
    80001194:	0da13823          	sd	s10,208(sp)
    80001198:	0db13c23          	sd	s11,216(sp)
    8000119c:	0fc13023          	sd	t3,224(sp)
    800011a0:	0fd13423          	sd	t4,232(sp)
    800011a4:	0fe13823          	sd	t5,240(sp)
    800011a8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleTimerInterruptEv
    800011ac:	4a9010ef          	jal	ra,80002e54 <_ZN5Riscv20handleTimerInterruptEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011b0:	00013003          	ld	zero,0(sp)
    800011b4:	00813083          	ld	ra,8(sp)
    800011b8:	01013103          	ld	sp,16(sp)
    800011bc:	01813183          	ld	gp,24(sp)
    800011c0:	02013203          	ld	tp,32(sp)
    800011c4:	02813283          	ld	t0,40(sp)
    800011c8:	03013303          	ld	t1,48(sp)
    800011cc:	03813383          	ld	t2,56(sp)
    800011d0:	04013403          	ld	s0,64(sp)
    800011d4:	04813483          	ld	s1,72(sp)
    800011d8:	05013503          	ld	a0,80(sp)
    800011dc:	05813583          	ld	a1,88(sp)
    800011e0:	06013603          	ld	a2,96(sp)
    800011e4:	06813683          	ld	a3,104(sp)
    800011e8:	07013703          	ld	a4,112(sp)
    800011ec:	07813783          	ld	a5,120(sp)
    800011f0:	08013803          	ld	a6,128(sp)
    800011f4:	08813883          	ld	a7,136(sp)
    800011f8:	09013903          	ld	s2,144(sp)
    800011fc:	09813983          	ld	s3,152(sp)
    80001200:	0a013a03          	ld	s4,160(sp)
    80001204:	0a813a83          	ld	s5,168(sp)
    80001208:	0b013b03          	ld	s6,176(sp)
    8000120c:	0b813b83          	ld	s7,184(sp)
    80001210:	0c013c03          	ld	s8,192(sp)
    80001214:	0c813c83          	ld	s9,200(sp)
    80001218:	0d013d03          	ld	s10,208(sp)
    8000121c:	0d813d83          	ld	s11,216(sp)
    80001220:	0e013e03          	ld	t3,224(sp)
    80001224:	0e813e83          	ld	t4,232(sp)
    80001228:	0f013f03          	ld	t5,240(sp)
    8000122c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001230:	10010113          	addi	sp,sp,256

    sret
    80001234:	10200073          	sret

0000000080001238 <consoleInterruptHandler>:


consoleInterruptHandler:
    # push all registers to stack
    addi sp, sp, -256
    80001238:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000123c:	00013023          	sd	zero,0(sp)
    80001240:	00113423          	sd	ra,8(sp)
    80001244:	00213823          	sd	sp,16(sp)
    80001248:	00313c23          	sd	gp,24(sp)
    8000124c:	02413023          	sd	tp,32(sp)
    80001250:	02513423          	sd	t0,40(sp)
    80001254:	02613823          	sd	t1,48(sp)
    80001258:	02713c23          	sd	t2,56(sp)
    8000125c:	04813023          	sd	s0,64(sp)
    80001260:	04913423          	sd	s1,72(sp)
    80001264:	04a13823          	sd	a0,80(sp)
    80001268:	04b13c23          	sd	a1,88(sp)
    8000126c:	06c13023          	sd	a2,96(sp)
    80001270:	06d13423          	sd	a3,104(sp)
    80001274:	06e13823          	sd	a4,112(sp)
    80001278:	06f13c23          	sd	a5,120(sp)
    8000127c:	09013023          	sd	a6,128(sp)
    80001280:	09113423          	sd	a7,136(sp)
    80001284:	09213823          	sd	s2,144(sp)
    80001288:	09313c23          	sd	s3,152(sp)
    8000128c:	0b413023          	sd	s4,160(sp)
    80001290:	0b513423          	sd	s5,168(sp)
    80001294:	0b613823          	sd	s6,176(sp)
    80001298:	0b713c23          	sd	s7,184(sp)
    8000129c:	0d813023          	sd	s8,192(sp)
    800012a0:	0d913423          	sd	s9,200(sp)
    800012a4:	0da13823          	sd	s10,208(sp)
    800012a8:	0db13c23          	sd	s11,216(sp)
    800012ac:	0fc13023          	sd	t3,224(sp)
    800012b0:	0fd13423          	sd	t4,232(sp)
    800012b4:	0fe13823          	sd	t5,240(sp)
    800012b8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv22handleConsoleInterruptEv
    800012bc:	3b9010ef          	jal	ra,80002e74 <_ZN5Riscv22handleConsoleInterruptEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800012c0:	00013003          	ld	zero,0(sp)
    800012c4:	00813083          	ld	ra,8(sp)
    800012c8:	01013103          	ld	sp,16(sp)
    800012cc:	01813183          	ld	gp,24(sp)
    800012d0:	02013203          	ld	tp,32(sp)
    800012d4:	02813283          	ld	t0,40(sp)
    800012d8:	03013303          	ld	t1,48(sp)
    800012dc:	03813383          	ld	t2,56(sp)
    800012e0:	04013403          	ld	s0,64(sp)
    800012e4:	04813483          	ld	s1,72(sp)
    800012e8:	05013503          	ld	a0,80(sp)
    800012ec:	05813583          	ld	a1,88(sp)
    800012f0:	06013603          	ld	a2,96(sp)
    800012f4:	06813683          	ld	a3,104(sp)
    800012f8:	07013703          	ld	a4,112(sp)
    800012fc:	07813783          	ld	a5,120(sp)
    80001300:	08013803          	ld	a6,128(sp)
    80001304:	08813883          	ld	a7,136(sp)
    80001308:	09013903          	ld	s2,144(sp)
    8000130c:	09813983          	ld	s3,152(sp)
    80001310:	0a013a03          	ld	s4,160(sp)
    80001314:	0a813a83          	ld	s5,168(sp)
    80001318:	0b013b03          	ld	s6,176(sp)
    8000131c:	0b813b83          	ld	s7,184(sp)
    80001320:	0c013c03          	ld	s8,192(sp)
    80001324:	0c813c83          	ld	s9,200(sp)
    80001328:	0d013d03          	ld	s10,208(sp)
    8000132c:	0d813d83          	ld	s11,216(sp)
    80001330:	0e013e03          	ld	t3,224(sp)
    80001334:	0e813e83          	ld	t4,232(sp)
    80001338:	0f013f03          	ld	t5,240(sp)
    8000133c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001340:	10010113          	addi	sp,sp,256

    sret
    80001344:	10200073          	sret

0000000080001348 <_ZN3TCB13switchContextEPNS_7ContextES1_>:
.global _ZN3TCB13switchContextEPNS_7ContextES1_
.type _ZN3TCB13switchContextEPNS_7ContextES1_, @function

_ZN3TCB13switchContextEPNS_7ContextES1_:
    sd sp, 0 * 8(a0)
    80001348:	00253023          	sd	sp,0(a0) # 1000 <_entry-0x7ffff000>
    sd ra, 1 * 8(a0)
    8000134c:	00153423          	sd	ra,8(a0)

    ld sp, 0 * 8(a1)
    80001350:	0005b103          	ld	sp,0(a1)
    ld ra, 1 * 8(a1)
    80001354:	0085b083          	ld	ra,8(a1)

    ret
    80001358:	00008067          	ret

000000008000135c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000135c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001360:	00b29a63          	bne	t0,a1,80001374 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001364:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001368:	fe029ae3          	bnez	t0,8000135c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000136c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001370:	00008067          	ret

0000000080001374 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001374:	00100513          	li	a0,1
    80001378:	00008067          	ret

000000008000137c <_Z9mem_allocm>:
#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"

volatile uint64 ret;

void* mem_alloc(size_t size) {
    8000137c:	ff010113          	addi	sp,sp,-16
    80001380:	00813423          	sd	s0,8(sp)
    80001384:	01010413          	addi	s0,sp,16
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    80001388:	01050513          	addi	a0,a0,16
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    8000138c:	03f57793          	andi	a5,a0,63
    80001390:	02079663          	bnez	a5,800013bc <_Z9mem_allocm+0x40>
    80001394:	00655513          	srli	a0,a0,0x6

    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (numOfBlocks));
    80001398:	00050593          	mv	a1,a0
    asm volatile ("mv a0, %0" : : "r" (Riscv::MEM_ALLOC));
    8000139c:	00100793          	li	a5,1
    800013a0:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    800013a4:	00000073          	ecall

    return (void *) ret;
}
    800013a8:	0000a517          	auipc	a0,0xa
    800013ac:	33853503          	ld	a0,824(a0) # 8000b6e0 <ret>
    800013b0:	00813403          	ld	s0,8(sp)
    800013b4:	01010113          	addi	sp,sp,16
    800013b8:	00008067          	ret
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    800013bc:	00655513          	srli	a0,a0,0x6
    800013c0:	00150513          	addi	a0,a0,1
    800013c4:	fd5ff06f          	j	80001398 <_Z9mem_allocm+0x1c>

00000000800013c8 <_Z8mem_freePv>:

int mem_free(void *p) {
    800013c8:	ff010113          	addi	sp,sp,-16
    800013cc:	00813423          	sd	s0,8(sp)
    800013d0:	01010413          	addi	s0,sp,16
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (p));
    800013d4:	00050593          	mv	a1,a0
    asm volatile ("mv a0, %0" : : "r" (Riscv::MEM_FREE));
    800013d8:	00200793          	li	a5,2
    800013dc:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    800013e0:	00000073          	ecall

    return (int) ret;
    800013e4:	0000a517          	auipc	a0,0xa
    800013e8:	2fc53503          	ld	a0,764(a0) # 8000b6e0 <ret>
}
    800013ec:	0005051b          	sext.w	a0,a0
    800013f0:	00813403          	ld	s0,8(sp)
    800013f4:	01010113          	addi	sp,sp,16
    800013f8:	00008067          	ret

00000000800013fc <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    800013fc:	fd010113          	addi	sp,sp,-48
    80001400:	02113423          	sd	ra,40(sp)
    80001404:	02813023          	sd	s0,32(sp)
    80001408:	00913c23          	sd	s1,24(sp)
    8000140c:	01213823          	sd	s2,16(sp)
    80001410:	01313423          	sd	s3,8(sp)
    80001414:	03010413          	addi	s0,sp,48
    80001418:	00050913          	mv	s2,a0
    8000141c:	00058493          	mv	s1,a1
    80001420:	00060993          	mv	s3,a2
    // Alocate stack
    uint64 *stack_space = nullptr;
    if (start_routine != nullptr) stack_space = (uint64 *) new uint64[STACK_SIZE];
    80001424:	04058a63          	beqz	a1,80001478 <_Z13thread_createPP3TCBPFvPvES2_+0x7c>
    80001428:	00040537          	lui	a0,0x40
    8000142c:	00001097          	auipc	ra,0x1
    80001430:	868080e7          	jalr	-1944(ra) # 80001c94 <_Znam>

    // Going into interrupt routine
    asm volatile ("mv a4, %0" : : "r" (stack_space));
    80001434:	00050713          	mv	a4,a0
    asm volatile ("mv a3, %0" : : "r" (arg));
    80001438:	00098693          	mv	a3,s3
    asm volatile ("mv a2, %0" : : "r" (start_routine));
    8000143c:	00048613          	mv	a2,s1
    asm volatile ("mv a1, %0" : : "r" (handle));
    80001440:	00090593          	mv	a1,s2
    asm volatile ("mv a0, %0" : : "r" (Riscv::THREAD_CREATE));
    80001444:	01100793          	li	a5,17
    80001448:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    8000144c:	00000073          	ecall

    return (int) ret;
    80001450:	0000a517          	auipc	a0,0xa
    80001454:	29053503          	ld	a0,656(a0) # 8000b6e0 <ret>
}
    80001458:	0005051b          	sext.w	a0,a0
    8000145c:	02813083          	ld	ra,40(sp)
    80001460:	02013403          	ld	s0,32(sp)
    80001464:	01813483          	ld	s1,24(sp)
    80001468:	01013903          	ld	s2,16(sp)
    8000146c:	00813983          	ld	s3,8(sp)
    80001470:	03010113          	addi	sp,sp,48
    80001474:	00008067          	ret
    uint64 *stack_space = nullptr;
    80001478:	00000513          	li	a0,0
    8000147c:	fb9ff06f          	j	80001434 <_Z13thread_createPP3TCBPFvPvES2_+0x38>

0000000080001480 <_Z11thread_exitv>:

int thread_exit() {
    80001480:	ff010113          	addi	sp,sp,-16
    80001484:	00813423          	sd	s0,8(sp)
    80001488:	01010413          	addi	s0,sp,16

    static void finalizeTCB() { delete blockedThreads; }    // if (userMain ended) delete blockedThreads;

    static void yield();

    static TCB* getRunningThread() { return runningThread; }
    8000148c:	0000a797          	auipc	a5,0xa
    80001490:	1d47b783          	ld	a5,468(a5) # 8000b660 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001494:	0007b783          	ld	a5,0(a5)

    void setFinished() { status = FINISHED; }

    int getID() const { return id; }

    bool getIsMainThread() const { return body == nullptr; }
    80001498:	0087b783          	ld	a5,8(a5)
    if (TCB::getRunningThread()->getIsMainThread()) return -1;
    8000149c:	02078063          	beqz	a5,800014bc <_Z11thread_exitv+0x3c>

    // Going into interrupt routine
    asm volatile ("mv a0, %0" : : "r" (Riscv::THREAD_EXIT));
    800014a0:	01200793          	li	a5,18
    800014a4:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    800014a8:	00000073          	ecall

    return 0;
    800014ac:	00000513          	li	a0,0
}
    800014b0:	00813403          	ld	s0,8(sp)
    800014b4:	01010113          	addi	sp,sp,16
    800014b8:	00008067          	ret
    if (TCB::getRunningThread()->getIsMainThread()) return -1;
    800014bc:	fff00513          	li	a0,-1
    800014c0:	ff1ff06f          	j	800014b0 <_Z11thread_exitv+0x30>

00000000800014c4 <_Z15thread_dispatchv>:

void thread_dispatch(){
    800014c4:	ff010113          	addi	sp,sp,-16
    800014c8:	00813423          	sd	s0,8(sp)
    800014cc:	01010413          	addi	s0,sp,16
    // Going into interrupt routine
    asm volatile ("mv a0, %0" : : "r" (Riscv::THREAD_DISPATCH));
    800014d0:	01300793          	li	a5,19
    800014d4:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    800014d8:	00000073          	ecall
}
    800014dc:	00813403          	ld	s0,8(sp)
    800014e0:	01010113          	addi	sp,sp,16
    800014e4:	00008067          	ret

00000000800014e8 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle){
    800014e8:	ff010113          	addi	sp,sp,-16
    800014ec:	00813423          	sd	s0,8(sp)
    800014f0:	01010413          	addi	s0,sp,16
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (handle));
    800014f4:	00050593          	mv	a1,a0
    asm volatile ("mv a0, %0" : : "r" (Riscv::THREAD_JOIN));
    800014f8:	01400793          	li	a5,20
    800014fc:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    80001500:	00000073          	ecall
}
    80001504:	00813403          	ld	s0,8(sp)
    80001508:	01010113          	addi	sp,sp,16
    8000150c:	00008067          	ret

0000000080001510 <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned init) {
    80001510:	ff010113          	addi	sp,sp,-16
    80001514:	00813423          	sd	s0,8(sp)
    80001518:	01010413          	addi	s0,sp,16
    // Going into interrupt routine
    asm volatile ("mv a2, %0" : : "r" (init));
    8000151c:	00058613          	mv	a2,a1
    asm volatile ("mv a1, %0" : : "r" (handle));
    80001520:	00050593          	mv	a1,a0
    asm volatile ("mv a0, %0" : : "r" (Riscv::SEM_OPEN));
    80001524:	02100793          	li	a5,33
    80001528:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    8000152c:	00000073          	ecall

    return (int) ret;
    80001530:	0000a517          	auipc	a0,0xa
    80001534:	1b053503          	ld	a0,432(a0) # 8000b6e0 <ret>
}
    80001538:	0005051b          	sext.w	a0,a0
    8000153c:	00813403          	ld	s0,8(sp)
    80001540:	01010113          	addi	sp,sp,16
    80001544:	00008067          	ret

0000000080001548 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    80001548:	ff010113          	addi	sp,sp,-16
    8000154c:	00813423          	sd	s0,8(sp)
    80001550:	01010413          	addi	s0,sp,16
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (handle));
    80001554:	00050593          	mv	a1,a0
    asm volatile ("mv a0, %0" : : "r" (Riscv::SEM_CLOSE));
    80001558:	02200793          	li	a5,34
    8000155c:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    80001560:	00000073          	ecall

    return (int) ret;
    80001564:	0000a517          	auipc	a0,0xa
    80001568:	17c53503          	ld	a0,380(a0) # 8000b6e0 <ret>
}
    8000156c:	0005051b          	sext.w	a0,a0
    80001570:	00813403          	ld	s0,8(sp)
    80001574:	01010113          	addi	sp,sp,16
    80001578:	00008067          	ret

000000008000157c <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    8000157c:	ff010113          	addi	sp,sp,-16
    80001580:	00813423          	sd	s0,8(sp)
    80001584:	01010413          	addi	s0,sp,16
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (id));
    80001588:	00050593          	mv	a1,a0
    asm volatile ("mv a0, %0" : : "r" (Riscv::SEM_WAIT));
    8000158c:	02300793          	li	a5,35
    80001590:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    80001594:	00000073          	ecall

    return (int) ret;
    80001598:	0000a517          	auipc	a0,0xa
    8000159c:	14853503          	ld	a0,328(a0) # 8000b6e0 <ret>
}
    800015a0:	0005051b          	sext.w	a0,a0
    800015a4:	00813403          	ld	s0,8(sp)
    800015a8:	01010113          	addi	sp,sp,16
    800015ac:	00008067          	ret

00000000800015b0 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    800015b0:	ff010113          	addi	sp,sp,-16
    800015b4:	00813423          	sd	s0,8(sp)
    800015b8:	01010413          	addi	s0,sp,16
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (id));
    800015bc:	00050593          	mv	a1,a0
    asm volatile ("mv a0, %0" : : "r" (Riscv::SEM_SIGNAL));
    800015c0:	02400793          	li	a5,36
    800015c4:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    800015c8:	00000073          	ecall

    return (int) ret;
    800015cc:	0000a517          	auipc	a0,0xa
    800015d0:	11453503          	ld	a0,276(a0) # 8000b6e0 <ret>
}
    800015d4:	0005051b          	sext.w	a0,a0
    800015d8:	00813403          	ld	s0,8(sp)
    800015dc:	01010113          	addi	sp,sp,16
    800015e0:	00008067          	ret

00000000800015e4 <_Z4getcv>:

char getc() {
    800015e4:	fe010113          	addi	sp,sp,-32
    800015e8:	00813c23          	sd	s0,24(sp)
    800015ec:	02010413          	addi	s0,sp,32
    // Going into interrupt routine
    asm volatile ("mv a0, %0" : : "r" (Riscv::GETC));
    800015f0:	04100793          	li	a5,65
    800015f4:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    800015f8:	00000073          	ecall

    volatile char c;
    asm volatile ("mv %0, a0" : "=r" (c));
    800015fc:	00050793          	mv	a5,a0
    80001600:	fef407a3          	sb	a5,-17(s0)

    return c;
    80001604:	fef44503          	lbu	a0,-17(s0)
}
    80001608:	0ff57513          	andi	a0,a0,255
    8000160c:	01813403          	ld	s0,24(sp)
    80001610:	02010113          	addi	sp,sp,32
    80001614:	00008067          	ret

0000000080001618 <_Z4putcc>:

void putc(char c) {
    80001618:	ff010113          	addi	sp,sp,-16
    8000161c:	00813423          	sd	s0,8(sp)
    80001620:	01010413          	addi	s0,sp,16
    // Going into interrupt routine
    asm volatile ("mv a1, %0" : : "r" (c));
    80001624:	00050593          	mv	a1,a0
    asm volatile ("mv a0, %0" : : "r" (Riscv::PUTC));
    80001628:	04200793          	li	a5,66
    8000162c:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    80001630:	00000073          	ecall
}
    80001634:	00813403          	ld	s0,8(sp)
    80001638:	01010113          	addi	sp,sp,16
    8000163c:	00008067          	ret

0000000080001640 <_Z11getThreadIdv>:

int getThreadId() {
    80001640:	fe010113          	addi	sp,sp,-32
    80001644:	00113c23          	sd	ra,24(sp)
    80001648:	00813823          	sd	s0,16(sp)
    8000164c:	00913423          	sd	s1,8(sp)
    80001650:	02010413          	addi	s0,sp,32
    // Going into interrupt routine
    asm volatile ("mv a0, %0" : : "r" (Riscv::getThreadId));
    80001654:	05100793          	li	a5,81
    80001658:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    8000165c:	00000073          	ecall

    int r = (int) ret;
    80001660:	0000a497          	auipc	s1,0xa
    80001664:	0804b483          	ld	s1,128(s1) # 8000b6e0 <ret>
    80001668:	0004849b          	sext.w	s1,s1
    thread_dispatch();
    8000166c:	00000097          	auipc	ra,0x0
    80001670:	e58080e7          	jalr	-424(ra) # 800014c4 <_Z15thread_dispatchv>

    return r;
}
    80001674:	00048513          	mv	a0,s1
    80001678:	01813083          	ld	ra,24(sp)
    8000167c:	01013403          	ld	s0,16(sp)
    80001680:	00813483          	ld	s1,8(sp)
    80001684:	02010113          	addi	sp,sp,32
    80001688:	00008067          	ret

000000008000168c <_Z11userWrapperPv>:
#include "../h/TCB.hpp"
#include "../test/printing.hpp"

extern void userMain();

void userWrapper(void *arg) {
    8000168c:	fe010113          	addi	sp,sp,-32
    80001690:	00113c23          	sd	ra,24(sp)
    80001694:	00813823          	sd	s0,16(sp)
    80001698:	00913423          	sd	s1,8(sp)
    8000169c:	02010413          	addi	s0,sp,32
    800016a0:	00050493          	mv	s1,a0
    printString("---User Main started.---\n");
    800016a4:	00008517          	auipc	a0,0x8
    800016a8:	97c50513          	addi	a0,a0,-1668 # 80009020 <CONSOLE_STATUS+0x10>
    800016ac:	00004097          	auipc	ra,0x4
    800016b0:	830080e7          	jalr	-2000(ra) # 80004edc <_Z11printStringPKc>
    userMain();
    800016b4:	00000097          	auipc	ra,0x0
    800016b8:	3a4080e7          	jalr	932(ra) # 80001a58 <_Z8userMainv>
    printString("---User Main ended.---\n");
    800016bc:	00008517          	auipc	a0,0x8
    800016c0:	98450513          	addi	a0,a0,-1660 # 80009040 <CONSOLE_STATUS+0x30>
    800016c4:	00004097          	auipc	ra,0x4
    800016c8:	818080e7          	jalr	-2024(ra) # 80004edc <_Z11printStringPKc>
    *(bool *) arg = true;
    800016cc:	00100793          	li	a5,1
    800016d0:	00f48023          	sb	a5,0(s1)
}
    800016d4:	01813083          	ld	ra,24(sp)
    800016d8:	01013403          	ld	s0,16(sp)
    800016dc:	00813483          	ld	s1,8(sp)
    800016e0:	02010113          	addi	sp,sp,32
    800016e4:	00008067          	ret

00000000800016e8 <main>:

int main() {
    800016e8:	fc010113          	addi	sp,sp,-64
    800016ec:	02113c23          	sd	ra,56(sp)
    800016f0:	02813823          	sd	s0,48(sp)
    800016f4:	02913423          	sd	s1,40(sp)
    800016f8:	04010413          	addi	s0,sp,64
    // Initialization
    asm volatile ("csrw stvec, %0" : : "r" ((uint64) &interrupt | 0b01));
    800016fc:	0000a797          	auipc	a5,0xa
    80001700:	f947b783          	ld	a5,-108(a5) # 8000b690 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001704:	0017e793          	ori	a5,a5,1
    80001708:	10579073          	csrw	stvec,a5
    MemoryAllocator::initFreeSegmentsList();
    8000170c:	00001097          	auipc	ra,0x1
    80001710:	790080e7          	jalr	1936(ra) # 80002e9c <_ZN15MemoryAllocator20initFreeSegmentsListEv>
    static void initBlockedThreadsList() { if (!runningThread) blockedThreads = new List<TCB *>(); }
    80001714:	0000a797          	auipc	a5,0xa
    80001718:	f4c7b783          	ld	a5,-180(a5) # 8000b660 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000171c:	0007b783          	ld	a5,0(a5)
    80001720:	06078e63          	beqz	a5,8000179c <main+0xb4>
    TCB::initBlockedThreadsList();

    // Main thread
    TCB *mainThread;
    thread_create(&mainThread, nullptr, nullptr);
    80001724:	00000613          	li	a2,0
    80001728:	00000593          	li	a1,0
    8000172c:	fd840513          	addi	a0,s0,-40
    80001730:	00000097          	auipc	ra,0x0
    80001734:	ccc080e7          	jalr	-820(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::initRunningThread(mainThread);
    80001738:	fd843703          	ld	a4,-40(s0)
    static void initRunningThread(TCB *tcb) { if (!runningThread) runningThread = tcb; }
    8000173c:	0000a797          	auipc	a5,0xa
    80001740:	f247b783          	ld	a5,-220(a5) # 8000b660 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001744:	0007b783          	ld	a5,0(a5)
    80001748:	06078e63          	beqz	a5,800017c4 <main+0xdc>

    // Starting user mode
    Riscv::mode = Riscv::USER_MODE;
    8000174c:	0000a797          	auipc	a5,0xa
    80001750:	f2c7b783          	ld	a5,-212(a5) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001754:	0007a023          	sw	zero,0(a5)
    asm volatile ("ecall");
    80001758:	00000073          	ecall
    printString("---User mode started.---\n");
    8000175c:	00008517          	auipc	a0,0x8
    80001760:	8fc50513          	addi	a0,a0,-1796 # 80009058 <CONSOLE_STATUS+0x48>
    80001764:	00003097          	auipc	ra,0x3
    80001768:	778080e7          	jalr	1912(ra) # 80004edc <_Z11printStringPKc>

    bool userMainEnded = false;
    8000176c:	fc040ba3          	sb	zero,-41(s0)

    // User thread
    TCB *userThread;
    thread_create(&userThread, userWrapper, &userMainEnded);
    80001770:	fd740613          	addi	a2,s0,-41
    80001774:	00000597          	auipc	a1,0x0
    80001778:	f1858593          	addi	a1,a1,-232 # 8000168c <_Z11userWrapperPv>
    8000177c:	fc840513          	addi	a0,s0,-56
    80001780:	00000097          	auipc	ra,0x0
    80001784:	c7c080e7          	jalr	-900(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>

    // Wait for user main to finish
    while (!userMainEnded) {
    80001788:	fd744783          	lbu	a5,-41(s0)
    8000178c:	04079463          	bnez	a5,800017d4 <main+0xec>
        thread_dispatch();
    80001790:	00000097          	auipc	ra,0x0
    80001794:	d34080e7          	jalr	-716(ra) # 800014c4 <_Z15thread_dispatchv>
    80001798:	ff1ff06f          	j	80001788 <main+0xa0>
    static void initBlockedThreadsList() { if (!runningThread) blockedThreads = new List<TCB *>(); }
    8000179c:	01800513          	li	a0,24
    800017a0:	00000097          	auipc	ra,0x0
    800017a4:	464080e7          	jalr	1124(ra) # 80001c04 <_Znwm>
    800017a8:	00053023          	sd	zero,0(a0)
    800017ac:	00053423          	sd	zero,8(a0)
    800017b0:	00053823          	sd	zero,16(a0)
    800017b4:	0000a797          	auipc	a5,0xa
    800017b8:	ecc7b783          	ld	a5,-308(a5) # 8000b680 <_GLOBAL_OFFSET_TABLE_+0x30>
    800017bc:	00a7b023          	sd	a0,0(a5)
    800017c0:	f65ff06f          	j	80001724 <main+0x3c>
    static void initRunningThread(TCB *tcb) { if (!runningThread) runningThread = tcb; }
    800017c4:	0000a797          	auipc	a5,0xa
    800017c8:	e9c7b783          	ld	a5,-356(a5) # 8000b660 <_GLOBAL_OFFSET_TABLE_+0x10>
    800017cc:	00e7b023          	sd	a4,0(a5)
    800017d0:	f7dff06f          	j	8000174c <main+0x64>
    }

    // Ending user mode
    printString("---User mode ended.---\n\n");
    800017d4:	00008517          	auipc	a0,0x8
    800017d8:	8a450513          	addi	a0,a0,-1884 # 80009078 <CONSOLE_STATUS+0x68>
    800017dc:	00003097          	auipc	ra,0x3
    800017e0:	700080e7          	jalr	1792(ra) # 80004edc <_Z11printStringPKc>
    Riscv::mode = Riscv::PRIVILEGED_MODE;
    800017e4:	0000a797          	auipc	a5,0xa
    800017e8:	e947b783          	ld	a5,-364(a5) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017ec:	00100713          	li	a4,1
    800017f0:	00e7a023          	sw	a4,0(a5)
    asm volatile ("ecall");
    800017f4:	00000073          	ecall
    static void finalizeTCB() { delete blockedThreads; }    // if (userMain ended) delete blockedThreads;
    800017f8:	0000a797          	auipc	a5,0xa
    800017fc:	e887b783          	ld	a5,-376(a5) # 8000b680 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001800:	0007b483          	ld	s1,0(a5)
    80001804:	00048e63          	beqz	s1,80001820 <main+0x138>
    80001808:	00048513          	mv	a0,s1
    8000180c:	00000097          	auipc	ra,0x0
    80001810:	094080e7          	jalr	148(ra) # 800018a0 <_ZN4ListIP3TCBED1Ev>
    80001814:	00048513          	mv	a0,s1
    80001818:	00000097          	auipc	ra,0x0
    8000181c:	414080e7          	jalr	1044(ra) # 80001c2c <_ZdlPv>

    // Finalize
    TCB::finalizeTCB();
    delete userThread;
    80001820:	fc843483          	ld	s1,-56(s0)
    80001824:	00048e63          	beqz	s1,80001840 <main+0x158>
    80001828:	00048513          	mv	a0,s1
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	0c0080e7          	jalr	192(ra) # 800018ec <_ZN3TCBD1Ev>
    80001834:	00048513          	mv	a0,s1
    80001838:	00001097          	auipc	ra,0x1
    8000183c:	840080e7          	jalr	-1984(ra) # 80002078 <_ZN3TCBdlEPv>
    delete mainThread;
    80001840:	fd843483          	ld	s1,-40(s0)
    80001844:	00048e63          	beqz	s1,80001860 <main+0x178>
    80001848:	00048513          	mv	a0,s1
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	0a0080e7          	jalr	160(ra) # 800018ec <_ZN3TCBD1Ev>
    80001854:	00048513          	mv	a0,s1
    80001858:	00001097          	auipc	ra,0x1
    8000185c:	820080e7          	jalr	-2016(ra) # 80002078 <_ZN3TCBdlEPv>

    return 0;
}
    80001860:	00000513          	li	a0,0
    80001864:	03813083          	ld	ra,56(sp)
    80001868:	03013403          	ld	s0,48(sp)
    8000186c:	02813483          	ld	s1,40(sp)
    80001870:	04010113          	addi	sp,sp,64
    80001874:	00008067          	ret

0000000080001878 <_ZN4ListIP3TCBE4elemdlEPv>:
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    return MemoryAllocator::memoryAllocate(numOfBlocks);
}

template<typename T>
void List<T>::Elem::operator delete(void *p) {
    80001878:	ff010113          	addi	sp,sp,-16
    8000187c:	00113423          	sd	ra,8(sp)
    80001880:	00813023          	sd	s0,0(sp)
    80001884:	01010413          	addi	s0,sp,16
    MemoryAllocator::memoryFree(p);
    80001888:	00001097          	auipc	ra,0x1
    8000188c:	724080e7          	jalr	1828(ra) # 80002fac <_ZN15MemoryAllocator10memoryFreeEPv>
}
    80001890:	00813083          	ld	ra,8(sp)
    80001894:	00013403          	ld	s0,0(sp)
    80001898:	01010113          	addi	sp,sp,16
    8000189c:	00008067          	ret

00000000800018a0 <_ZN4ListIP3TCBED1Ev>:
List<T>::~List() {
    800018a0:	fe010113          	addi	sp,sp,-32
    800018a4:	00113c23          	sd	ra,24(sp)
    800018a8:	00813823          	sd	s0,16(sp)
    800018ac:	00913423          	sd	s1,8(sp)
    800018b0:	02010413          	addi	s0,sp,32
    800018b4:	00050493          	mv	s1,a0
    while (head) {
    800018b8:	0004b503          	ld	a0,0(s1)
    800018bc:	00050e63          	beqz	a0,800018d8 <_ZN4ListIP3TCBED1Ev+0x38>
        head = head->next;
    800018c0:	00053783          	ld	a5,0(a0)
    800018c4:	00f4b023          	sd	a5,0(s1)
        delete old;
    800018c8:	fe0508e3          	beqz	a0,800018b8 <_ZN4ListIP3TCBED1Ev+0x18>
    800018cc:	00000097          	auipc	ra,0x0
    800018d0:	fac080e7          	jalr	-84(ra) # 80001878 <_ZN4ListIP3TCBE4elemdlEPv>
    800018d4:	fe5ff06f          	j	800018b8 <_ZN4ListIP3TCBED1Ev+0x18>
}
    800018d8:	01813083          	ld	ra,24(sp)
    800018dc:	01013403          	ld	s0,16(sp)
    800018e0:	00813483          	ld	s1,8(sp)
    800018e4:	02010113          	addi	sp,sp,32
    800018e8:	00008067          	ret

00000000800018ec <_ZN3TCBD1Ev>:
    ~TCB() {
    800018ec:	fe010113          	addi	sp,sp,-32
    800018f0:	00113c23          	sd	ra,24(sp)
    800018f4:	00813823          	sd	s0,16(sp)
    800018f8:	00913423          	sd	s1,8(sp)
    800018fc:	02010413          	addi	s0,sp,32
    80001900:	00050493          	mv	s1,a0
        delete[] stack;
    80001904:	01853503          	ld	a0,24(a0)
    80001908:	00050663          	beqz	a0,80001914 <_ZN3TCBD1Ev+0x28>
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	3b0080e7          	jalr	944(ra) # 80001cbc <_ZdaPv>
    ~TCB() {
    80001914:	03848513          	addi	a0,s1,56
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	f88080e7          	jalr	-120(ra) # 800018a0 <_ZN4ListIP3TCBED1Ev>
    }
    80001920:	01813083          	ld	ra,24(sp)
    80001924:	01013403          	ld	s0,16(sp)
    80001928:	00813483          	ld	s1,8(sp)
    8000192c:	02010113          	addi	sp,sp,32
    80001930:	00008067          	ret

0000000080001934 <_ZN9Scheduler3getEv>:
#include "../h/Scheduler.hpp"

TCB* Scheduler::readyThreadsHead = nullptr;
TCB* Scheduler::readyThreadsTail = nullptr;

TCB* Scheduler::get() {
    80001934:	ff010113          	addi	sp,sp,-16
    80001938:	00813423          	sd	s0,8(sp)
    8000193c:	01010413          	addi	s0,sp,16
    TCB *tcb = readyThreadsHead;
    80001940:	0000a517          	auipc	a0,0xa
    80001944:	da853503          	ld	a0,-600(a0) # 8000b6e8 <_ZN9Scheduler16readyThreadsHeadE>
    if (tcb) {
    80001948:	00050c63          	beqz	a0,80001960 <_ZN9Scheduler3getEv+0x2c>
    static TCB *runningThread;

    TCB *nextInScheduler = nullptr;

    TCB* getNextInScheduler() const {
        return nextInScheduler;
    8000194c:	00053783          	ld	a5,0(a0)
        readyThreadsHead = tcb->getNextInScheduler();
    80001950:	0000a717          	auipc	a4,0xa
    80001954:	d8f73c23          	sd	a5,-616(a4) # 8000b6e8 <_ZN9Scheduler16readyThreadsHeadE>
        if (!readyThreadsHead) readyThreadsTail = nullptr;
    80001958:	00078a63          	beqz	a5,8000196c <_ZN9Scheduler3getEv+0x38>
    }

    void setNextInScheduler(TCB *tcb) {
        nextInScheduler = tcb;
    8000195c:	00053023          	sd	zero,0(a0)
        tcb->setNextInScheduler(nullptr);
    }
    return tcb;
}
    80001960:	00813403          	ld	s0,8(sp)
    80001964:	01010113          	addi	sp,sp,16
    80001968:	00008067          	ret
        if (!readyThreadsHead) readyThreadsTail = nullptr;
    8000196c:	0000a797          	auipc	a5,0xa
    80001970:	d807b223          	sd	zero,-636(a5) # 8000b6f0 <_ZN9Scheduler16readyThreadsTailE>
    80001974:	fe9ff06f          	j	8000195c <_ZN9Scheduler3getEv+0x28>

0000000080001978 <_ZN9Scheduler3putEP3TCB>:

void Scheduler::put(TCB *tcb) {
    80001978:	ff010113          	addi	sp,sp,-16
    8000197c:	00813423          	sd	s0,8(sp)
    80001980:	01010413          	addi	s0,sp,16
    if (readyThreadsHead == nullptr){
    80001984:	0000a797          	auipc	a5,0xa
    80001988:	d647b783          	ld	a5,-668(a5) # 8000b6e8 <_ZN9Scheduler16readyThreadsHeadE>
    8000198c:	02078263          	beqz	a5,800019b0 <_ZN9Scheduler3putEP3TCB+0x38>
        readyThreadsHead = tcb;
        readyThreadsTail = tcb;
    }
    else {
        readyThreadsTail->setNextInScheduler(tcb);
    80001990:	0000a797          	auipc	a5,0xa
    80001994:	d5878793          	addi	a5,a5,-680 # 8000b6e8 <_ZN9Scheduler16readyThreadsHeadE>
    80001998:	0087b703          	ld	a4,8(a5)
    8000199c:	00a73023          	sd	a0,0(a4)
        readyThreadsTail = tcb;
    800019a0:	00a7b423          	sd	a0,8(a5)
    }
}
    800019a4:	00813403          	ld	s0,8(sp)
    800019a8:	01010113          	addi	sp,sp,16
    800019ac:	00008067          	ret
        readyThreadsHead = tcb;
    800019b0:	0000a797          	auipc	a5,0xa
    800019b4:	d3878793          	addi	a5,a5,-712 # 8000b6e8 <_ZN9Scheduler16readyThreadsHeadE>
    800019b8:	00a7b023          	sd	a0,0(a5)
        readyThreadsTail = tcb;
    800019bc:	00a7b423          	sd	a0,8(a5)
    800019c0:	fe5ff06f          	j	800019a4 <_ZN9Scheduler3putEP3TCB+0x2c>

00000000800019c4 <_Z8testBodyPv>:

#include "../h/syscall_cpp.hpp"
#include "../h/TCB.hpp"


void testBody(void *arg) {
    800019c4:	fe010113          	addi	sp,sp,-32
    800019c8:	00113c23          	sd	ra,24(sp)
    800019cc:	00813823          	sd	s0,16(sp)
    800019d0:	00913423          	sd	s1,8(sp)
    800019d4:	02010413          	addi	s0,sp,32
    for (int i = 0; i < 3; i++) {
    800019d8:	00000493          	li	s1,0
    800019dc:	0080006f          	j	800019e4 <_Z8testBodyPv+0x20>
    800019e0:	0014849b          	addiw	s1,s1,1
    800019e4:	00200793          	li	a5,2
    800019e8:	0497c863          	blt	a5,s1,80001a38 <_Z8testBodyPv+0x74>
        printString("b");
    800019ec:	00007517          	auipc	a0,0x7
    800019f0:	6ac50513          	addi	a0,a0,1708 # 80009098 <CONSOLE_STATUS+0x88>
    800019f4:	00003097          	auipc	ra,0x3
    800019f8:	4e8080e7          	jalr	1256(ra) # 80004edc <_Z11printStringPKc>
    static TCB* getRunningThread() { return runningThread; }
    800019fc:	0000a797          	auipc	a5,0xa
    80001a00:	c647b783          	ld	a5,-924(a5) # 8000b660 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001a04:	0007b783          	ld	a5,0(a5)
    int getID() const { return id; }
    80001a08:	0507a503          	lw	a0,80(a5)
        printInt(TCB::getRunningThread()->getID() - 1);
    80001a0c:	00000613          	li	a2,0
    80001a10:	00a00593          	li	a1,10
    80001a14:	fff5051b          	addiw	a0,a0,-1
    80001a18:	00003097          	auipc	ra,0x3
    80001a1c:	674080e7          	jalr	1652(ra) # 8000508c <_Z8printIntiii>
        for (int j = 0; j < 1000000000; j++);
    80001a20:	00000713          	li	a4,0
    80001a24:	3b9ad7b7          	lui	a5,0x3b9ad
    80001a28:	9ff78793          	addi	a5,a5,-1537 # 3b9ac9ff <_entry-0x44653601>
    80001a2c:	fae7cae3          	blt	a5,a4,800019e0 <_Z8testBodyPv+0x1c>
    80001a30:	0017071b          	addiw	a4,a4,1
    80001a34:	ff1ff06f          	j	80001a24 <_Z8testBodyPv+0x60>
    }
    putc('\n');
    80001a38:	00a00513          	li	a0,10
    80001a3c:	00000097          	auipc	ra,0x0
    80001a40:	bdc080e7          	jalr	-1060(ra) # 80001618 <_Z4putcc>
}
    80001a44:	01813083          	ld	ra,24(sp)
    80001a48:	01013403          	ld	s0,16(sp)
    80001a4c:	00813483          	ld	s1,8(sp)
    80001a50:	02010113          	addi	sp,sp,32
    80001a54:	00008067          	ret

0000000080001a58 <_Z8userMainv>:


void userMain() {
    80001a58:	fe010113          	addi	sp,sp,-32
    80001a5c:	00113c23          	sd	ra,24(sp)
    80001a60:	00813823          	sd	s0,16(sp)
    80001a64:	00913423          	sd	s1,8(sp)
    80001a68:	01213023          	sd	s2,0(sp)
    80001a6c:	02010413          	addi	s0,sp,32
//
//    return;

//// ============================================================================================================ ////

    printString("Unesite broj testa? [1-7]\n");
    80001a70:	00007517          	auipc	a0,0x7
    80001a74:	63050513          	addi	a0,a0,1584 # 800090a0 <CONSOLE_STATUS+0x90>
    80001a78:	00003097          	auipc	ra,0x3
    80001a7c:	464080e7          	jalr	1124(ra) # 80004edc <_Z11printStringPKc>
    int test = getc() - '0';
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	b64080e7          	jalr	-1180(ra) # 800015e4 <_Z4getcv>
    80001a88:	00050913          	mv	s2,a0
    80001a8c:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80001a90:	00000097          	auipc	ra,0x0
    80001a94:	b54080e7          	jalr	-1196(ra) # 800015e4 <_Z4getcv>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
    80001a98:	fcb9091b          	addiw	s2,s2,-53
    80001a9c:	00100793          	li	a5,1
    80001aa0:	0327f463          	bgeu	a5,s2,80001ac8 <_Z8userMainv+0x70>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80001aa4:	00700793          	li	a5,7
    80001aa8:	0e97e263          	bltu	a5,s1,80001b8c <_Z8userMainv+0x134>
    80001aac:	00249493          	slli	s1,s1,0x2
    80001ab0:	00008717          	auipc	a4,0x8
    80001ab4:	80870713          	addi	a4,a4,-2040 # 800092b8 <CONSOLE_STATUS+0x2a8>
    80001ab8:	00e484b3          	add	s1,s1,a4
    80001abc:	0004a783          	lw	a5,0(s1)
    80001ac0:	00e787b3          	add	a5,a5,a4
    80001ac4:	00078067          	jr	a5
            printString("Nije navedeno da je zadatak 4 implementiran\n");
    80001ac8:	00007517          	auipc	a0,0x7
    80001acc:	5f850513          	addi	a0,a0,1528 # 800090c0 <CONSOLE_STATUS+0xb0>
    80001ad0:	00003097          	auipc	ra,0x3
    80001ad4:	40c080e7          	jalr	1036(ra) # 80004edc <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
}
    80001ad8:	01813083          	ld	ra,24(sp)
    80001adc:	01013403          	ld	s0,16(sp)
    80001ae0:	00813483          	ld	s1,8(sp)
    80001ae4:	00013903          	ld	s2,0(sp)
    80001ae8:	02010113          	addi	sp,sp,32
    80001aec:	00008067          	ret
            Threads_C_API_test();
    80001af0:	00003097          	auipc	ra,0x3
    80001af4:	a64080e7          	jalr	-1436(ra) # 80004554 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80001af8:	00007517          	auipc	a0,0x7
    80001afc:	5f850513          	addi	a0,a0,1528 # 800090f0 <CONSOLE_STATUS+0xe0>
    80001b00:	00003097          	auipc	ra,0x3
    80001b04:	3dc080e7          	jalr	988(ra) # 80004edc <_Z11printStringPKc>
            break;
    80001b08:	fd1ff06f          	j	80001ad8 <_Z8userMainv+0x80>
            Threads_CPP_API_test();
    80001b0c:	00002097          	auipc	ra,0x2
    80001b10:	0ac080e7          	jalr	172(ra) # 80003bb8 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80001b14:	00007517          	auipc	a0,0x7
    80001b18:	61c50513          	addi	a0,a0,1564 # 80009130 <CONSOLE_STATUS+0x120>
    80001b1c:	00003097          	auipc	ra,0x3
    80001b20:	3c0080e7          	jalr	960(ra) # 80004edc <_Z11printStringPKc>
            break;
    80001b24:	fb5ff06f          	j	80001ad8 <_Z8userMainv+0x80>
            producerConsumer_C_API();
    80001b28:	00002097          	auipc	ra,0x2
    80001b2c:	8e4080e7          	jalr	-1820(ra) # 8000340c <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80001b30:	00007517          	auipc	a0,0x7
    80001b34:	64050513          	addi	a0,a0,1600 # 80009170 <CONSOLE_STATUS+0x160>
    80001b38:	00003097          	auipc	ra,0x3
    80001b3c:	3a4080e7          	jalr	932(ra) # 80004edc <_Z11printStringPKc>
            break;
    80001b40:	f99ff06f          	j	80001ad8 <_Z8userMainv+0x80>
            producerConsumer_CPP_Sync_API();
    80001b44:	00003097          	auipc	ra,0x3
    80001b48:	d54080e7          	jalr	-684(ra) # 80004898 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80001b4c:	00007517          	auipc	a0,0x7
    80001b50:	67450513          	addi	a0,a0,1652 # 800091c0 <CONSOLE_STATUS+0x1b0>
    80001b54:	00003097          	auipc	ra,0x3
    80001b58:	388080e7          	jalr	904(ra) # 80004edc <_Z11printStringPKc>
            break;
    80001b5c:	f7dff06f          	j	80001ad8 <_Z8userMainv+0x80>
            System_Mode_test();
    80001b60:	00004097          	auipc	ra,0x4
    80001b64:	f30080e7          	jalr	-208(ra) # 80005a90 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80001b68:	00007517          	auipc	a0,0x7
    80001b6c:	6b050513          	addi	a0,a0,1712 # 80009218 <CONSOLE_STATUS+0x208>
    80001b70:	00003097          	auipc	ra,0x3
    80001b74:	36c080e7          	jalr	876(ra) # 80004edc <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80001b78:	00007517          	auipc	a0,0x7
    80001b7c:	6c050513          	addi	a0,a0,1728 # 80009238 <CONSOLE_STATUS+0x228>
    80001b80:	00003097          	auipc	ra,0x3
    80001b84:	35c080e7          	jalr	860(ra) # 80004edc <_Z11printStringPKc>
            break;
    80001b88:	f51ff06f          	j	80001ad8 <_Z8userMainv+0x80>
            printString("Niste uneli odgovarajuci broj za test\n");
    80001b8c:	00007517          	auipc	a0,0x7
    80001b90:	70450513          	addi	a0,a0,1796 # 80009290 <CONSOLE_STATUS+0x280>
    80001b94:	00003097          	auipc	ra,0x3
    80001b98:	348080e7          	jalr	840(ra) # 80004edc <_Z11printStringPKc>
    80001b9c:	f3dff06f          	j	80001ad8 <_Z8userMainv+0x80>

0000000080001ba0 <_ZN6Thread13threadWrapperEPv>:

int Thread::sleep(time_t time) {
    return 0;
}

void Thread::threadWrapper(void *arg) {
    80001ba0:	ff010113          	addi	sp,sp,-16
    80001ba4:	00113423          	sd	ra,8(sp)
    80001ba8:	00813023          	sd	s0,0(sp)
    80001bac:	01010413          	addi	s0,sp,16
    ((Thread *) arg)->run();
    80001bb0:	00053783          	ld	a5,0(a0)
    80001bb4:	0107b783          	ld	a5,16(a5)
    80001bb8:	000780e7          	jalr	a5
}
    80001bbc:	00813083          	ld	ra,8(sp)
    80001bc0:	00013403          	ld	s0,0(sp)
    80001bc4:	01010113          	addi	sp,sp,16
    80001bc8:	00008067          	ret

0000000080001bcc <_ZN9SemaphoreD1Ev>:
Semaphore::Semaphore(unsigned init) {
    this->myHandle = nullptr;
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80001bcc:	ff010113          	addi	sp,sp,-16
    80001bd0:	00113423          	sd	ra,8(sp)
    80001bd4:	00813023          	sd	s0,0(sp)
    80001bd8:	01010413          	addi	s0,sp,16
    80001bdc:	0000a797          	auipc	a5,0xa
    80001be0:	92478793          	addi	a5,a5,-1756 # 8000b500 <_ZTV9Semaphore+0x10>
    80001be4:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001be8:	00853503          	ld	a0,8(a0)
    80001bec:	00000097          	auipc	ra,0x0
    80001bf0:	95c080e7          	jalr	-1700(ra) # 80001548 <_Z9sem_closeP4_sem>
}
    80001bf4:	00813083          	ld	ra,8(sp)
    80001bf8:	00013403          	ld	s0,0(sp)
    80001bfc:	01010113          	addi	sp,sp,16
    80001c00:	00008067          	ret

0000000080001c04 <_Znwm>:
void* operator new (size_t size) {
    80001c04:	ff010113          	addi	sp,sp,-16
    80001c08:	00113423          	sd	ra,8(sp)
    80001c0c:	00813023          	sd	s0,0(sp)
    80001c10:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001c14:	fffff097          	auipc	ra,0xfffff
    80001c18:	768080e7          	jalr	1896(ra) # 8000137c <_Z9mem_allocm>
}
    80001c1c:	00813083          	ld	ra,8(sp)
    80001c20:	00013403          	ld	s0,0(sp)
    80001c24:	01010113          	addi	sp,sp,16
    80001c28:	00008067          	ret

0000000080001c2c <_ZdlPv>:
void operator delete (void *p) {
    80001c2c:	ff010113          	addi	sp,sp,-16
    80001c30:	00113423          	sd	ra,8(sp)
    80001c34:	00813023          	sd	s0,0(sp)
    80001c38:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001c3c:	fffff097          	auipc	ra,0xfffff
    80001c40:	78c080e7          	jalr	1932(ra) # 800013c8 <_Z8mem_freePv>
}
    80001c44:	00813083          	ld	ra,8(sp)
    80001c48:	00013403          	ld	s0,0(sp)
    80001c4c:	01010113          	addi	sp,sp,16
    80001c50:	00008067          	ret

0000000080001c54 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001c54:	fe010113          	addi	sp,sp,-32
    80001c58:	00113c23          	sd	ra,24(sp)
    80001c5c:	00813823          	sd	s0,16(sp)
    80001c60:	00913423          	sd	s1,8(sp)
    80001c64:	02010413          	addi	s0,sp,32
    80001c68:	00050493          	mv	s1,a0
}
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	f60080e7          	jalr	-160(ra) # 80001bcc <_ZN9SemaphoreD1Ev>
    80001c74:	00048513          	mv	a0,s1
    80001c78:	00000097          	auipc	ra,0x0
    80001c7c:	fb4080e7          	jalr	-76(ra) # 80001c2c <_ZdlPv>
    80001c80:	01813083          	ld	ra,24(sp)
    80001c84:	01013403          	ld	s0,16(sp)
    80001c88:	00813483          	ld	s1,8(sp)
    80001c8c:	02010113          	addi	sp,sp,32
    80001c90:	00008067          	ret

0000000080001c94 <_Znam>:
void* operator new[] (size_t size) {
    80001c94:	ff010113          	addi	sp,sp,-16
    80001c98:	00113423          	sd	ra,8(sp)
    80001c9c:	00813023          	sd	s0,0(sp)
    80001ca0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001ca4:	fffff097          	auipc	ra,0xfffff
    80001ca8:	6d8080e7          	jalr	1752(ra) # 8000137c <_Z9mem_allocm>
}
    80001cac:	00813083          	ld	ra,8(sp)
    80001cb0:	00013403          	ld	s0,0(sp)
    80001cb4:	01010113          	addi	sp,sp,16
    80001cb8:	00008067          	ret

0000000080001cbc <_ZdaPv>:
void operator delete[] (void* p) {
    80001cbc:	ff010113          	addi	sp,sp,-16
    80001cc0:	00113423          	sd	ra,8(sp)
    80001cc4:	00813023          	sd	s0,0(sp)
    80001cc8:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001ccc:	fffff097          	auipc	ra,0xfffff
    80001cd0:	6fc080e7          	jalr	1788(ra) # 800013c8 <_Z8mem_freePv>
}
    80001cd4:	00813083          	ld	ra,8(sp)
    80001cd8:	00013403          	ld	s0,0(sp)
    80001cdc:	01010113          	addi	sp,sp,16
    80001ce0:	00008067          	ret

0000000080001ce4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) : myHandle(nullptr), body(body), arg(arg) {
    80001ce4:	ff010113          	addi	sp,sp,-16
    80001ce8:	00113423          	sd	ra,8(sp)
    80001cec:	00813023          	sd	s0,0(sp)
    80001cf0:	01010413          	addi	s0,sp,16
    80001cf4:	00009797          	auipc	a5,0x9
    80001cf8:	7e478793          	addi	a5,a5,2020 # 8000b4d8 <_ZTV6Thread+0x10>
    80001cfc:	00f53023          	sd	a5,0(a0)
    80001d00:	00053423          	sd	zero,8(a0)
    80001d04:	00b53823          	sd	a1,16(a0)
    80001d08:	00c53c23          	sd	a2,24(a0)
    thread_create(&myHandle, body, arg);
    80001d0c:	00850513          	addi	a0,a0,8
    80001d10:	fffff097          	auipc	ra,0xfffff
    80001d14:	6ec080e7          	jalr	1772(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001d18:	00813083          	ld	ra,8(sp)
    80001d1c:	00013403          	ld	s0,0(sp)
    80001d20:	01010113          	addi	sp,sp,16
    80001d24:	00008067          	ret

0000000080001d28 <_ZN6ThreadC1Ev>:
Thread::Thread() : myHandle(nullptr), body(threadWrapper), arg(this) {
    80001d28:	ff010113          	addi	sp,sp,-16
    80001d2c:	00113423          	sd	ra,8(sp)
    80001d30:	00813023          	sd	s0,0(sp)
    80001d34:	01010413          	addi	s0,sp,16
    80001d38:	00009797          	auipc	a5,0x9
    80001d3c:	7a078793          	addi	a5,a5,1952 # 8000b4d8 <_ZTV6Thread+0x10>
    80001d40:	00f53023          	sd	a5,0(a0)
    80001d44:	00053423          	sd	zero,8(a0)
    80001d48:	00000597          	auipc	a1,0x0
    80001d4c:	e5858593          	addi	a1,a1,-424 # 80001ba0 <_ZN6Thread13threadWrapperEPv>
    80001d50:	00b53823          	sd	a1,16(a0)
    80001d54:	00a53c23          	sd	a0,24(a0)
    thread_create(&myHandle, body, arg);
    80001d58:	00050613          	mv	a2,a0
    80001d5c:	00850513          	addi	a0,a0,8
    80001d60:	fffff097          	auipc	ra,0xfffff
    80001d64:	69c080e7          	jalr	1692(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001d68:	00813083          	ld	ra,8(sp)
    80001d6c:	00013403          	ld	s0,0(sp)
    80001d70:	01010113          	addi	sp,sp,16
    80001d74:	00008067          	ret

0000000080001d78 <_ZN6Thread5startEv>:
    if (body != threadWrapper) return -1;
    80001d78:	01053703          	ld	a4,16(a0)
    80001d7c:	00000797          	auipc	a5,0x0
    80001d80:	e2478793          	addi	a5,a5,-476 # 80001ba0 <_ZN6Thread13threadWrapperEPv>
    80001d84:	02f71a63          	bne	a4,a5,80001db8 <_ZN6Thread5startEv+0x40>
int Thread::start() {
    80001d88:	ff010113          	addi	sp,sp,-16
    80001d8c:	00113423          	sd	ra,8(sp)
    80001d90:	00813023          	sd	s0,0(sp)
    80001d94:	01010413          	addi	s0,sp,16
    Scheduler::put(myHandle);
    80001d98:	00853503          	ld	a0,8(a0)
    80001d9c:	00000097          	auipc	ra,0x0
    80001da0:	bdc080e7          	jalr	-1060(ra) # 80001978 <_ZN9Scheduler3putEP3TCB>
    return 0;
    80001da4:	00000513          	li	a0,0
}
    80001da8:	00813083          	ld	ra,8(sp)
    80001dac:	00013403          	ld	s0,0(sp)
    80001db0:	01010113          	addi	sp,sp,16
    80001db4:	00008067          	ret
    if (body != threadWrapper) return -1;
    80001db8:	fff00513          	li	a0,-1
}
    80001dbc:	00008067          	ret

0000000080001dc0 <_ZN6Thread4joinEv>:
    if (myHandle) thread_join(myHandle);
    80001dc0:	00853503          	ld	a0,8(a0)
    80001dc4:	02050663          	beqz	a0,80001df0 <_ZN6Thread4joinEv+0x30>
void Thread::join() {
    80001dc8:	ff010113          	addi	sp,sp,-16
    80001dcc:	00113423          	sd	ra,8(sp)
    80001dd0:	00813023          	sd	s0,0(sp)
    80001dd4:	01010413          	addi	s0,sp,16
    if (myHandle) thread_join(myHandle);
    80001dd8:	fffff097          	auipc	ra,0xfffff
    80001ddc:	710080e7          	jalr	1808(ra) # 800014e8 <_Z11thread_joinP3TCB>
}
    80001de0:	00813083          	ld	ra,8(sp)
    80001de4:	00013403          	ld	s0,0(sp)
    80001de8:	01010113          	addi	sp,sp,16
    80001dec:	00008067          	ret
    80001df0:	00008067          	ret

0000000080001df4 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001df4:	ff010113          	addi	sp,sp,-16
    80001df8:	00113423          	sd	ra,8(sp)
    80001dfc:	00813023          	sd	s0,0(sp)
    80001e00:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001e04:	fffff097          	auipc	ra,0xfffff
    80001e08:	6c0080e7          	jalr	1728(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80001e0c:	00813083          	ld	ra,8(sp)
    80001e10:	00013403          	ld	s0,0(sp)
    80001e14:	01010113          	addi	sp,sp,16
    80001e18:	00008067          	ret

0000000080001e1c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    80001e1c:	ff010113          	addi	sp,sp,-16
    80001e20:	00813423          	sd	s0,8(sp)
    80001e24:	01010413          	addi	s0,sp,16
}
    80001e28:	00000513          	li	a0,0
    80001e2c:	00813403          	ld	s0,8(sp)
    80001e30:	01010113          	addi	sp,sp,16
    80001e34:	00008067          	ret

0000000080001e38 <_ZN6Thread11getThreadIdEv>:
int Thread::getThreadId() {
    80001e38:	ff010113          	addi	sp,sp,-16
    80001e3c:	00113423          	sd	ra,8(sp)
    80001e40:	00813023          	sd	s0,0(sp)
    80001e44:	01010413          	addi	s0,sp,16
    return ::getThreadId();
    80001e48:	fffff097          	auipc	ra,0xfffff
    80001e4c:	7f8080e7          	jalr	2040(ra) # 80001640 <_Z11getThreadIdv>
}
    80001e50:	00813083          	ld	ra,8(sp)
    80001e54:	00013403          	ld	s0,0(sp)
    80001e58:	01010113          	addi	sp,sp,16
    80001e5c:	00008067          	ret

0000000080001e60 <_ZN6Thread17setMaximumThreadsEi>:
void Thread::setMaximumThreads(int num_of_threads) {
    80001e60:	ff010113          	addi	sp,sp,-16
    80001e64:	00113423          	sd	ra,8(sp)
    80001e68:	00813023          	sd	s0,0(sp)
    80001e6c:	01010413          	addi	s0,sp,16
    TCB::setMaximumThreads(num_of_threads);
    80001e70:	00000097          	auipc	ra,0x0
    80001e74:	32c080e7          	jalr	812(ra) # 8000219c <_ZN3TCB17setMaximumThreadsEi>
}
    80001e78:	00813083          	ld	ra,8(sp)
    80001e7c:	00013403          	ld	s0,0(sp)
    80001e80:	01010113          	addi	sp,sp,16
    80001e84:	00008067          	ret

0000000080001e88 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init) {
    80001e88:	ff010113          	addi	sp,sp,-16
    80001e8c:	00113423          	sd	ra,8(sp)
    80001e90:	00813023          	sd	s0,0(sp)
    80001e94:	01010413          	addi	s0,sp,16
    80001e98:	00009797          	auipc	a5,0x9
    80001e9c:	66878793          	addi	a5,a5,1640 # 8000b500 <_ZTV9Semaphore+0x10>
    80001ea0:	00f53023          	sd	a5,0(a0)
    this->myHandle = nullptr;
    80001ea4:	00053423          	sd	zero,8(a0)
    sem_open(&myHandle, init);
    80001ea8:	00850513          	addi	a0,a0,8
    80001eac:	fffff097          	auipc	ra,0xfffff
    80001eb0:	664080e7          	jalr	1636(ra) # 80001510 <_Z8sem_openPP4_semj>
}
    80001eb4:	00813083          	ld	ra,8(sp)
    80001eb8:	00013403          	ld	s0,0(sp)
    80001ebc:	01010113          	addi	sp,sp,16
    80001ec0:	00008067          	ret

0000000080001ec4 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80001ec4:	ff010113          	addi	sp,sp,-16
    80001ec8:	00113423          	sd	ra,8(sp)
    80001ecc:	00813023          	sd	s0,0(sp)
    80001ed0:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80001ed4:	00853503          	ld	a0,8(a0)
    80001ed8:	fffff097          	auipc	ra,0xfffff
    80001edc:	6a4080e7          	jalr	1700(ra) # 8000157c <_Z8sem_waitP4_sem>
}
    80001ee0:	00813083          	ld	ra,8(sp)
    80001ee4:	00013403          	ld	s0,0(sp)
    80001ee8:	01010113          	addi	sp,sp,16
    80001eec:	00008067          	ret

0000000080001ef0 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80001ef0:	ff010113          	addi	sp,sp,-16
    80001ef4:	00113423          	sd	ra,8(sp)
    80001ef8:	00813023          	sd	s0,0(sp)
    80001efc:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80001f00:	00853503          	ld	a0,8(a0)
    80001f04:	fffff097          	auipc	ra,0xfffff
    80001f08:	6ac080e7          	jalr	1708(ra) # 800015b0 <_Z10sem_signalP4_sem>
}
    80001f0c:	00813083          	ld	ra,8(sp)
    80001f10:	00013403          	ld	s0,0(sp)
    80001f14:	01010113          	addi	sp,sp,16
    80001f18:	00008067          	ret

0000000080001f1c <_ZN7Console4getcEv>:


char Console::getc() {
    80001f1c:	ff010113          	addi	sp,sp,-16
    80001f20:	00113423          	sd	ra,8(sp)
    80001f24:	00813023          	sd	s0,0(sp)
    80001f28:	01010413          	addi	s0,sp,16
    return ::getc();
    80001f2c:	fffff097          	auipc	ra,0xfffff
    80001f30:	6b8080e7          	jalr	1720(ra) # 800015e4 <_Z4getcv>
}
    80001f34:	00813083          	ld	ra,8(sp)
    80001f38:	00013403          	ld	s0,0(sp)
    80001f3c:	01010113          	addi	sp,sp,16
    80001f40:	00008067          	ret

0000000080001f44 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80001f44:	ff010113          	addi	sp,sp,-16
    80001f48:	00113423          	sd	ra,8(sp)
    80001f4c:	00813023          	sd	s0,0(sp)
    80001f50:	01010413          	addi	s0,sp,16
    ::putc(c);
    80001f54:	fffff097          	auipc	ra,0xfffff
    80001f58:	6c4080e7          	jalr	1732(ra) # 80001618 <_Z4putcc>
}
    80001f5c:	00813083          	ld	ra,8(sp)
    80001f60:	00013403          	ld	s0,0(sp)
    80001f64:	01010113          	addi	sp,sp,16
    80001f68:	00008067          	ret

0000000080001f6c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80001f6c:	fe010113          	addi	sp,sp,-32
    80001f70:	00113c23          	sd	ra,24(sp)
    80001f74:	00813823          	sd	s0,16(sp)
    80001f78:	00913423          	sd	s1,8(sp)
    80001f7c:	02010413          	addi	s0,sp,32
    80001f80:	00009797          	auipc	a5,0x9
    80001f84:	55878793          	addi	a5,a5,1368 # 8000b4d8 <_ZTV6Thread+0x10>
    80001f88:	00f53023          	sd	a5,0(a0)
    myHandle->setFinished();
    80001f8c:	00853783          	ld	a5,8(a0)

    static TCB* getRunningThread() { return runningThread; }

    bool getFinished() const { return status == FINISHED; }

    void setFinished() { status = FINISHED; }
    80001f90:	00100713          	li	a4,1
    80001f94:	02e7a823          	sw	a4,48(a5)
    delete myHandle;
    80001f98:	00853483          	ld	s1,8(a0)
    80001f9c:	02048663          	beqz	s1,80001fc8 <_ZN6ThreadD1Ev+0x5c>
        delete[] stack;
    80001fa0:	0184b503          	ld	a0,24(s1)
    80001fa4:	00050663          	beqz	a0,80001fb0 <_ZN6ThreadD1Ev+0x44>
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	d14080e7          	jalr	-748(ra) # 80001cbc <_ZdaPv>
    ~TCB() {
    80001fb0:	03848513          	addi	a0,s1,56
    80001fb4:	00000097          	auipc	ra,0x0
    80001fb8:	8ec080e7          	jalr	-1812(ra) # 800018a0 <_ZN4ListIP3TCBED1Ev>
    80001fbc:	00048513          	mv	a0,s1
    80001fc0:	00000097          	auipc	ra,0x0
    80001fc4:	0b8080e7          	jalr	184(ra) # 80002078 <_ZN3TCBdlEPv>
}
    80001fc8:	01813083          	ld	ra,24(sp)
    80001fcc:	01013403          	ld	s0,16(sp)
    80001fd0:	00813483          	ld	s1,8(sp)
    80001fd4:	02010113          	addi	sp,sp,32
    80001fd8:	00008067          	ret

0000000080001fdc <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001fdc:	fe010113          	addi	sp,sp,-32
    80001fe0:	00113c23          	sd	ra,24(sp)
    80001fe4:	00813823          	sd	s0,16(sp)
    80001fe8:	00913423          	sd	s1,8(sp)
    80001fec:	02010413          	addi	s0,sp,32
    80001ff0:	00050493          	mv	s1,a0
}
    80001ff4:	00000097          	auipc	ra,0x0
    80001ff8:	f78080e7          	jalr	-136(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80001ffc:	00048513          	mv	a0,s1
    80002000:	00000097          	auipc	ra,0x0
    80002004:	c2c080e7          	jalr	-980(ra) # 80001c2c <_ZdlPv>
    80002008:	01813083          	ld	ra,24(sp)
    8000200c:	01013403          	ld	s0,16(sp)
    80002010:	00813483          	ld	s1,8(sp)
    80002014:	02010113          	addi	sp,sp,32
    80002018:	00008067          	ret

000000008000201c <_ZN6Thread3runEv>:
    static void setMaximumThreads(int num_of_threads = 5);

    friend class TCB;
protected:
    Thread();
    virtual void run() {}
    8000201c:	ff010113          	addi	sp,sp,-16
    80002020:	00813423          	sd	s0,8(sp)
    80002024:	01010413          	addi	s0,sp,16
    80002028:	00813403          	ld	s0,8(sp)
    8000202c:	01010113          	addi	sp,sp,16
    80002030:	00008067          	ret

0000000080002034 <_ZN3TCBnwEm>:
int TCB::maxNumOfThreads = 5;
int TCB::currNumOfThreads = -2;
List<TCB *>* TCB::blockedThreads = nullptr;


void* TCB::operator new(size_t size) {
    80002034:	ff010113          	addi	sp,sp,-16
    80002038:	00113423          	sd	ra,8(sp)
    8000203c:	00813023          	sd	s0,0(sp)
    80002040:	01010413          	addi	s0,sp,16
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    80002044:	01050513          	addi	a0,a0,16
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    80002048:	03f57793          	andi	a5,a0,63
    8000204c:	02079063          	bnez	a5,8000206c <_ZN3TCBnwEm+0x38>
    80002050:	00655513          	srli	a0,a0,0x6
    return MemoryAllocator::memoryAllocate(numOfBlocks);
    80002054:	00001097          	auipc	ra,0x1
    80002058:	ea4080e7          	jalr	-348(ra) # 80002ef8 <_ZN15MemoryAllocator14memoryAllocateEm>
}
    8000205c:	00813083          	ld	ra,8(sp)
    80002060:	00013403          	ld	s0,0(sp)
    80002064:	01010113          	addi	sp,sp,16
    80002068:	00008067          	ret
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    8000206c:	00655513          	srli	a0,a0,0x6
    80002070:	00150513          	addi	a0,a0,1
    80002074:	fe1ff06f          	j	80002054 <_ZN3TCBnwEm+0x20>

0000000080002078 <_ZN3TCBdlEPv>:

void TCB::operator delete(void *p) {
    80002078:	ff010113          	addi	sp,sp,-16
    8000207c:	00113423          	sd	ra,8(sp)
    80002080:	00813023          	sd	s0,0(sp)
    80002084:	01010413          	addi	s0,sp,16
    MemoryAllocator::memoryFree(p);
    80002088:	00001097          	auipc	ra,0x1
    8000208c:	f24080e7          	jalr	-220(ra) # 80002fac <_ZN15MemoryAllocator10memoryFreeEPv>
}
    80002090:	00813083          	ld	ra,8(sp)
    80002094:	00013403          	ld	s0,0(sp)
    80002098:	01010113          	addi	sp,sp,16
    8000209c:	00008067          	ret

00000000800020a0 <_ZN3TCBnaEm>:

void* TCB::operator new[](size_t size) {
    800020a0:	ff010113          	addi	sp,sp,-16
    800020a4:	00113423          	sd	ra,8(sp)
    800020a8:	00813023          	sd	s0,0(sp)
    800020ac:	01010413          	addi	s0,sp,16
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    800020b0:	01050513          	addi	a0,a0,16
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    800020b4:	03f57793          	andi	a5,a0,63
    800020b8:	02079063          	bnez	a5,800020d8 <_ZN3TCBnaEm+0x38>
    800020bc:	00655513          	srli	a0,a0,0x6
    return MemoryAllocator::memoryAllocate(numOfBlocks);
    800020c0:	00001097          	auipc	ra,0x1
    800020c4:	e38080e7          	jalr	-456(ra) # 80002ef8 <_ZN15MemoryAllocator14memoryAllocateEm>
}
    800020c8:	00813083          	ld	ra,8(sp)
    800020cc:	00013403          	ld	s0,0(sp)
    800020d0:	01010113          	addi	sp,sp,16
    800020d4:	00008067          	ret
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    800020d8:	00655513          	srli	a0,a0,0x6
    800020dc:	00150513          	addi	a0,a0,1
    800020e0:	fe1ff06f          	j	800020c0 <_ZN3TCBnaEm+0x20>

00000000800020e4 <_ZN3TCBdaEPv>:

void TCB::operator delete[](void *p) {
    800020e4:	ff010113          	addi	sp,sp,-16
    800020e8:	00113423          	sd	ra,8(sp)
    800020ec:	00813023          	sd	s0,0(sp)
    800020f0:	01010413          	addi	s0,sp,16
    MemoryAllocator::memoryFree(p);
    800020f4:	00001097          	auipc	ra,0x1
    800020f8:	eb8080e7          	jalr	-328(ra) # 80002fac <_ZN15MemoryAllocator10memoryFreeEPv>
}
    800020fc:	00813083          	ld	ra,8(sp)
    80002100:	00013403          	ld	s0,0(sp)
    80002104:	01010113          	addi	sp,sp,16
    80002108:	00008067          	ret

000000008000210c <_ZN3TCB5yieldEv>:
    if (*handle != nullptr) return 0;
    else return -1;
}


void TCB::yield() {
    8000210c:	ff010113          	addi	sp,sp,-16
    80002110:	00813423          	sd	s0,8(sp)
    80002114:	01010413          	addi	s0,sp,16
    asm volatile ("mv a0, %0" : : "r" (0x13));
    80002118:	01300793          	li	a5,19
    8000211c:	00078513          	mv	a0,a5
    asm volatile ("ecall");
    80002120:	00000073          	ecall
}
    80002124:	00813403          	ld	s0,8(sp)
    80002128:	01010113          	addi	sp,sp,16
    8000212c:	00008067          	ret

0000000080002130 <_ZN3TCB8dispatchEv>:

    return 0;
}


void TCB::dispatch() {
    80002130:	fe010113          	addi	sp,sp,-32
    80002134:	00113c23          	sd	ra,24(sp)
    80002138:	00813823          	sd	s0,16(sp)
    8000213c:	00913423          	sd	s1,8(sp)
    80002140:	02010413          	addi	s0,sp,32
    TCB *old = runningThread;
    80002144:	00009497          	auipc	s1,0x9
    80002148:	5b44b483          	ld	s1,1460(s1) # 8000b6f8 <_ZN3TCB13runningThreadE>
    if (old->status == RUNNABLE) Scheduler::put(old);
    8000214c:	0304a783          	lw	a5,48(s1)
    80002150:	02078e63          	beqz	a5,8000218c <_ZN3TCB8dispatchEv+0x5c>
    runningThread = Scheduler::get();
    80002154:	fffff097          	auipc	ra,0xfffff
    80002158:	7e0080e7          	jalr	2016(ra) # 80001934 <_ZN9Scheduler3getEv>
    8000215c:	00009797          	auipc	a5,0x9
    80002160:	58a7be23          	sd	a0,1436(a5) # 8000b6f8 <_ZN3TCB13runningThreadE>

    if (old != runningThread) TCB::switchContext(&old->context, &runningThread->context);
    80002164:	00a48a63          	beq	s1,a0,80002178 <_ZN3TCB8dispatchEv+0x48>
    80002168:	02050593          	addi	a1,a0,32
    8000216c:	02048513          	addi	a0,s1,32
    80002170:	fffff097          	auipc	ra,0xfffff
    80002174:	1d8080e7          	jalr	472(ra) # 80001348 <_ZN3TCB13switchContextEPNS_7ContextES1_>
}
    80002178:	01813083          	ld	ra,24(sp)
    8000217c:	01013403          	ld	s0,16(sp)
    80002180:	00813483          	ld	s1,8(sp)
    80002184:	02010113          	addi	sp,sp,32
    80002188:	00008067          	ret
    if (old->status == RUNNABLE) Scheduler::put(old);
    8000218c:	00048513          	mv	a0,s1
    80002190:	fffff097          	auipc	ra,0xfffff
    80002194:	7e8080e7          	jalr	2024(ra) # 80001978 <_ZN9Scheduler3putEP3TCB>
    80002198:	fbdff06f          	j	80002154 <_ZN3TCB8dispatchEv+0x24>

000000008000219c <_ZN3TCB17setMaximumThreadsEi>:
        dispatch();
    }
}


void TCB::setMaximumThreads(int num_of_threads) {
    8000219c:	ff010113          	addi	sp,sp,-16
    800021a0:	00813423          	sd	s0,8(sp)
    800021a4:	01010413          	addi	s0,sp,16
    if (num_of_threads < 1) return;
    800021a8:	00a05663          	blez	a0,800021b4 <_ZN3TCB17setMaximumThreadsEi+0x18>
    maxNumOfThreads = num_of_threads;
    800021ac:	00009797          	auipc	a5,0x9
    800021b0:	36a7a223          	sw	a0,868(a5) # 8000b510 <_ZN3TCB15maxNumOfThreadsE>
}
    800021b4:	00813403          	ld	s0,8(sp)
    800021b8:	01010113          	addi	sp,sp,16
    800021bc:	00008067          	ret

00000000800021c0 <_ZN3TCB20releaseJoinedThreadsEv>:
void TCB::releaseJoinedThreads() {
    800021c0:	fe010113          	addi	sp,sp,-32
    800021c4:	00113c23          	sd	ra,24(sp)
    800021c8:	00813823          	sd	s0,16(sp)
    800021cc:	00913423          	sd	s1,8(sp)
    800021d0:	02010413          	addi	s0,sp,32
    runningThread->listOfJoins.setCurrentOnFirst();
    800021d4:	00009517          	auipc	a0,0x9
    800021d8:	52453503          	ld	a0,1316(a0) # 8000b6f8 <_ZN3TCB13runningThreadE>
    800021dc:	03850513          	addi	a0,a0,56
    800021e0:	00000097          	auipc	ra,0x0
    800021e4:	450080e7          	jalr	1104(ra) # 80002630 <_ZN4ListIP3TCBE17setCurrentOnFirstEv>
    while (!runningThread->listOfJoins.isEnd()) {
    800021e8:	00009497          	auipc	s1,0x9
    800021ec:	5104b483          	ld	s1,1296(s1) # 8000b6f8 <_ZN3TCB13runningThreadE>
    800021f0:	03848493          	addi	s1,s1,56
    800021f4:	00048513          	mv	a0,s1
    800021f8:	00000097          	auipc	ra,0x0
    800021fc:	458080e7          	jalr	1112(ra) # 80002650 <_ZNK4ListIP3TCBE5isEndEv>
    80002200:	02051a63          	bnez	a0,80002234 <_ZN3TCB20releaseJoinedThreadsEv+0x74>
        TCB *tcb = runningThread->listOfJoins.getCurrent();
    80002204:	00048513          	mv	a0,s1
    80002208:	00000097          	auipc	ra,0x0
    8000220c:	468080e7          	jalr	1128(ra) # 80002670 <_ZNK4ListIP3TCBE10getCurrentEv>
        tcb->status = RUNNABLE;
    80002210:	02052823          	sw	zero,48(a0)
        Scheduler::put(tcb);
    80002214:	fffff097          	auipc	ra,0xfffff
    80002218:	764080e7          	jalr	1892(ra) # 80001978 <_ZN9Scheduler3putEP3TCB>
        runningThread->listOfJoins.removeCurrent();    // Removes current and sets current on next
    8000221c:	00009517          	auipc	a0,0x9
    80002220:	4dc53503          	ld	a0,1244(a0) # 8000b6f8 <_ZN3TCB13runningThreadE>
    80002224:	03850513          	addi	a0,a0,56
    80002228:	00000097          	auipc	ra,0x0
    8000222c:	46c080e7          	jalr	1132(ra) # 80002694 <_ZN4ListIP3TCBE13removeCurrentEv>
    while (!runningThread->listOfJoins.isEnd()) {
    80002230:	fb9ff06f          	j	800021e8 <_ZN3TCB20releaseJoinedThreadsEv+0x28>
}
    80002234:	01813083          	ld	ra,24(sp)
    80002238:	01013403          	ld	s0,16(sp)
    8000223c:	00813483          	ld	s1,8(sp)
    80002240:	02010113          	addi	sp,sp,32
    80002244:	00008067          	ret

0000000080002248 <_ZN3TCB20releaseBlockedThreadEv>:
void TCB::releaseBlockedThread() {
    80002248:	fe010113          	addi	sp,sp,-32
    8000224c:	00113c23          	sd	ra,24(sp)
    80002250:	00813823          	sd	s0,16(sp)
    80002254:	00913423          	sd	s1,8(sp)
    80002258:	02010413          	addi	s0,sp,32
    blockedThreads->setCurrentOnFirst();
    8000225c:	00009497          	auipc	s1,0x9
    80002260:	49c48493          	addi	s1,s1,1180 # 8000b6f8 <_ZN3TCB13runningThreadE>
    80002264:	0084b503          	ld	a0,8(s1)
    80002268:	00000097          	auipc	ra,0x0
    8000226c:	3c8080e7          	jalr	968(ra) # 80002630 <_ZN4ListIP3TCBE17setCurrentOnFirstEv>
    TCB *tcb = blockedThreads->getCurrent();
    80002270:	0084b503          	ld	a0,8(s1)
    80002274:	00000097          	auipc	ra,0x0
    80002278:	3fc080e7          	jalr	1020(ra) # 80002670 <_ZNK4ListIP3TCBE10getCurrentEv>
    if (tcb) {
    8000227c:	02050063          	beqz	a0,8000229c <_ZN3TCB20releaseBlockedThreadEv+0x54>
        tcb->status = RUNNABLE;
    80002280:	02052823          	sw	zero,48(a0)
        Scheduler::put(tcb);
    80002284:	fffff097          	auipc	ra,0xfffff
    80002288:	6f4080e7          	jalr	1780(ra) # 80001978 <_ZN9Scheduler3putEP3TCB>
        blockedThreads->removeCurrent();
    8000228c:	00009517          	auipc	a0,0x9
    80002290:	47453503          	ld	a0,1140(a0) # 8000b700 <_ZN3TCB14blockedThreadsE>
    80002294:	00000097          	auipc	ra,0x0
    80002298:	400080e7          	jalr	1024(ra) # 80002694 <_ZN4ListIP3TCBE13removeCurrentEv>
}
    8000229c:	01813083          	ld	ra,24(sp)
    800022a0:	01013403          	ld	s0,16(sp)
    800022a4:	00813483          	ld	s1,8(sp)
    800022a8:	02010113          	addi	sp,sp,32
    800022ac:	00008067          	ret

00000000800022b0 <_ZN3TCB14thread_wrapperEv>:
void TCB::thread_wrapper() {
    800022b0:	ff010113          	addi	sp,sp,-16
    800022b4:	00113423          	sd	ra,8(sp)
    800022b8:	00813023          	sd	s0,0(sp)
    800022bc:	01010413          	addi	s0,sp,16
    Riscv::checkThreadMode();
    800022c0:	00001097          	auipc	ra,0x1
    800022c4:	8dc080e7          	jalr	-1828(ra) # 80002b9c <_ZN5Riscv15checkThreadModeEv>
    runningThread->body(runningThread->arg);
    800022c8:	00009797          	auipc	a5,0x9
    800022cc:	4307b783          	ld	a5,1072(a5) # 8000b6f8 <_ZN3TCB13runningThreadE>
    800022d0:	0087b703          	ld	a4,8(a5)
    800022d4:	0107b503          	ld	a0,16(a5)
    800022d8:	000700e7          	jalr	a4
    releaseJoinedThreads();
    800022dc:	00000097          	auipc	ra,0x0
    800022e0:	ee4080e7          	jalr	-284(ra) # 800021c0 <_ZN3TCB20releaseJoinedThreadsEv>
    if (currNumOfThreads > maxNumOfThreads) releaseBlockedThread();
    800022e4:	00009797          	auipc	a5,0x9
    800022e8:	22c78793          	addi	a5,a5,556 # 8000b510 <_ZN3TCB15maxNumOfThreadsE>
    800022ec:	0047a703          	lw	a4,4(a5)
    800022f0:	0007a783          	lw	a5,0(a5)
    800022f4:	04e7c063          	blt	a5,a4,80002334 <_ZN3TCB14thread_wrapperEv+0x84>
    runningThread->status = FINISHED;
    800022f8:	00009797          	auipc	a5,0x9
    800022fc:	4007b783          	ld	a5,1024(a5) # 8000b6f8 <_ZN3TCB13runningThreadE>
    80002300:	00100713          	li	a4,1
    80002304:	02e7a823          	sw	a4,48(a5)
    currNumOfThreads--;
    80002308:	00009717          	auipc	a4,0x9
    8000230c:	20870713          	addi	a4,a4,520 # 8000b510 <_ZN3TCB15maxNumOfThreadsE>
    80002310:	00472783          	lw	a5,4(a4)
    80002314:	fff7879b          	addiw	a5,a5,-1
    80002318:	00f72223          	sw	a5,4(a4)
    yield();
    8000231c:	00000097          	auipc	ra,0x0
    80002320:	df0080e7          	jalr	-528(ra) # 8000210c <_ZN3TCB5yieldEv>
}
    80002324:	00813083          	ld	ra,8(sp)
    80002328:	00013403          	ld	s0,0(sp)
    8000232c:	01010113          	addi	sp,sp,16
    80002330:	00008067          	ret
    if (currNumOfThreads > maxNumOfThreads) releaseBlockedThread();
    80002334:	00000097          	auipc	ra,0x0
    80002338:	f14080e7          	jalr	-236(ra) # 80002248 <_ZN3TCB20releaseBlockedThreadEv>
    8000233c:	fbdff06f          	j	800022f8 <_ZN3TCB14thread_wrapperEv+0x48>

0000000080002340 <_ZN3TCB4exitEv>:
int TCB::exit() {
    80002340:	fd010113          	addi	sp,sp,-48
    80002344:	02113423          	sd	ra,40(sp)
    80002348:	02813023          	sd	s0,32(sp)
    8000234c:	00913c23          	sd	s1,24(sp)
    80002350:	01213823          	sd	s2,16(sp)
    80002354:	03010413          	addi	s0,sp,48
    releaseJoinedThreads();
    80002358:	00000097          	auipc	ra,0x0
    8000235c:	e68080e7          	jalr	-408(ra) # 800021c0 <_ZN3TCB20releaseJoinedThreadsEv>
    if (currNumOfThreads > maxNumOfThreads) releaseBlockedThread();
    80002360:	00009797          	auipc	a5,0x9
    80002364:	1b078793          	addi	a5,a5,432 # 8000b510 <_ZN3TCB15maxNumOfThreadsE>
    80002368:	0047a703          	lw	a4,4(a5)
    8000236c:	0007a783          	lw	a5,0(a5)
    80002370:	0ae7c463          	blt	a5,a4,80002418 <_ZN3TCB4exitEv+0xd8>
    runningThread->status = FINISHED;
    80002374:	00009917          	auipc	s2,0x9
    80002378:	38490913          	addi	s2,s2,900 # 8000b6f8 <_ZN3TCB13runningThreadE>
    8000237c:	00093483          	ld	s1,0(s2)
    80002380:	00100793          	li	a5,1
    80002384:	02f4a823          	sw	a5,48(s1)
    currNumOfThreads--;
    80002388:	00009717          	auipc	a4,0x9
    8000238c:	18870713          	addi	a4,a4,392 # 8000b510 <_ZN3TCB15maxNumOfThreadsE>
    80002390:	00472783          	lw	a5,4(a4)
    80002394:	fff7879b          	addiw	a5,a5,-1
    80002398:	00f72223          	sw	a5,4(a4)
    runningThread = Scheduler::get();
    8000239c:	fffff097          	auipc	ra,0xfffff
    800023a0:	598080e7          	jalr	1432(ra) # 80001934 <_ZN9Scheduler3getEv>
    800023a4:	00a93023          	sd	a0,0(s2)
    Context oldContext = old->context;
    800023a8:	0204b783          	ld	a5,32(s1)
    800023ac:	fcf43823          	sd	a5,-48(s0)
    800023b0:	0284b783          	ld	a5,40(s1)
    800023b4:	fcf43c23          	sd	a5,-40(s0)
    delete old;
    800023b8:	02048663          	beqz	s1,800023e4 <_ZN3TCB4exitEv+0xa4>
        delete[] stack;
    800023bc:	0184b503          	ld	a0,24(s1)
    800023c0:	00050663          	beqz	a0,800023cc <_ZN3TCB4exitEv+0x8c>
    800023c4:	00000097          	auipc	ra,0x0
    800023c8:	8f8080e7          	jalr	-1800(ra) # 80001cbc <_ZdaPv>
    ~TCB() {
    800023cc:	03848513          	addi	a0,s1,56
    800023d0:	fffff097          	auipc	ra,0xfffff
    800023d4:	4d0080e7          	jalr	1232(ra) # 800018a0 <_ZN4ListIP3TCBED1Ev>
    800023d8:	00048513          	mv	a0,s1
    800023dc:	00000097          	auipc	ra,0x0
    800023e0:	c9c080e7          	jalr	-868(ra) # 80002078 <_ZN3TCBdlEPv>
    TCB::switchContext(&oldContext, &runningThread->context);
    800023e4:	00009597          	auipc	a1,0x9
    800023e8:	3145b583          	ld	a1,788(a1) # 8000b6f8 <_ZN3TCB13runningThreadE>
    800023ec:	02058593          	addi	a1,a1,32
    800023f0:	fd040513          	addi	a0,s0,-48
    800023f4:	fffff097          	auipc	ra,0xfffff
    800023f8:	f54080e7          	jalr	-172(ra) # 80001348 <_ZN3TCB13switchContextEPNS_7ContextES1_>
}
    800023fc:	00000513          	li	a0,0
    80002400:	02813083          	ld	ra,40(sp)
    80002404:	02013403          	ld	s0,32(sp)
    80002408:	01813483          	ld	s1,24(sp)
    8000240c:	01013903          	ld	s2,16(sp)
    80002410:	03010113          	addi	sp,sp,48
    80002414:	00008067          	ret
    if (currNumOfThreads > maxNumOfThreads) releaseBlockedThread();
    80002418:	00000097          	auipc	ra,0x0
    8000241c:	e30080e7          	jalr	-464(ra) # 80002248 <_ZN3TCB20releaseBlockedThreadEv>
    80002420:	f55ff06f          	j	80002374 <_ZN3TCB4exitEv+0x34>

0000000080002424 <_ZN3TCBC1EPFvPvES0_Pm>:
TCB::TCB(void (*start_routine)(void *), void *arg, uint64 *stack_space) : body(start_routine), arg(arg), stack(stack_space) {
    80002424:	fe010113          	addi	sp,sp,-32
    80002428:	00113c23          	sd	ra,24(sp)
    8000242c:	00813823          	sd	s0,16(sp)
    80002430:	00913423          	sd	s1,8(sp)
    80002434:	01213023          	sd	s2,0(sp)
    80002438:	02010413          	addi	s0,sp,32
    8000243c:	00053023          	sd	zero,0(a0)
    80002440:	00b53423          	sd	a1,8(a0)
    80002444:	00c53823          	sd	a2,16(a0)
    80002448:	00d53c23          	sd	a3,24(a0)
    8000244c:	02052823          	sw	zero,48(a0)
    80002450:	03850493          	addi	s1,a0,56
    List() = default;
    80002454:	02053c23          	sd	zero,56(a0)
    80002458:	04053023          	sd	zero,64(a0)
    8000245c:	04053423          	sd	zero,72(a0)
    80002460:	00009717          	auipc	a4,0x9
    80002464:	29870713          	addi	a4,a4,664 # 8000b6f8 <_ZN3TCB13runningThreadE>
    80002468:	01072783          	lw	a5,16(a4)
    8000246c:	0017861b          	addiw	a2,a5,1
    80002470:	00c72823          	sw	a2,16(a4)
    80002474:	04f52823          	sw	a5,80(a0)
    context.sp = stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0;
    80002478:	04068c63          	beqz	a3,800024d0 <_ZN3TCBC1EPFvPvES0_Pm+0xac>
    8000247c:	000407b7          	lui	a5,0x40
    80002480:	00f686b3          	add	a3,a3,a5
    80002484:	02d53023          	sd	a3,32(a0)
    context.ra = (uint64) &thread_wrapper;
    80002488:	00000797          	auipc	a5,0x0
    8000248c:	e2878793          	addi	a5,a5,-472 # 800022b0 <_ZN3TCB14thread_wrapperEv>
    80002490:	02f53423          	sd	a5,40(a0)
    if (++currNumOfThreads > maxNumOfThreads) {
    80002494:	00009717          	auipc	a4,0x9
    80002498:	07c70713          	addi	a4,a4,124 # 8000b510 <_ZN3TCB15maxNumOfThreadsE>
    8000249c:	00472783          	lw	a5,4(a4)
    800024a0:	0017879b          	addiw	a5,a5,1
    800024a4:	0007869b          	sext.w	a3,a5
    800024a8:	00f72223          	sw	a5,4(a4)
    800024ac:	00072783          	lw	a5,0(a4)
    800024b0:	02d7c463          	blt	a5,a3,800024d8 <_ZN3TCBC1EPFvPvES0_Pm+0xb4>
    else if (start_routine && start_routine != Thread::threadWrapper) Scheduler::put(this);
    800024b4:	06058063          	beqz	a1,80002514 <_ZN3TCBC1EPFvPvES0_Pm+0xf0>
    800024b8:	00009797          	auipc	a5,0x9
    800024bc:	1b07b783          	ld	a5,432(a5) # 8000b668 <_GLOBAL_OFFSET_TABLE_+0x18>
    800024c0:	04f58a63          	beq	a1,a5,80002514 <_ZN3TCBC1EPFvPvES0_Pm+0xf0>
    800024c4:	fffff097          	auipc	ra,0xfffff
    800024c8:	4b4080e7          	jalr	1204(ra) # 80001978 <_ZN9Scheduler3putEP3TCB>
    800024cc:	0480006f          	j	80002514 <_ZN3TCBC1EPFvPvES0_Pm+0xf0>
    context.sp = stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0;
    800024d0:	00000693          	li	a3,0
    800024d4:	fb1ff06f          	j	80002484 <_ZN3TCBC1EPFvPvES0_Pm+0x60>
        this->status = BLOCKED;
    800024d8:	00300793          	li	a5,3
    800024dc:	02f52823          	sw	a5,48(a0)
        blockedThreads->add(this);
    800024e0:	00050593          	mv	a1,a0
    800024e4:	00009517          	auipc	a0,0x9
    800024e8:	21c53503          	ld	a0,540(a0) # 8000b700 <_ZN3TCB14blockedThreadsE>
    800024ec:	00000097          	auipc	ra,0x0
    800024f0:	294080e7          	jalr	660(ra) # 80002780 <_ZN4ListIP3TCBE3addES1_>
    800024f4:	0200006f          	j	80002514 <_ZN3TCBC1EPFvPvES0_Pm+0xf0>
    800024f8:	00050913          	mv	s2,a0
TCB::TCB(void (*start_routine)(void *), void *arg, uint64 *stack_space) : body(start_routine), arg(arg), stack(stack_space) {
    800024fc:	00048513          	mv	a0,s1
    80002500:	fffff097          	auipc	ra,0xfffff
    80002504:	3a0080e7          	jalr	928(ra) # 800018a0 <_ZN4ListIP3TCBED1Ev>
    80002508:	00090513          	mv	a0,s2
    8000250c:	0000a097          	auipc	ra,0xa
    80002510:	31c080e7          	jalr	796(ra) # 8000c828 <_Unwind_Resume>
}
    80002514:	01813083          	ld	ra,24(sp)
    80002518:	01013403          	ld	s0,16(sp)
    8000251c:	00813483          	ld	s1,8(sp)
    80002520:	00013903          	ld	s2,0(sp)
    80002524:	02010113          	addi	sp,sp,32
    80002528:	00008067          	ret

000000008000252c <_ZN3TCB9createTCBEPPS_PFvPvES2_Pm>:
int TCB::createTCB(TCB **handle, void (*start_routine)(void *), void *arg, uint64 *stack_space) {
    8000252c:	fc010113          	addi	sp,sp,-64
    80002530:	02113c23          	sd	ra,56(sp)
    80002534:	02813823          	sd	s0,48(sp)
    80002538:	02913423          	sd	s1,40(sp)
    8000253c:	03213023          	sd	s2,32(sp)
    80002540:	01313c23          	sd	s3,24(sp)
    80002544:	01413823          	sd	s4,16(sp)
    80002548:	01513423          	sd	s5,8(sp)
    8000254c:	04010413          	addi	s0,sp,64
    80002550:	00050913          	mv	s2,a0
    80002554:	00058993          	mv	s3,a1
    80002558:	00060a13          	mv	s4,a2
    8000255c:	00068a93          	mv	s5,a3
    *handle = new TCB(start_routine, arg, stack_space);
    80002560:	05800513          	li	a0,88
    80002564:	00000097          	auipc	ra,0x0
    80002568:	ad0080e7          	jalr	-1328(ra) # 80002034 <_ZN3TCBnwEm>
    8000256c:	00050493          	mv	s1,a0
    80002570:	000a8693          	mv	a3,s5
    80002574:	000a0613          	mv	a2,s4
    80002578:	00098593          	mv	a1,s3
    8000257c:	00000097          	auipc	ra,0x0
    80002580:	ea8080e7          	jalr	-344(ra) # 80002424 <_ZN3TCBC1EPFvPvES0_Pm>
    80002584:	00993023          	sd	s1,0(s2)
    if (*handle != nullptr) return 0;
    80002588:	02048663          	beqz	s1,800025b4 <_ZN3TCB9createTCBEPPS_PFvPvES2_Pm+0x88>
    8000258c:	00000513          	li	a0,0
}
    80002590:	03813083          	ld	ra,56(sp)
    80002594:	03013403          	ld	s0,48(sp)
    80002598:	02813483          	ld	s1,40(sp)
    8000259c:	02013903          	ld	s2,32(sp)
    800025a0:	01813983          	ld	s3,24(sp)
    800025a4:	01013a03          	ld	s4,16(sp)
    800025a8:	00813a83          	ld	s5,8(sp)
    800025ac:	04010113          	addi	sp,sp,64
    800025b0:	00008067          	ret
    else return -1;
    800025b4:	fff00513          	li	a0,-1
    800025b8:	fd9ff06f          	j	80002590 <_ZN3TCB9createTCBEPPS_PFvPvES2_Pm+0x64>
    800025bc:	00050913          	mv	s2,a0
    *handle = new TCB(start_routine, arg, stack_space);
    800025c0:	00048513          	mv	a0,s1
    800025c4:	00000097          	auipc	ra,0x0
    800025c8:	ab4080e7          	jalr	-1356(ra) # 80002078 <_ZN3TCBdlEPv>
    800025cc:	00090513          	mv	a0,s2
    800025d0:	0000a097          	auipc	ra,0xa
    800025d4:	258080e7          	jalr	600(ra) # 8000c828 <_Unwind_Resume>

00000000800025d8 <_ZN3TCB4joinEPS_>:
    if (handle && handle->status != FINISHED) {
    800025d8:	00050863          	beqz	a0,800025e8 <_ZN3TCB4joinEPS_+0x10>
    800025dc:	03052703          	lw	a4,48(a0)
    800025e0:	00100793          	li	a5,1
    800025e4:	00f71463          	bne	a4,a5,800025ec <_ZN3TCB4joinEPS_+0x14>
    800025e8:	00008067          	ret
void TCB::join(TCB *handle) {
    800025ec:	ff010113          	addi	sp,sp,-16
    800025f0:	00113423          	sd	ra,8(sp)
    800025f4:	00813023          	sd	s0,0(sp)
    800025f8:	01010413          	addi	s0,sp,16
        runningThread->status = JOINED;
    800025fc:	00009597          	auipc	a1,0x9
    80002600:	0fc5b583          	ld	a1,252(a1) # 8000b6f8 <_ZN3TCB13runningThreadE>
    80002604:	00200793          	li	a5,2
    80002608:	02f5a823          	sw	a5,48(a1)
        handle->listOfJoins.add(runningThread);
    8000260c:	03850513          	addi	a0,a0,56
    80002610:	00000097          	auipc	ra,0x0
    80002614:	170080e7          	jalr	368(ra) # 80002780 <_ZN4ListIP3TCBE3addES1_>
        dispatch();
    80002618:	00000097          	auipc	ra,0x0
    8000261c:	b18080e7          	jalr	-1256(ra) # 80002130 <_ZN3TCB8dispatchEv>
}
    80002620:	00813083          	ld	ra,8(sp)
    80002624:	00013403          	ld	s0,0(sp)
    80002628:	01010113          	addi	sp,sp,16
    8000262c:	00008067          	ret

0000000080002630 <_ZN4ListIP3TCBE17setCurrentOnFirstEv>:
void List<T>::setCurrentOnFirst() {
    80002630:	ff010113          	addi	sp,sp,-16
    80002634:	00813423          	sd	s0,8(sp)
    80002638:	01010413          	addi	s0,sp,16
    current = head;
    8000263c:	00053783          	ld	a5,0(a0)
    80002640:	00f53823          	sd	a5,16(a0)
}
    80002644:	00813403          	ld	s0,8(sp)
    80002648:	01010113          	addi	sp,sp,16
    8000264c:	00008067          	ret

0000000080002650 <_ZNK4ListIP3TCBE5isEndEv>:
bool List<T>::isEnd() const {
    80002650:	ff010113          	addi	sp,sp,-16
    80002654:	00813423          	sd	s0,8(sp)
    80002658:	01010413          	addi	s0,sp,16
    return !current;
    8000265c:	01053503          	ld	a0,16(a0)
}
    80002660:	00153513          	seqz	a0,a0
    80002664:	00813403          	ld	s0,8(sp)
    80002668:	01010113          	addi	sp,sp,16
    8000266c:	00008067          	ret

0000000080002670 <_ZNK4ListIP3TCBE10getCurrentEv>:
T List<T>::getCurrent() const {
    80002670:	ff010113          	addi	sp,sp,-16
    80002674:	00813423          	sd	s0,8(sp)
    80002678:	01010413          	addi	s0,sp,16
    if (current) return current->data;
    8000267c:	01053503          	ld	a0,16(a0)
    80002680:	00050463          	beqz	a0,80002688 <_ZNK4ListIP3TCBE10getCurrentEv+0x18>
    80002684:	00853503          	ld	a0,8(a0)
}
    80002688:	00813403          	ld	s0,8(sp)
    8000268c:	01010113          	addi	sp,sp,16
    80002690:	00008067          	ret

0000000080002694 <_ZN4ListIP3TCBE13removeCurrentEv>:
void List<T>::removeCurrent() {
    80002694:	fe010113          	addi	sp,sp,-32
    80002698:	00113c23          	sd	ra,24(sp)
    8000269c:	00813823          	sd	s0,16(sp)
    800026a0:	00913423          	sd	s1,8(sp)
    800026a4:	01213023          	sd	s2,0(sp)
    800026a8:	02010413          	addi	s0,sp,32
    800026ac:	00050493          	mv	s1,a0
    if (current == nullptr) return;
    800026b0:	01053503          	ld	a0,16(a0)
    800026b4:	04050063          	beqz	a0,800026f4 <_ZN4ListIP3TCBE13removeCurrentEv+0x60>
    else if (current == head) {
    800026b8:	0004b783          	ld	a5,0(s1)
    800026bc:	04f50863          	beq	a0,a5,8000270c <_ZN4ListIP3TCBE13removeCurrentEv+0x78>
        while (prev->next != current) prev = prev->next;
    800026c0:	00078913          	mv	s2,a5
    800026c4:	0007b783          	ld	a5,0(a5)
    800026c8:	fef51ce3          	bne	a0,a5,800026c0 <_ZN4ListIP3TCBE13removeCurrentEv+0x2c>
        if (tail == current) tail = prev;
    800026cc:	0084b783          	ld	a5,8(s1)
    800026d0:	06f50263          	beq	a0,a5,80002734 <_ZN4ListIP3TCBE13removeCurrentEv+0xa0>
        prev->next = current->next;
    800026d4:	00053783          	ld	a5,0(a0)
    800026d8:	00f93023          	sd	a5,0(s2)
        delete current;
    800026dc:	0104b503          	ld	a0,16(s1)
    800026e0:	00050663          	beqz	a0,800026ec <_ZN4ListIP3TCBE13removeCurrentEv+0x58>
    800026e4:	fffff097          	auipc	ra,0xfffff
    800026e8:	194080e7          	jalr	404(ra) # 80001878 <_ZN4ListIP3TCBE4elemdlEPv>
        current = prev->next;
    800026ec:	00093783          	ld	a5,0(s2)
    800026f0:	00f4b823          	sd	a5,16(s1)
}
    800026f4:	01813083          	ld	ra,24(sp)
    800026f8:	01013403          	ld	s0,16(sp)
    800026fc:	00813483          	ld	s1,8(sp)
    80002700:	00013903          	ld	s2,0(sp)
    80002704:	02010113          	addi	sp,sp,32
    80002708:	00008067          	ret
        head = head->next;
    8000270c:	0007b783          	ld	a5,0(a5)
    80002710:	00f4b023          	sd	a5,0(s1)
        if (!head) tail = nullptr;
    80002714:	00078c63          	beqz	a5,8000272c <_ZN4ListIP3TCBE13removeCurrentEv+0x98>
        delete current;
    80002718:	fffff097          	auipc	ra,0xfffff
    8000271c:	160080e7          	jalr	352(ra) # 80001878 <_ZN4ListIP3TCBE4elemdlEPv>
        current = head;
    80002720:	0004b783          	ld	a5,0(s1)
    80002724:	00f4b823          	sd	a5,16(s1)
    80002728:	fcdff06f          	j	800026f4 <_ZN4ListIP3TCBE13removeCurrentEv+0x60>
        if (!head) tail = nullptr;
    8000272c:	0004b423          	sd	zero,8(s1)
    80002730:	fe9ff06f          	j	80002718 <_ZN4ListIP3TCBE13removeCurrentEv+0x84>
        if (tail == current) tail = prev;
    80002734:	0124b423          	sd	s2,8(s1)
    80002738:	f9dff06f          	j	800026d4 <_ZN4ListIP3TCBE13removeCurrentEv+0x40>

000000008000273c <_ZN4ListIP3TCBE4elemnwEm>:
void* List<T>::Elem::operator new(size_t size) {
    8000273c:	ff010113          	addi	sp,sp,-16
    80002740:	00113423          	sd	ra,8(sp)
    80002744:	00813023          	sd	s0,0(sp)
    80002748:	01010413          	addi	s0,sp,16
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    8000274c:	01050513          	addi	a0,a0,16
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    80002750:	03f57793          	andi	a5,a0,63
    80002754:	02079063          	bnez	a5,80002774 <_ZN4ListIP3TCBE4elemnwEm+0x38>
    80002758:	00655513          	srli	a0,a0,0x6
    return MemoryAllocator::memoryAllocate(numOfBlocks);
    8000275c:	00000097          	auipc	ra,0x0
    80002760:	79c080e7          	jalr	1948(ra) # 80002ef8 <_ZN15MemoryAllocator14memoryAllocateEm>
}
    80002764:	00813083          	ld	ra,8(sp)
    80002768:	00013403          	ld	s0,0(sp)
    8000276c:	01010113          	addi	sp,sp,16
    80002770:	00008067          	ret
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    80002774:	00655513          	srli	a0,a0,0x6
    80002778:	00150513          	addi	a0,a0,1
    8000277c:	fe1ff06f          	j	8000275c <_ZN4ListIP3TCBE4elemnwEm+0x20>

0000000080002780 <_ZN4ListIP3TCBE3addES1_>:
void List<T>::add(T data) {
    80002780:	fe010113          	addi	sp,sp,-32
    80002784:	00113c23          	sd	ra,24(sp)
    80002788:	00813823          	sd	s0,16(sp)
    8000278c:	00913423          	sd	s1,8(sp)
    80002790:	01213023          	sd	s2,0(sp)
    80002794:	02010413          	addi	s0,sp,32
    80002798:	00050493          	mv	s1,a0
    8000279c:	00058913          	mv	s2,a1
    Elem *elem = new Elem();
    800027a0:	01000513          	li	a0,16
    800027a4:	00000097          	auipc	ra,0x0
    800027a8:	f98080e7          	jalr	-104(ra) # 8000273c <_ZN4ListIP3TCBE4elemnwEm>
    800027ac:	00053023          	sd	zero,0(a0)
    elem->data = data;
    800027b0:	01253423          	sd	s2,8(a0)
    (head == nullptr) ? head = elem : tail->next = elem;
    800027b4:	0004b783          	ld	a5,0(s1)
    800027b8:	02078463          	beqz	a5,800027e0 <_ZN4ListIP3TCBE3addES1_+0x60>
    800027bc:	0084b783          	ld	a5,8(s1)
    800027c0:	00a7b023          	sd	a0,0(a5)
    tail = elem;
    800027c4:	00a4b423          	sd	a0,8(s1)
}
    800027c8:	01813083          	ld	ra,24(sp)
    800027cc:	01013403          	ld	s0,16(sp)
    800027d0:	00813483          	ld	s1,8(sp)
    800027d4:	00013903          	ld	s2,0(sp)
    800027d8:	02010113          	addi	sp,sp,32
    800027dc:	00008067          	ret
    (head == nullptr) ? head = elem : tail->next = elem;
    800027e0:	00a4b023          	sd	a0,0(s1)
    800027e4:	fe1ff06f          	j	800027c4 <_ZN4ListIP3TCBE3addES1_+0x44>

00000000800027e8 <_ZN4_semnwEm>:
#include "../h/_sem.hpp"
#include "../h/Scheduler.hpp"

void* _sem::operator new(size_t size) {
    800027e8:	ff010113          	addi	sp,sp,-16
    800027ec:	00113423          	sd	ra,8(sp)
    800027f0:	00813023          	sd	s0,0(sp)
    800027f4:	01010413          	addi	s0,sp,16
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    800027f8:	01050513          	addi	a0,a0,16
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    800027fc:	03f57793          	andi	a5,a0,63
    80002800:	02079063          	bnez	a5,80002820 <_ZN4_semnwEm+0x38>
    80002804:	00655513          	srli	a0,a0,0x6
    return MemoryAllocator::memoryAllocate(numOfBlocks);
    80002808:	00000097          	auipc	ra,0x0
    8000280c:	6f0080e7          	jalr	1776(ra) # 80002ef8 <_ZN15MemoryAllocator14memoryAllocateEm>
}
    80002810:	00813083          	ld	ra,8(sp)
    80002814:	00013403          	ld	s0,0(sp)
    80002818:	01010113          	addi	sp,sp,16
    8000281c:	00008067          	ret
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    80002820:	00655513          	srli	a0,a0,0x6
    80002824:	00150513          	addi	a0,a0,1
    80002828:	fe1ff06f          	j	80002808 <_ZN4_semnwEm+0x20>

000000008000282c <_ZN4_semdlEPv>:

void _sem::operator delete(void *p) {
    8000282c:	ff010113          	addi	sp,sp,-16
    80002830:	00113423          	sd	ra,8(sp)
    80002834:	00813023          	sd	s0,0(sp)
    80002838:	01010413          	addi	s0,sp,16
    MemoryAllocator::memoryFree(p);
    8000283c:	00000097          	auipc	ra,0x0
    80002840:	770080e7          	jalr	1904(ra) # 80002fac <_ZN15MemoryAllocator10memoryFreeEPv>
}
    80002844:	00813083          	ld	ra,8(sp)
    80002848:	00013403          	ld	s0,0(sp)
    8000284c:	01010113          	addi	sp,sp,16
    80002850:	00008067          	ret

0000000080002854 <_ZN4_semnaEm>:

void* _sem::operator new[](size_t size) {
    80002854:	ff010113          	addi	sp,sp,-16
    80002858:	00113423          	sd	ra,8(sp)
    8000285c:	00813023          	sd	s0,0(sp)
    80002860:	01010413          	addi	s0,sp,16
    size_t newSize = size + MemoryAllocator::getSizeOfNode();
    80002864:	01050513          	addi	a0,a0,16
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    80002868:	03f57793          	andi	a5,a0,63
    8000286c:	02079063          	bnez	a5,8000288c <_ZN4_semnaEm+0x38>
    80002870:	00655513          	srli	a0,a0,0x6
    return MemoryAllocator::memoryAllocate(numOfBlocks);
    80002874:	00000097          	auipc	ra,0x0
    80002878:	684080e7          	jalr	1668(ra) # 80002ef8 <_ZN15MemoryAllocator14memoryAllocateEm>
}
    8000287c:	00813083          	ld	ra,8(sp)
    80002880:	00013403          	ld	s0,0(sp)
    80002884:	01010113          	addi	sp,sp,16
    80002888:	00008067          	ret
    uint64 numOfBlocks = (newSize % MEM_BLOCK_SIZE == 0) ? newSize / MEM_BLOCK_SIZE : newSize / MEM_BLOCK_SIZE + 1;
    8000288c:	00655513          	srli	a0,a0,0x6
    80002890:	00150513          	addi	a0,a0,1
    80002894:	fe1ff06f          	j	80002874 <_ZN4_semnaEm+0x20>

0000000080002898 <_ZN4_semdaEPv>:

void _sem::operator delete[](void *p) {
    80002898:	ff010113          	addi	sp,sp,-16
    8000289c:	00113423          	sd	ra,8(sp)
    800028a0:	00813023          	sd	s0,0(sp)
    800028a4:	01010413          	addi	s0,sp,16
    MemoryAllocator::memoryFree(p);
    800028a8:	00000097          	auipc	ra,0x0
    800028ac:	704080e7          	jalr	1796(ra) # 80002fac <_ZN15MemoryAllocator10memoryFreeEPv>
}
    800028b0:	00813083          	ld	ra,8(sp)
    800028b4:	00013403          	ld	s0,0(sp)
    800028b8:	01010113          	addi	sp,sp,16
    800028bc:	00008067          	ret

00000000800028c0 <_ZN4_sem4openEPPS_j>:
    tcb->status = TCB::RUNNABLE;
    Scheduler::put(tcb);
}


int _sem::open(_sem **handle, uint32 init) {
    800028c0:	fe010113          	addi	sp,sp,-32
    800028c4:	00113c23          	sd	ra,24(sp)
    800028c8:	00813823          	sd	s0,16(sp)
    800028cc:	00913423          	sd	s1,8(sp)
    800028d0:	01213023          	sd	s2,0(sp)
    800028d4:	02010413          	addi	s0,sp,32
    800028d8:	00050493          	mv	s1,a0
    800028dc:	00058913          	mv	s2,a1
    *handle = new _sem(init);
    800028e0:	02800513          	li	a0,40
    800028e4:	00000097          	auipc	ra,0x0
    800028e8:	f04080e7          	jalr	-252(ra) # 800027e8 <_ZN4_semnwEm>
    static int signal(_sem *id);

    static void block(_sem *id);
    static void unblock(_sem *id);

    explicit _sem(uint32 init) : value((int) init) {}
    800028ec:	01252023          	sw	s2,0(a0)
    List() = default;
    800028f0:	00053423          	sd	zero,8(a0)
    800028f4:	00053823          	sd	zero,16(a0)
    800028f8:	00053c23          	sd	zero,24(a0)
    800028fc:	02050023          	sb	zero,32(a0)
    80002900:	00a4b023          	sd	a0,0(s1)

    if (*handle != nullptr) return 0;
    80002904:	02050063          	beqz	a0,80002924 <_ZN4_sem4openEPPS_j+0x64>
    80002908:	00000513          	li	a0,0
    else return -1;
}
    8000290c:	01813083          	ld	ra,24(sp)
    80002910:	01013403          	ld	s0,16(sp)
    80002914:	00813483          	ld	s1,8(sp)
    80002918:	00013903          	ld	s2,0(sp)
    8000291c:	02010113          	addi	sp,sp,32
    80002920:	00008067          	ret
    else return -1;
    80002924:	fff00513          	li	a0,-1
    80002928:	fe5ff06f          	j	8000290c <_ZN4_sem4openEPPS_j+0x4c>

000000008000292c <_ZN4_sem7unblockEPS_>:
void _sem::unblock(_sem *id) {
    8000292c:	fe010113          	addi	sp,sp,-32
    80002930:	00113c23          	sd	ra,24(sp)
    80002934:	00813823          	sd	s0,16(sp)
    80002938:	00913423          	sd	s1,8(sp)
    8000293c:	01213023          	sd	s2,0(sp)
    80002940:	02010413          	addi	s0,sp,32
    id->blockedList.setCurrentOnFirst();
    80002944:	00850493          	addi	s1,a0,8
    80002948:	00048513          	mv	a0,s1
    8000294c:	00000097          	auipc	ra,0x0
    80002950:	ce4080e7          	jalr	-796(ra) # 80002630 <_ZN4ListIP3TCBE17setCurrentOnFirstEv>
    TCB *tcb = id->blockedList.getCurrent();
    80002954:	00048513          	mv	a0,s1
    80002958:	00000097          	auipc	ra,0x0
    8000295c:	d18080e7          	jalr	-744(ra) # 80002670 <_ZNK4ListIP3TCBE10getCurrentEv>
    80002960:	00050913          	mv	s2,a0
    id->blockedList.removeCurrent();
    80002964:	00048513          	mv	a0,s1
    80002968:	00000097          	auipc	ra,0x0
    8000296c:	d2c080e7          	jalr	-724(ra) # 80002694 <_ZN4ListIP3TCBE13removeCurrentEv>
    tcb->status = TCB::RUNNABLE;
    80002970:	02092823          	sw	zero,48(s2)
    Scheduler::put(tcb);
    80002974:	00090513          	mv	a0,s2
    80002978:	fffff097          	auipc	ra,0xfffff
    8000297c:	000080e7          	jalr	ra # 80001978 <_ZN9Scheduler3putEP3TCB>
}
    80002980:	01813083          	ld	ra,24(sp)
    80002984:	01013403          	ld	s0,16(sp)
    80002988:	00813483          	ld	s1,8(sp)
    8000298c:	00013903          	ld	s2,0(sp)
    80002990:	02010113          	addi	sp,sp,32
    80002994:	00008067          	ret

0000000080002998 <_ZN4_semD1Ev>:
_sem::~_sem() {
    80002998:	fe010113          	addi	sp,sp,-32
    8000299c:	00113c23          	sd	ra,24(sp)
    800029a0:	00813823          	sd	s0,16(sp)
    800029a4:	00913423          	sd	s1,8(sp)
    800029a8:	01213023          	sd	s2,0(sp)
    800029ac:	02010413          	addi	s0,sp,32
    800029b0:	00050913          	mv	s2,a0
    closed = true;
    800029b4:	00100793          	li	a5,1
    800029b8:	02f50023          	sb	a5,32(a0)
    for (int i = 0; i < -value; i++) unblock(this);
    800029bc:	00000493          	li	s1,0
    800029c0:	00092783          	lw	a5,0(s2)
    800029c4:	40f007bb          	negw	a5,a5
    800029c8:	00f4dc63          	bge	s1,a5,800029e0 <_ZN4_semD1Ev+0x48>
    800029cc:	00090513          	mv	a0,s2
    800029d0:	00000097          	auipc	ra,0x0
    800029d4:	f5c080e7          	jalr	-164(ra) # 8000292c <_ZN4_sem7unblockEPS_>
    800029d8:	0014849b          	addiw	s1,s1,1
    800029dc:	fe5ff06f          	j	800029c0 <_ZN4_semD1Ev+0x28>
    value = 0;
    800029e0:	00092023          	sw	zero,0(s2)
_sem::~_sem() {
    800029e4:	00890513          	addi	a0,s2,8
    800029e8:	fffff097          	auipc	ra,0xfffff
    800029ec:	eb8080e7          	jalr	-328(ra) # 800018a0 <_ZN4ListIP3TCBED1Ev>
}
    800029f0:	01813083          	ld	ra,24(sp)
    800029f4:	01013403          	ld	s0,16(sp)
    800029f8:	00813483          	ld	s1,8(sp)
    800029fc:	00013903          	ld	s2,0(sp)
    80002a00:	02010113          	addi	sp,sp,32
    80002a04:	00008067          	ret

0000000080002a08 <_ZN4_sem5closeEPS_>:


int _sem::close(_sem *handle) {
    if (!handle) return -1;
    80002a08:	04050863          	beqz	a0,80002a58 <_ZN4_sem5closeEPS_+0x50>
int _sem::close(_sem *handle) {
    80002a0c:	fe010113          	addi	sp,sp,-32
    80002a10:	00113c23          	sd	ra,24(sp)
    80002a14:	00813823          	sd	s0,16(sp)
    80002a18:	00913423          	sd	s1,8(sp)
    80002a1c:	02010413          	addi	s0,sp,32
    80002a20:	00050493          	mv	s1,a0
    else if (handle->closed) return -2;
    80002a24:	02054783          	lbu	a5,32(a0)
    80002a28:	02079c63          	bnez	a5,80002a60 <_ZN4_sem5closeEPS_+0x58>
    delete handle;
    80002a2c:	00000097          	auipc	ra,0x0
    80002a30:	f6c080e7          	jalr	-148(ra) # 80002998 <_ZN4_semD1Ev>
    80002a34:	00048513          	mv	a0,s1
    80002a38:	00000097          	auipc	ra,0x0
    80002a3c:	df4080e7          	jalr	-524(ra) # 8000282c <_ZN4_semdlEPv>
    return 0;
    80002a40:	00000513          	li	a0,0
}
    80002a44:	01813083          	ld	ra,24(sp)
    80002a48:	01013403          	ld	s0,16(sp)
    80002a4c:	00813483          	ld	s1,8(sp)
    80002a50:	02010113          	addi	sp,sp,32
    80002a54:	00008067          	ret
    if (!handle) return -1;
    80002a58:	fff00513          	li	a0,-1
}
    80002a5c:	00008067          	ret
    else if (handle->closed) return -2;
    80002a60:	ffe00513          	li	a0,-2
    80002a64:	fe1ff06f          	j	80002a44 <_ZN4_sem5closeEPS_+0x3c>

0000000080002a68 <_ZN4_sem6signalEPS_>:
    return 0;
}


int _sem::signal(_sem *id) {
    if (!id) return -1;
    80002a68:	04050a63          	beqz	a0,80002abc <_ZN4_sem6signalEPS_+0x54>
    else if (id->closed) return -2;
    80002a6c:	02054783          	lbu	a5,32(a0)
    80002a70:	04079a63          	bnez	a5,80002ac4 <_ZN4_sem6signalEPS_+0x5c>
    else if (++id->value <= 0) unblock(id);
    80002a74:	00052783          	lw	a5,0(a0)
    80002a78:	0017879b          	addiw	a5,a5,1
    80002a7c:	0007871b          	sext.w	a4,a5
    80002a80:	00f52023          	sw	a5,0(a0)
    80002a84:	00e05663          	blez	a4,80002a90 <_ZN4_sem6signalEPS_+0x28>
    return 0;
    80002a88:	00000513          	li	a0,0
}
    80002a8c:	00008067          	ret
int _sem::signal(_sem *id) {
    80002a90:	ff010113          	addi	sp,sp,-16
    80002a94:	00113423          	sd	ra,8(sp)
    80002a98:	00813023          	sd	s0,0(sp)
    80002a9c:	01010413          	addi	s0,sp,16
    else if (++id->value <= 0) unblock(id);
    80002aa0:	00000097          	auipc	ra,0x0
    80002aa4:	e8c080e7          	jalr	-372(ra) # 8000292c <_ZN4_sem7unblockEPS_>
    return 0;
    80002aa8:	00000513          	li	a0,0
}
    80002aac:	00813083          	ld	ra,8(sp)
    80002ab0:	00013403          	ld	s0,0(sp)
    80002ab4:	01010113          	addi	sp,sp,16
    80002ab8:	00008067          	ret
    if (!id) return -1;
    80002abc:	fff00513          	li	a0,-1
    80002ac0:	00008067          	ret
    else if (id->closed) return -2;
    80002ac4:	ffe00513          	li	a0,-2
    80002ac8:	00008067          	ret

0000000080002acc <_ZN4_sem5blockEPS_>:
void _sem::block(_sem *id) {
    80002acc:	fe010113          	addi	sp,sp,-32
    80002ad0:	00113c23          	sd	ra,24(sp)
    80002ad4:	00813823          	sd	s0,16(sp)
    80002ad8:	00913423          	sd	s1,8(sp)
    80002adc:	02010413          	addi	s0,sp,32
    static TCB* getRunningThread() { return runningThread; }
    80002ae0:	00009797          	auipc	a5,0x9
    80002ae4:	b807b783          	ld	a5,-1152(a5) # 8000b660 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002ae8:	0007b483          	ld	s1,0(a5)
    id->blockedList.add(running);
    80002aec:	00048593          	mv	a1,s1
    80002af0:	00850513          	addi	a0,a0,8
    80002af4:	00000097          	auipc	ra,0x0
    80002af8:	c8c080e7          	jalr	-884(ra) # 80002780 <_ZN4ListIP3TCBE3addES1_>
    running->status = TCB::BLOCKED;
    80002afc:	00300793          	li	a5,3
    80002b00:	02f4a823          	sw	a5,48(s1)
    TCB::dispatch();
    80002b04:	fffff097          	auipc	ra,0xfffff
    80002b08:	62c080e7          	jalr	1580(ra) # 80002130 <_ZN3TCB8dispatchEv>
}
    80002b0c:	01813083          	ld	ra,24(sp)
    80002b10:	01013403          	ld	s0,16(sp)
    80002b14:	00813483          	ld	s1,8(sp)
    80002b18:	02010113          	addi	sp,sp,32
    80002b1c:	00008067          	ret

0000000080002b20 <_ZN4_sem4waitEPS_>:
    if (!id) return -1;
    80002b20:	06050263          	beqz	a0,80002b84 <_ZN4_sem4waitEPS_+0x64>
int _sem::wait(_sem *id) {
    80002b24:	fe010113          	addi	sp,sp,-32
    80002b28:	00113c23          	sd	ra,24(sp)
    80002b2c:	00813823          	sd	s0,16(sp)
    80002b30:	00913423          	sd	s1,8(sp)
    80002b34:	02010413          	addi	s0,sp,32
    80002b38:	00050493          	mv	s1,a0
    else if (id->closed) return -2;
    80002b3c:	02054783          	lbu	a5,32(a0)
    80002b40:	04079663          	bnez	a5,80002b8c <_ZN4_sem4waitEPS_+0x6c>
    else if (--id->value < 0) block(id);
    80002b44:	00052783          	lw	a5,0(a0)
    80002b48:	fff7879b          	addiw	a5,a5,-1
    80002b4c:	00f52023          	sw	a5,0(a0)
    80002b50:	02079713          	slli	a4,a5,0x20
    80002b54:	02074263          	bltz	a4,80002b78 <_ZN4_sem4waitEPS_+0x58>
    if (id->closed) return -3;    // If _sem is dealocated while thread is blocked on it
    80002b58:	0204c783          	lbu	a5,32(s1)
    80002b5c:	02079c63          	bnez	a5,80002b94 <_ZN4_sem4waitEPS_+0x74>
    return 0;
    80002b60:	00000513          	li	a0,0
}
    80002b64:	01813083          	ld	ra,24(sp)
    80002b68:	01013403          	ld	s0,16(sp)
    80002b6c:	00813483          	ld	s1,8(sp)
    80002b70:	02010113          	addi	sp,sp,32
    80002b74:	00008067          	ret
    else if (--id->value < 0) block(id);
    80002b78:	00000097          	auipc	ra,0x0
    80002b7c:	f54080e7          	jalr	-172(ra) # 80002acc <_ZN4_sem5blockEPS_>
    80002b80:	fd9ff06f          	j	80002b58 <_ZN4_sem4waitEPS_+0x38>
    if (!id) return -1;
    80002b84:	fff00513          	li	a0,-1
}
    80002b88:	00008067          	ret
    else if (id->closed) return -2;
    80002b8c:	ffe00513          	li	a0,-2
    80002b90:	fd5ff06f          	j	80002b64 <_ZN4_sem4waitEPS_+0x44>
    if (id->closed) return -3;    // If _sem is dealocated while thread is blocked on it
    80002b94:	ffd00513          	li	a0,-3
    80002b98:	fcdff06f          	j	80002b64 <_ZN4_sem4waitEPS_+0x44>

0000000080002b9c <_ZN5Riscv15checkThreadModeEv>:

extern volatile uint64 ret;

Riscv::Mode Riscv::mode = PRIVILEGED_MODE;

void Riscv::checkThreadMode() {
    80002b9c:	ff010113          	addi	sp,sp,-16
    80002ba0:	00813423          	sd	s0,8(sp)
    80002ba4:	01010413          	addi	s0,sp,16
    if (mode == USER_MODE) {
    80002ba8:	00009797          	auipc	a5,0x9
    80002bac:	9707a783          	lw	a5,-1680(a5) # 8000b518 <_ZN5Riscv4modeE>
    80002bb0:	02079063          	bnez	a5,80002bd0 <_ZN5Riscv15checkThreadModeEv+0x34>
inline void Riscv::setBit_sstatus(uint64 mask) {
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
}

inline void Riscv::clearBit_sstatus(uint64 mask) {
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80002bb4:	10000793          	li	a5,256
    80002bb8:	1007b073          	csrc	sstatus,a5
    else {
        setBit_sstatus(SSTATUS_SPP);    // set SPP bit in sstatus register
        clearBit_sstatus(SSTATUS_SPIE);    // disallow interrupts in privileged mode
    }

    asm volatile("csrw sepc, ra");
    80002bbc:	14109073          	csrw	sepc,ra
    asm volatile("sret");
    80002bc0:	10200073          	sret
}
    80002bc4:	00813403          	ld	s0,8(sp)
    80002bc8:	01010113          	addi	sp,sp,16
    80002bcc:	00008067          	ret
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80002bd0:	10000793          	li	a5,256
    80002bd4:	1007a073          	csrs	sstatus,a5
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80002bd8:	02000793          	li	a5,32
    80002bdc:	1007b073          	csrc	sstatus,a5
}
    80002be0:	fddff06f          	j	80002bbc <_ZN5Riscv15checkThreadModeEv+0x20>

0000000080002be4 <_ZN5Riscv23handleSoftwareInterruptEv>:


void Riscv::handleSoftwareInterrupt() {
    80002be4:	f9010113          	addi	sp,sp,-112
    80002be8:	06113423          	sd	ra,104(sp)
    80002bec:	06813023          	sd	s0,96(sp)
    80002bf0:	07010413          	addi	s0,sp,112
    volatile uint64 param3;
    volatile uint64 param2;
    volatile uint64 param1;
    volatile uint64 functionCode;

    asm volatile ("mv %0, a4" : "=r" (param4));
    80002bf4:	00070793          	mv	a5,a4
    80002bf8:	fef43423          	sd	a5,-24(s0)
    asm volatile ("mv %0, a3" : "=r" (param3));
    80002bfc:	00068793          	mv	a5,a3
    80002c00:	fef43023          	sd	a5,-32(s0)
    asm volatile ("mv %0, a2" : "=r" (param2));
    80002c04:	00060793          	mv	a5,a2
    80002c08:	fcf43c23          	sd	a5,-40(s0)
    asm volatile ("mv %0, a1" : "=r" (param1));
    80002c0c:	00058793          	mv	a5,a1
    80002c10:	fcf43823          	sd	a5,-48(s0)
    asm volatile ("mv %0, a0" : "=r" (functionCode));
    80002c14:	00050793          	mv	a5,a0
    80002c18:	fcf43423          	sd	a5,-56(s0)
    asm volatile ("csrr %0, scause" : "=r" (scause));
    80002c1c:	142027f3          	csrr	a5,scause
    80002c20:	faf43423          	sd	a5,-88(s0)
    return scause;
    80002c24:	fa843783          	ld	a5,-88(s0)

    // Handle interrupt
    volatile uint64 scause = read_scause();
    80002c28:	fcf43023          	sd	a5,-64(s0)

    if (scause == 0x0000000000000008 || scause == 0x0000000000000009) {
    80002c2c:	fc043703          	ld	a4,-64(s0)
    80002c30:	00800793          	li	a5,8
    80002c34:	00f70863          	beq	a4,a5,80002c44 <_ZN5Riscv23handleSoftwareInterruptEv+0x60>
    80002c38:	fc043703          	ld	a4,-64(s0)
    80002c3c:	00900793          	li	a5,9
    80002c40:	04f71663          	bne	a4,a5,80002c8c <_ZN5Riscv23handleSoftwareInterruptEv+0xa8>
    asm volatile ("csrr %0, sepc" : "=r" (sepc));
    80002c44:	141027f3          	csrr	a5,sepc
    80002c48:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80002c4c:	fb843783          	ld	a5,-72(s0)
        // Get pc and sstatus
        volatile uint64 sepc = read_sepc();
    80002c50:	f8f43c23          	sd	a5,-104(s0)
    asm volatile ("csrr %0, sstatus" : "=r" (sstatus));
    80002c54:	100027f3          	csrr	a5,sstatus
    80002c58:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80002c5c:	fb043783          	ld	a5,-80(s0)
        volatile uint64 sstatus = read_sstatus();
    80002c60:	faf43023          	sd	a5,-96(s0)

        switch (functionCode) {
    80002c64:	fc843783          	ld	a5,-56(s0)
    80002c68:	05100713          	li	a4,81
    80002c6c:	06f76a63          	bltu	a4,a5,80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
    80002c70:	00279793          	slli	a5,a5,0x2
    80002c74:	00006717          	auipc	a4,0x6
    80002c78:	67470713          	addi	a4,a4,1652 # 800092e8 <CONSOLE_STATUS+0x2d8>
    80002c7c:	00e787b3          	add	a5,a5,a4
    80002c80:	0007a783          	lw	a5,0(a5)
    80002c84:	00e787b3          	add	a5,a5,a4
    80002c88:	00078067          	jr	a5
        write_sepc(sepc + 4);
    }
    else {

        // Unexpected scause
        printString("ERROR! scause=");
    80002c8c:	00006517          	auipc	a0,0x6
    80002c90:	64c50513          	addi	a0,a0,1612 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80002c94:	00002097          	auipc	ra,0x2
    80002c98:	248080e7          	jalr	584(ra) # 80004edc <_Z11printStringPKc>
        printInt((int) scause);
    80002c9c:	fc043503          	ld	a0,-64(s0)
    80002ca0:	00000613          	li	a2,0
    80002ca4:	00a00593          	li	a1,10
    80002ca8:	0005051b          	sext.w	a0,a0
    80002cac:	00002097          	auipc	ra,0x2
    80002cb0:	3e0080e7          	jalr	992(ra) # 8000508c <_Z8printIntiii>
        printString("\n");
    80002cb4:	00006517          	auipc	a0,0x6
    80002cb8:	55c50513          	addi	a0,a0,1372 # 80009210 <CONSOLE_STATUS+0x200>
    80002cbc:	00002097          	auipc	ra,0x2
    80002cc0:	220080e7          	jalr	544(ra) # 80004edc <_Z11printStringPKc>
    80002cc4:	0380006f          	j	80002cfc <_ZN5Riscv23handleSoftwareInterruptEv+0x118>
                ret = (uint64) MemoryAllocator::memoryAllocate(param1);
    80002cc8:	fd043503          	ld	a0,-48(s0)
    80002ccc:	00000097          	auipc	ra,0x0
    80002cd0:	22c080e7          	jalr	556(ra) # 80002ef8 <_ZN15MemoryAllocator14memoryAllocateEm>
    80002cd4:	00009797          	auipc	a5,0x9
    80002cd8:	9c47b783          	ld	a5,-1596(a5) # 8000b698 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002cdc:	00a7b023          	sd	a0,0(a5)

inline void Riscv::clearBit_sip(uint64 mask) {
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80002ce0:	00200793          	li	a5,2
    80002ce4:	1447b073          	csrc	sip,a5
        write_sstatus(sstatus);
    80002ce8:	fa043783          	ld	a5,-96(s0)
    asm volatile ("csrw sstatus, %0" : : "r" (sstatus));
    80002cec:	10079073          	csrw	sstatus,a5
        write_sepc(sepc + 4);
    80002cf0:	f9843783          	ld	a5,-104(s0)
    80002cf4:	00478793          	addi	a5,a5,4
    asm volatile ("csrw sepc, %0" : : "r" (sepc));
    80002cf8:	14179073          	csrw	sepc,a5

    }
}
    80002cfc:	06813083          	ld	ra,104(sp)
    80002d00:	06013403          	ld	s0,96(sp)
    80002d04:	07010113          	addi	sp,sp,112
    80002d08:	00008067          	ret
                ret = MemoryAllocator::memoryFree((void *) param1);
    80002d0c:	fd043503          	ld	a0,-48(s0)
    80002d10:	00000097          	auipc	ra,0x0
    80002d14:	29c080e7          	jalr	668(ra) # 80002fac <_ZN15MemoryAllocator10memoryFreeEPv>
    80002d18:	00009797          	auipc	a5,0x9
    80002d1c:	9807b783          	ld	a5,-1664(a5) # 8000b698 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002d20:	00a7b023          	sd	a0,0(a5)
                break;
    80002d24:	fbdff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                        ((TCB **) param1, (void (*)(void *)) param2, (void *) param3, (uint64 *) param4);
    80002d28:	fd043503          	ld	a0,-48(s0)
    80002d2c:	fd843583          	ld	a1,-40(s0)
    80002d30:	fe043603          	ld	a2,-32(s0)
    80002d34:	fe843683          	ld	a3,-24(s0)
    80002d38:	fffff097          	auipc	ra,0xfffff
    80002d3c:	7f4080e7          	jalr	2036(ra) # 8000252c <_ZN3TCB9createTCBEPPS_PFvPvES2_Pm>
                ret = TCB::createTCB
    80002d40:	00009797          	auipc	a5,0x9
    80002d44:	9587b783          	ld	a5,-1704(a5) # 8000b698 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002d48:	00a7b023          	sd	a0,0(a5)
                break;
    80002d4c:	f95ff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                TCB::exit();
    80002d50:	fffff097          	auipc	ra,0xfffff
    80002d54:	5f0080e7          	jalr	1520(ra) # 80002340 <_ZN3TCB4exitEv>
                break;
    80002d58:	f89ff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                TCB::dispatch();
    80002d5c:	fffff097          	auipc	ra,0xfffff
    80002d60:	3d4080e7          	jalr	980(ra) # 80002130 <_ZN3TCB8dispatchEv>
                break;
    80002d64:	f7dff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                TCB::join((TCB *) param1);
    80002d68:	fd043503          	ld	a0,-48(s0)
    80002d6c:	00000097          	auipc	ra,0x0
    80002d70:	86c080e7          	jalr	-1940(ra) # 800025d8 <_ZN3TCB4joinEPS_>
                break;
    80002d74:	f6dff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                ret = _sem::open((_sem **) param1, param2);
    80002d78:	fd043503          	ld	a0,-48(s0)
    80002d7c:	fd843583          	ld	a1,-40(s0)
    80002d80:	0005859b          	sext.w	a1,a1
    80002d84:	00000097          	auipc	ra,0x0
    80002d88:	b3c080e7          	jalr	-1220(ra) # 800028c0 <_ZN4_sem4openEPPS_j>
    80002d8c:	00009797          	auipc	a5,0x9
    80002d90:	90c7b783          	ld	a5,-1780(a5) # 8000b698 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002d94:	00a7b023          	sd	a0,0(a5)
                break;
    80002d98:	f49ff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                ret = _sem::close((_sem *) param1);
    80002d9c:	fd043503          	ld	a0,-48(s0)
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	c68080e7          	jalr	-920(ra) # 80002a08 <_ZN4_sem5closeEPS_>
    80002da8:	00009797          	auipc	a5,0x9
    80002dac:	8f07b783          	ld	a5,-1808(a5) # 8000b698 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002db0:	00a7b023          	sd	a0,0(a5)
                break;
    80002db4:	f2dff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                ret = _sem::wait((_sem *) param1);
    80002db8:	fd043503          	ld	a0,-48(s0)
    80002dbc:	00000097          	auipc	ra,0x0
    80002dc0:	d64080e7          	jalr	-668(ra) # 80002b20 <_ZN4_sem4waitEPS_>
    80002dc4:	00009797          	auipc	a5,0x9
    80002dc8:	8d47b783          	ld	a5,-1836(a5) # 8000b698 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002dcc:	00a7b023          	sd	a0,0(a5)
                break;
    80002dd0:	f11ff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                ret = _sem::signal((_sem *) param1);
    80002dd4:	fd043503          	ld	a0,-48(s0)
    80002dd8:	00000097          	auipc	ra,0x0
    80002ddc:	c90080e7          	jalr	-880(ra) # 80002a68 <_ZN4_sem6signalEPS_>
    80002de0:	00009797          	auipc	a5,0x9
    80002de4:	8b87b783          	ld	a5,-1864(a5) # 8000b698 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002de8:	00a7b023          	sd	a0,0(a5)
                break;
    80002dec:	ef5ff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                volatile char c = __getc();
    80002df0:	00005097          	auipc	ra,0x5
    80002df4:	1b8080e7          	jalr	440(ra) # 80007fa8 <__getc>
    80002df8:	f8a40ba3          	sb	a0,-105(s0)
                if (c == 0) asm volatile ("mv a0, %0" : : "r" (EOF));
    80002dfc:	f9744783          	lbu	a5,-105(s0)
    80002e00:	0ff7f793          	andi	a5,a5,255
    80002e04:	00079863          	bnez	a5,80002e14 <_ZN5Riscv23handleSoftwareInterruptEv+0x230>
    80002e08:	fff00793          	li	a5,-1
    80002e0c:	00078513          	mv	a0,a5
    80002e10:	ed1ff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                else asm volatile ("mv a0, %0" : : "r" (c));
    80002e14:	f9744783          	lbu	a5,-105(s0)
    80002e18:	00078513          	mv	a0,a5
    80002e1c:	ec5ff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
                __putc((char) param1);
    80002e20:	fd043503          	ld	a0,-48(s0)
    80002e24:	0ff57513          	andi	a0,a0,255
    80002e28:	00005097          	auipc	ra,0x5
    80002e2c:	144080e7          	jalr	324(ra) # 80007f6c <__putc>
                break;
    80002e30:	eb1ff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>
    static TCB* getRunningThread() { return runningThread; }
    80002e34:	00009797          	auipc	a5,0x9
    80002e38:	82c7b783          	ld	a5,-2004(a5) # 8000b660 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002e3c:	0007b783          	ld	a5,0(a5)
                ret = TCB::getRunningThread()->id;
    80002e40:	0507a703          	lw	a4,80(a5)
    80002e44:	00009797          	auipc	a5,0x9
    80002e48:	8547b783          	ld	a5,-1964(a5) # 8000b698 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002e4c:	00e7b023          	sd	a4,0(a5)
                break;
    80002e50:	e91ff06f          	j	80002ce0 <_ZN5Riscv23handleSoftwareInterruptEv+0xfc>

0000000080002e54 <_ZN5Riscv20handleTimerInterruptEv>:


void Riscv::handleTimerInterrupt() {
    80002e54:	ff010113          	addi	sp,sp,-16
    80002e58:	00813423          	sd	s0,8(sp)
    80002e5c:	01010413          	addi	s0,sp,16
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80002e60:	00200793          	li	a5,2
    80002e64:	1447b073          	csrc	sip,a5
    clearBit_sip(SIP_SSIP);
}
    80002e68:	00813403          	ld	s0,8(sp)
    80002e6c:	01010113          	addi	sp,sp,16
    80002e70:	00008067          	ret

0000000080002e74 <_ZN5Riscv22handleConsoleInterruptEv>:


void Riscv::handleConsoleInterrupt() {
    80002e74:	ff010113          	addi	sp,sp,-16
    80002e78:	00113423          	sd	ra,8(sp)
    80002e7c:	00813023          	sd	s0,0(sp)
    80002e80:	01010413          	addi	s0,sp,16
    console_handler();
    80002e84:	00005097          	auipc	ra,0x5
    80002e88:	15c080e7          	jalr	348(ra) # 80007fe0 <console_handler>
}
    80002e8c:	00813083          	ld	ra,8(sp)
    80002e90:	00013403          	ld	s0,0(sp)
    80002e94:	01010113          	addi	sp,sp,16
    80002e98:	00008067          	ret

0000000080002e9c <_ZN15MemoryAllocator20initFreeSegmentsListEv>:
#include "../h/MemoryAllocator.hpp"

MemoryAllocator::Node* MemoryAllocator::freeSegmentsHead = nullptr;
bool MemoryAllocator::initDone = false;

void MemoryAllocator::initFreeSegmentsList() {
    80002e9c:	ff010113          	addi	sp,sp,-16
    80002ea0:	00813423          	sd	s0,8(sp)
    80002ea4:	01010413          	addi	s0,sp,16
    if (!initDone) {
    80002ea8:	00009797          	auipc	a5,0x9
    80002eac:	8687c783          	lbu	a5,-1944(a5) # 8000b710 <_ZN15MemoryAllocator8initDoneE>
    80002eb0:	02079e63          	bnez	a5,80002eec <_ZN15MemoryAllocator20initFreeSegmentsListEv+0x50>
        freeSegmentsHead = (Node *) ((void *) HEAP_START_ADDR);
    80002eb4:	00008797          	auipc	a5,0x8
    80002eb8:	7a47b783          	ld	a5,1956(a5) # 8000b658 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002ebc:	0007b783          	ld	a5,0(a5)
    80002ec0:	00009697          	auipc	a3,0x9
    80002ec4:	85068693          	addi	a3,a3,-1968 # 8000b710 <_ZN15MemoryAllocator8initDoneE>
    80002ec8:	00f6b423          	sd	a5,8(a3)
        freeSegmentsHead->limit = (uint64) HEAP_END_ADDR - (uint64) HEAP_START_ADDR;
    80002ecc:	00008717          	auipc	a4,0x8
    80002ed0:	7bc73703          	ld	a4,1980(a4) # 8000b688 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002ed4:	00073703          	ld	a4,0(a4)
    80002ed8:	40f70733          	sub	a4,a4,a5
    80002edc:	00e7b423          	sd	a4,8(a5)
        freeSegmentsHead->next = nullptr;
    80002ee0:	0007b023          	sd	zero,0(a5)
        initDone = true;
    80002ee4:	00100793          	li	a5,1
    80002ee8:	00f68023          	sb	a5,0(a3)
    }
}
    80002eec:	00813403          	ld	s0,8(sp)
    80002ef0:	01010113          	addi	sp,sp,16
    80002ef4:	00008067          	ret

0000000080002ef8 <_ZN15MemoryAllocator14memoryAllocateEm>:


void* MemoryAllocator::memoryAllocate(uint64 numOfBlocks) {
    80002ef8:	fe010113          	addi	sp,sp,-32
    80002efc:	00813c23          	sd	s0,24(sp)
    80002f00:	02010413          	addi	s0,sp,32
    volatile size_t size = numOfBlocks * MEM_BLOCK_SIZE;
    80002f04:	00651513          	slli	a0,a0,0x6
    80002f08:	fea43423          	sd	a0,-24(s0)

    // Try to find free segment
    Node *curr = freeSegmentsHead, *prev = nullptr;
    80002f0c:	00009517          	auipc	a0,0x9
    80002f10:	80c53503          	ld	a0,-2036(a0) # 8000b718 <_ZN15MemoryAllocator16freeSegmentsHeadE>
    80002f14:	00000693          	li	a3,0

    for (; curr; curr = curr->next) {
    80002f18:	04050e63          	beqz	a0,80002f74 <_ZN15MemoryAllocator14memoryAllocateEm+0x7c>
        if (curr->limit >= size) {
    80002f1c:	00853783          	ld	a5,8(a0)
    80002f20:	fe843703          	ld	a4,-24(s0)
    80002f24:	00e7f863          	bgeu	a5,a4,80002f34 <_ZN15MemoryAllocator14memoryAllocateEm+0x3c>

            curr->next = nullptr;

            return (char *) curr + sizeof(Node);
        }
        prev = curr;
    80002f28:	00050693          	mv	a3,a0
    for (; curr; curr = curr->next) {
    80002f2c:	00053503          	ld	a0,0(a0)
    80002f30:	fe9ff06f          	j	80002f18 <_ZN15MemoryAllocator14memoryAllocateEm+0x20>
            if (curr->limit > size) {
    80002f34:	fe843703          	ld	a4,-24(s0)
    80002f38:	04f77a63          	bgeu	a4,a5,80002f8c <_ZN15MemoryAllocator14memoryAllocateEm+0x94>
                Node *newNode = (Node *) ((char *) curr + size);
    80002f3c:	fe843783          	ld	a5,-24(s0)
    80002f40:	00f507b3          	add	a5,a0,a5
                if (prev) prev->next = newNode;
    80002f44:	02068e63          	beqz	a3,80002f80 <_ZN15MemoryAllocator14memoryAllocateEm+0x88>
    80002f48:	00f6b023          	sd	a5,0(a3)
                newNode->next = curr->next;
    80002f4c:	00053703          	ld	a4,0(a0)
    80002f50:	00e7b023          	sd	a4,0(a5)
                newNode->limit = curr->limit - size;
    80002f54:	00853703          	ld	a4,8(a0)
    80002f58:	fe843683          	ld	a3,-24(s0)
    80002f5c:	40d70733          	sub	a4,a4,a3
    80002f60:	00e7b423          	sd	a4,8(a5)
                curr->limit = size;
    80002f64:	fe843783          	ld	a5,-24(s0)
    80002f68:	00f53423          	sd	a5,8(a0)
            curr->next = nullptr;
    80002f6c:	00053023          	sd	zero,0(a0)
            return (char *) curr + sizeof(Node);
    80002f70:	01050513          	addi	a0,a0,16
    }

    // If free segment is not found
    return nullptr;
}
    80002f74:	01813403          	ld	s0,24(sp)
    80002f78:	02010113          	addi	sp,sp,32
    80002f7c:	00008067          	ret
                else freeSegmentsHead = newNode;
    80002f80:	00008717          	auipc	a4,0x8
    80002f84:	78f73c23          	sd	a5,1944(a4) # 8000b718 <_ZN15MemoryAllocator16freeSegmentsHeadE>
    80002f88:	fc5ff06f          	j	80002f4c <_ZN15MemoryAllocator14memoryAllocateEm+0x54>
                if (prev) prev->next = curr->next;
    80002f8c:	00068863          	beqz	a3,80002f9c <_ZN15MemoryAllocator14memoryAllocateEm+0xa4>
    80002f90:	00053783          	ld	a5,0(a0)
    80002f94:	00f6b023          	sd	a5,0(a3)
    80002f98:	fd5ff06f          	j	80002f6c <_ZN15MemoryAllocator14memoryAllocateEm+0x74>
                else freeSegmentsHead = curr->next;
    80002f9c:	00053783          	ld	a5,0(a0)
    80002fa0:	00008717          	auipc	a4,0x8
    80002fa4:	76f73c23          	sd	a5,1912(a4) # 8000b718 <_ZN15MemoryAllocator16freeSegmentsHeadE>
    80002fa8:	fc5ff06f          	j	80002f6c <_ZN15MemoryAllocator14memoryAllocateEm+0x74>

0000000080002fac <_ZN15MemoryAllocator10memoryFreeEPv>:


int MemoryAllocator::memoryFree(void *p) {
    80002fac:	ff010113          	addi	sp,sp,-16
    80002fb0:	00813423          	sd	s0,8(sp)
    80002fb4:	01010413          	addi	s0,sp,16
    if (p == nullptr) return -1;
    80002fb8:	10050463          	beqz	a0,800030c0 <_ZN15MemoryAllocator10memoryFreeEPv+0x114>
    p = (void *) ((char *) p - sizeof(Node));
    80002fbc:	ff050693          	addi	a3,a0,-16
    size_t size = ((Node *) p)->limit;
    80002fc0:	ff853803          	ld	a6,-8(a0)
    Node *curr = freeSegmentsHead, *prev = nullptr;
    80002fc4:	00008797          	auipc	a5,0x8
    80002fc8:	7547b783          	ld	a5,1876(a5) # 8000b718 <_ZN15MemoryAllocator16freeSegmentsHeadE>
    80002fcc:	00000713          	li	a4,0
    80002fd0:	0280006f          	j	80002ff8 <_ZN15MemoryAllocator10memoryFreeEPv+0x4c>
            prev->limit += size + curr->limit;

            prev->next = curr->next;
            curr->next = nullptr;
            break;
        } else if (prev != nullptr && (char *) p == (char *) prev + prev->limit) {   // Odma nakon free segmenta
    80002fd4:	00070863          	beqz	a4,80002fe4 <_ZN15MemoryAllocator10memoryFreeEPv+0x38>
    80002fd8:	00873603          	ld	a2,8(a4)
    80002fdc:	00c705b3          	add	a1,a4,a2
    80002fe0:	04d58a63          	beq	a1,a3,80003034 <_ZN15MemoryAllocator10memoryFreeEPv+0x88>
            prev->limit += size;
            break;
        } else if ((char *) p + size == (char *) curr) {   // Odma pre free segmenta
    80002fe4:	01068633          	add	a2,a3,a6
    80002fe8:	04f60c63          	beq	a2,a5,80003040 <_ZN15MemoryAllocator10memoryFreeEPv+0x94>
            else freeSegmentsHead = mergedFreeSegment;
            mergedFreeSegment->next = curr->next;
            curr->next = nullptr;
            mergedFreeSegment->limit += curr->limit;
            break;
        } else if ((char *) p < (char *) curr) {   // Negde izmedju bez dodirivanja bilo kog free segmenta
    80002fec:	08f6ec63          	bltu	a3,a5,80003084 <_ZN15MemoryAllocator10memoryFreeEPv+0xd8>
            if (prev) prev->next = newFreeSegment;
            else freeSegmentsHead = newFreeSegment;
            newFreeSegment->next = curr;
            break;
        }
        prev = curr;
    80002ff0:	00078713          	mv	a4,a5
    for (; curr; curr = curr->next) {
    80002ff4:	0007b783          	ld	a5,0(a5)
    80002ff8:	06078663          	beqz	a5,80003064 <_ZN15MemoryAllocator10memoryFreeEPv+0xb8>
        if (prev != nullptr && (char *) p == (char *) prev + prev->limit && (char *) p + size == (char *) curr) {   // Tacno izmedju dva free segmenta
    80002ffc:	fc070ce3          	beqz	a4,80002fd4 <_ZN15MemoryAllocator10memoryFreeEPv+0x28>
    80003000:	00873603          	ld	a2,8(a4)
    80003004:	00c705b3          	add	a1,a4,a2
    80003008:	fcd596e3          	bne	a1,a3,80002fd4 <_ZN15MemoryAllocator10memoryFreeEPv+0x28>
    8000300c:	010685b3          	add	a1,a3,a6
    80003010:	fcf592e3          	bne	a1,a5,80002fd4 <_ZN15MemoryAllocator10memoryFreeEPv+0x28>
            prev->limit += size + curr->limit;
    80003014:	0087b583          	ld	a1,8(a5)
    80003018:	01058833          	add	a6,a1,a6
    8000301c:	01060633          	add	a2,a2,a6
    80003020:	00c73423          	sd	a2,8(a4)
            prev->next = curr->next;
    80003024:	0007b603          	ld	a2,0(a5)
    80003028:	00c73023          	sd	a2,0(a4)
            curr->next = nullptr;
    8000302c:	0007b023          	sd	zero,0(a5)
            break;
    80003030:	0340006f          	j	80003064 <_ZN15MemoryAllocator10memoryFreeEPv+0xb8>
            prev->limit += size;
    80003034:	01060633          	add	a2,a2,a6
    80003038:	00c73423          	sd	a2,8(a4)
            break;
    8000303c:	0280006f          	j	80003064 <_ZN15MemoryAllocator10memoryFreeEPv+0xb8>
            if (prev) prev->next = mergedFreeSegment;
    80003040:	02070c63          	beqz	a4,80003078 <_ZN15MemoryAllocator10memoryFreeEPv+0xcc>
    80003044:	00d73023          	sd	a3,0(a4)
            mergedFreeSegment->next = curr->next;
    80003048:	0007b603          	ld	a2,0(a5)
    8000304c:	fec53823          	sd	a2,-16(a0)
            curr->next = nullptr;
    80003050:	0007b023          	sd	zero,0(a5)
            mergedFreeSegment->limit += curr->limit;
    80003054:	0087b583          	ld	a1,8(a5)
    80003058:	ff853603          	ld	a2,-8(a0)
    8000305c:	00b60633          	add	a2,a2,a1
    80003060:	fec53c23          	sd	a2,-8(a0)
    }

    if (curr == nullptr) {
    80003064:	02078e63          	beqz	a5,800030a0 <_ZN15MemoryAllocator10memoryFreeEPv+0xf4>
        if (prev) prev->next = newFreeSegment;
        else freeSegmentsHead = newFreeSegment;
        newFreeSegment->next = curr;
    }

    return 0;
    80003068:	00000513          	li	a0,0
}
    8000306c:	00813403          	ld	s0,8(sp)
    80003070:	01010113          	addi	sp,sp,16
    80003074:	00008067          	ret
            else freeSegmentsHead = mergedFreeSegment;
    80003078:	00008617          	auipc	a2,0x8
    8000307c:	6ad63023          	sd	a3,1696(a2) # 8000b718 <_ZN15MemoryAllocator16freeSegmentsHeadE>
    80003080:	fc9ff06f          	j	80003048 <_ZN15MemoryAllocator10memoryFreeEPv+0x9c>
            if (prev) prev->next = newFreeSegment;
    80003084:	00070863          	beqz	a4,80003094 <_ZN15MemoryAllocator10memoryFreeEPv+0xe8>
    80003088:	00d73023          	sd	a3,0(a4)
            newFreeSegment->next = curr;
    8000308c:	fef53823          	sd	a5,-16(a0)
            break;
    80003090:	fd5ff06f          	j	80003064 <_ZN15MemoryAllocator10memoryFreeEPv+0xb8>
            else freeSegmentsHead = newFreeSegment;
    80003094:	00008617          	auipc	a2,0x8
    80003098:	68d63223          	sd	a3,1668(a2) # 8000b718 <_ZN15MemoryAllocator16freeSegmentsHeadE>
    8000309c:	ff1ff06f          	j	8000308c <_ZN15MemoryAllocator10memoryFreeEPv+0xe0>
        if (prev) prev->next = newFreeSegment;
    800030a0:	00070a63          	beqz	a4,800030b4 <_ZN15MemoryAllocator10memoryFreeEPv+0x108>
    800030a4:	00d73023          	sd	a3,0(a4)
        newFreeSegment->next = curr;
    800030a8:	fef53823          	sd	a5,-16(a0)
    return 0;
    800030ac:	00000513          	li	a0,0
    800030b0:	fbdff06f          	j	8000306c <_ZN15MemoryAllocator10memoryFreeEPv+0xc0>
        else freeSegmentsHead = newFreeSegment;
    800030b4:	00008717          	auipc	a4,0x8
    800030b8:	66d73223          	sd	a3,1636(a4) # 8000b718 <_ZN15MemoryAllocator16freeSegmentsHeadE>
    800030bc:	fedff06f          	j	800030a8 <_ZN15MemoryAllocator10memoryFreeEPv+0xfc>
    if (p == nullptr) return -1;
    800030c0:	fff00513          	li	a0,-1
    800030c4:	fa9ff06f          	j	8000306c <_ZN15MemoryAllocator10memoryFreeEPv+0xc0>

00000000800030c8 <_Z12print_StringPKc>:
#include "../h/Print.hpp"
#include "../h/syscall_c.hpp"

void print_String(const char *string) {
    800030c8:	fe010113          	addi	sp,sp,-32
    800030cc:	00113c23          	sd	ra,24(sp)
    800030d0:	00813823          	sd	s0,16(sp)
    800030d4:	00913423          	sd	s1,8(sp)
    800030d8:	02010413          	addi	s0,sp,32
    800030dc:	00050493          	mv	s1,a0
    while (*string != '\0') {
    800030e0:	0004c503          	lbu	a0,0(s1)
    800030e4:	00050a63          	beqz	a0,800030f8 <_Z12print_StringPKc+0x30>
        putc(*string);
    800030e8:	ffffe097          	auipc	ra,0xffffe
    800030ec:	530080e7          	jalr	1328(ra) # 80001618 <_Z4putcc>
        string++;
    800030f0:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    800030f4:	fedff06f          	j	800030e0 <_Z12print_StringPKc+0x18>
    }
}
    800030f8:	01813083          	ld	ra,24(sp)
    800030fc:	01013403          	ld	s0,16(sp)
    80003100:	00813483          	ld	s1,8(sp)
    80003104:	02010113          	addi	sp,sp,32
    80003108:	00008067          	ret

000000008000310c <_Z13print_Integerl>:

void print_Integer(long value){
    8000310c:	fc010113          	addi	sp,sp,-64
    80003110:	02113c23          	sd	ra,56(sp)
    80003114:	02813823          	sd	s0,48(sp)
    80003118:	02913423          	sd	s1,40(sp)
    8000311c:	04010413          	addi	s0,sp,64
    if (value == 0) {
    80003120:	06050063          	beqz	a0,80003180 <_Z13print_Integerl+0x74>
        putc('0');
        return;
    }

    bool negative = false;
    if (value < 0) {
    80003124:	06054663          	bltz	a0,80003190 <_Z13print_Integerl+0x84>
    bool negative = false;
    80003128:	00000613          	li	a2,0
        value = -value;
        negative = true;
    }

    char digits[] = "0123456789";
    8000312c:	00006797          	auipc	a5,0x6
    80003130:	30478793          	addi	a5,a5,772 # 80009430 <CONSOLE_STATUS+0x420>
    80003134:	0007b703          	ld	a4,0(a5)
    80003138:	fce43823          	sd	a4,-48(s0)
    8000313c:	0087d703          	lhu	a4,8(a5)
    80003140:	fce41c23          	sh	a4,-40(s0)
    80003144:	00a7c783          	lbu	a5,10(a5)
    80003148:	fcf40d23          	sb	a5,-38(s0)
    char number[16];
    int i;

    for (i = 0; value != 0; value /= 10) {
    8000314c:	00000493          	li	s1,0
    80003150:	04050663          	beqz	a0,8000319c <_Z13print_Integerl+0x90>
        number[i++] = digits[value % 10];
    80003154:	00a00713          	li	a4,10
    80003158:	02e567b3          	rem	a5,a0,a4
    8000315c:	fe040693          	addi	a3,s0,-32
    80003160:	00f687b3          	add	a5,a3,a5
    80003164:	ff07c683          	lbu	a3,-16(a5)
    80003168:	fe040793          	addi	a5,s0,-32
    8000316c:	009787b3          	add	a5,a5,s1
    80003170:	fed78023          	sb	a3,-32(a5)
    for (i = 0; value != 0; value /= 10) {
    80003174:	02e54533          	div	a0,a0,a4
        number[i++] = digits[value % 10];
    80003178:	0014849b          	addiw	s1,s1,1
    for (i = 0; value != 0; value /= 10) {
    8000317c:	fd5ff06f          	j	80003150 <_Z13print_Integerl+0x44>
        putc('0');
    80003180:	03000513          	li	a0,48
    80003184:	ffffe097          	auipc	ra,0xffffe
    80003188:	494080e7          	jalr	1172(ra) # 80001618 <_Z4putcc>
        return;
    8000318c:	0480006f          	j	800031d4 <_Z13print_Integerl+0xc8>
        value = -value;
    80003190:	40a00533          	neg	a0,a0
        negative = true;
    80003194:	00100613          	li	a2,1
    80003198:	f95ff06f          	j	8000312c <_Z13print_Integerl+0x20>
    }

    if (negative) number[i++] = '-';
    8000319c:	02060863          	beqz	a2,800031cc <_Z13print_Integerl+0xc0>
    800031a0:	fe040793          	addi	a5,s0,-32
    800031a4:	009787b3          	add	a5,a5,s1
    800031a8:	02d00713          	li	a4,45
    800031ac:	fee78023          	sb	a4,-32(a5)
    800031b0:	0014849b          	addiw	s1,s1,1
    800031b4:	0180006f          	j	800031cc <_Z13print_Integerl+0xc0>
    while (--i >= 0) putc(number[i]);
    800031b8:	fe040793          	addi	a5,s0,-32
    800031bc:	009787b3          	add	a5,a5,s1
    800031c0:	fe07c503          	lbu	a0,-32(a5)
    800031c4:	ffffe097          	auipc	ra,0xffffe
    800031c8:	454080e7          	jalr	1108(ra) # 80001618 <_Z4putcc>
    800031cc:	fff4849b          	addiw	s1,s1,-1
    800031d0:	fe04d4e3          	bgez	s1,800031b8 <_Z13print_Integerl+0xac>
}
    800031d4:	03813083          	ld	ra,56(sp)
    800031d8:	03013403          	ld	s0,48(sp)
    800031dc:	02813483          	ld	s1,40(sp)
    800031e0:	04010113          	addi	sp,sp,64
    800031e4:	00008067          	ret

00000000800031e8 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800031e8:	fe010113          	addi	sp,sp,-32
    800031ec:	00113c23          	sd	ra,24(sp)
    800031f0:	00813823          	sd	s0,16(sp)
    800031f4:	00913423          	sd	s1,8(sp)
    800031f8:	01213023          	sd	s2,0(sp)
    800031fc:	02010413          	addi	s0,sp,32
    80003200:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003204:	00000913          	li	s2,0
    80003208:	00c0006f          	j	80003214 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000320c:	ffffe097          	auipc	ra,0xffffe
    80003210:	2b8080e7          	jalr	696(ra) # 800014c4 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003214:	ffffe097          	auipc	ra,0xffffe
    80003218:	3d0080e7          	jalr	976(ra) # 800015e4 <_Z4getcv>
    8000321c:	0005059b          	sext.w	a1,a0
    80003220:	01b00793          	li	a5,27
    80003224:	02f58a63          	beq	a1,a5,80003258 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003228:	0084b503          	ld	a0,8(s1)
    8000322c:	00003097          	auipc	ra,0x3
    80003230:	9fc080e7          	jalr	-1540(ra) # 80005c28 <_ZN6Buffer3putEi>
        i++;
    80003234:	0019071b          	addiw	a4,s2,1
    80003238:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000323c:	0004a683          	lw	a3,0(s1)
    80003240:	0026979b          	slliw	a5,a3,0x2
    80003244:	00d787bb          	addw	a5,a5,a3
    80003248:	0017979b          	slliw	a5,a5,0x1
    8000324c:	02f767bb          	remw	a5,a4,a5
    80003250:	fc0792e3          	bnez	a5,80003214 <_ZL16producerKeyboardPv+0x2c>
    80003254:	fb9ff06f          	j	8000320c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003258:	00100793          	li	a5,1
    8000325c:	00008717          	auipc	a4,0x8
    80003260:	4cf72223          	sw	a5,1220(a4) # 8000b720 <_ZL9threadEnd>
    data->buffer->put('!');
    80003264:	02100593          	li	a1,33
    80003268:	0084b503          	ld	a0,8(s1)
    8000326c:	00003097          	auipc	ra,0x3
    80003270:	9bc080e7          	jalr	-1604(ra) # 80005c28 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003274:	0104b503          	ld	a0,16(s1)
    80003278:	ffffe097          	auipc	ra,0xffffe
    8000327c:	338080e7          	jalr	824(ra) # 800015b0 <_Z10sem_signalP4_sem>
}
    80003280:	01813083          	ld	ra,24(sp)
    80003284:	01013403          	ld	s0,16(sp)
    80003288:	00813483          	ld	s1,8(sp)
    8000328c:	00013903          	ld	s2,0(sp)
    80003290:	02010113          	addi	sp,sp,32
    80003294:	00008067          	ret

0000000080003298 <_ZL8producerPv>:

static void producer(void *arg) {
    80003298:	fe010113          	addi	sp,sp,-32
    8000329c:	00113c23          	sd	ra,24(sp)
    800032a0:	00813823          	sd	s0,16(sp)
    800032a4:	00913423          	sd	s1,8(sp)
    800032a8:	01213023          	sd	s2,0(sp)
    800032ac:	02010413          	addi	s0,sp,32
    800032b0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800032b4:	00000913          	li	s2,0
    800032b8:	00c0006f          	j	800032c4 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800032bc:	ffffe097          	auipc	ra,0xffffe
    800032c0:	208080e7          	jalr	520(ra) # 800014c4 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800032c4:	00008797          	auipc	a5,0x8
    800032c8:	45c7a783          	lw	a5,1116(a5) # 8000b720 <_ZL9threadEnd>
    800032cc:	02079e63          	bnez	a5,80003308 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800032d0:	0004a583          	lw	a1,0(s1)
    800032d4:	0305859b          	addiw	a1,a1,48
    800032d8:	0084b503          	ld	a0,8(s1)
    800032dc:	00003097          	auipc	ra,0x3
    800032e0:	94c080e7          	jalr	-1716(ra) # 80005c28 <_ZN6Buffer3putEi>
        i++;
    800032e4:	0019071b          	addiw	a4,s2,1
    800032e8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800032ec:	0004a683          	lw	a3,0(s1)
    800032f0:	0026979b          	slliw	a5,a3,0x2
    800032f4:	00d787bb          	addw	a5,a5,a3
    800032f8:	0017979b          	slliw	a5,a5,0x1
    800032fc:	02f767bb          	remw	a5,a4,a5
    80003300:	fc0792e3          	bnez	a5,800032c4 <_ZL8producerPv+0x2c>
    80003304:	fb9ff06f          	j	800032bc <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003308:	0104b503          	ld	a0,16(s1)
    8000330c:	ffffe097          	auipc	ra,0xffffe
    80003310:	2a4080e7          	jalr	676(ra) # 800015b0 <_Z10sem_signalP4_sem>
}
    80003314:	01813083          	ld	ra,24(sp)
    80003318:	01013403          	ld	s0,16(sp)
    8000331c:	00813483          	ld	s1,8(sp)
    80003320:	00013903          	ld	s2,0(sp)
    80003324:	02010113          	addi	sp,sp,32
    80003328:	00008067          	ret

000000008000332c <_ZL8consumerPv>:

static void consumer(void *arg) {
    8000332c:	fd010113          	addi	sp,sp,-48
    80003330:	02113423          	sd	ra,40(sp)
    80003334:	02813023          	sd	s0,32(sp)
    80003338:	00913c23          	sd	s1,24(sp)
    8000333c:	01213823          	sd	s2,16(sp)
    80003340:	01313423          	sd	s3,8(sp)
    80003344:	03010413          	addi	s0,sp,48
    80003348:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000334c:	00000993          	li	s3,0
    80003350:	01c0006f          	j	8000336c <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003354:	ffffe097          	auipc	ra,0xffffe
    80003358:	170080e7          	jalr	368(ra) # 800014c4 <_Z15thread_dispatchv>
    8000335c:	0500006f          	j	800033ac <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003360:	00a00513          	li	a0,10
    80003364:	ffffe097          	auipc	ra,0xffffe
    80003368:	2b4080e7          	jalr	692(ra) # 80001618 <_Z4putcc>
    while (!threadEnd) {
    8000336c:	00008797          	auipc	a5,0x8
    80003370:	3b47a783          	lw	a5,948(a5) # 8000b720 <_ZL9threadEnd>
    80003374:	06079063          	bnez	a5,800033d4 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003378:	00893503          	ld	a0,8(s2)
    8000337c:	00003097          	auipc	ra,0x3
    80003380:	93c080e7          	jalr	-1732(ra) # 80005cb8 <_ZN6Buffer3getEv>
        i++;
    80003384:	0019849b          	addiw	s1,s3,1
    80003388:	0004899b          	sext.w	s3,s1
        putc(key);
    8000338c:	0ff57513          	andi	a0,a0,255
    80003390:	ffffe097          	auipc	ra,0xffffe
    80003394:	288080e7          	jalr	648(ra) # 80001618 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003398:	00092703          	lw	a4,0(s2)
    8000339c:	0027179b          	slliw	a5,a4,0x2
    800033a0:	00e787bb          	addw	a5,a5,a4
    800033a4:	02f4e7bb          	remw	a5,s1,a5
    800033a8:	fa0786e3          	beqz	a5,80003354 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800033ac:	05000793          	li	a5,80
    800033b0:	02f4e4bb          	remw	s1,s1,a5
    800033b4:	fa049ce3          	bnez	s1,8000336c <_ZL8consumerPv+0x40>
    800033b8:	fa9ff06f          	j	80003360 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800033bc:	00893503          	ld	a0,8(s2)
    800033c0:	00003097          	auipc	ra,0x3
    800033c4:	8f8080e7          	jalr	-1800(ra) # 80005cb8 <_ZN6Buffer3getEv>
        putc(key);
    800033c8:	0ff57513          	andi	a0,a0,255
    800033cc:	ffffe097          	auipc	ra,0xffffe
    800033d0:	24c080e7          	jalr	588(ra) # 80001618 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800033d4:	00893503          	ld	a0,8(s2)
    800033d8:	00003097          	auipc	ra,0x3
    800033dc:	96c080e7          	jalr	-1684(ra) # 80005d44 <_ZN6Buffer6getCntEv>
    800033e0:	fca04ee3          	bgtz	a0,800033bc <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    800033e4:	01093503          	ld	a0,16(s2)
    800033e8:	ffffe097          	auipc	ra,0xffffe
    800033ec:	1c8080e7          	jalr	456(ra) # 800015b0 <_Z10sem_signalP4_sem>
}
    800033f0:	02813083          	ld	ra,40(sp)
    800033f4:	02013403          	ld	s0,32(sp)
    800033f8:	01813483          	ld	s1,24(sp)
    800033fc:	01013903          	ld	s2,16(sp)
    80003400:	00813983          	ld	s3,8(sp)
    80003404:	03010113          	addi	sp,sp,48
    80003408:	00008067          	ret

000000008000340c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000340c:	f9010113          	addi	sp,sp,-112
    80003410:	06113423          	sd	ra,104(sp)
    80003414:	06813023          	sd	s0,96(sp)
    80003418:	04913c23          	sd	s1,88(sp)
    8000341c:	05213823          	sd	s2,80(sp)
    80003420:	05313423          	sd	s3,72(sp)
    80003424:	05413023          	sd	s4,64(sp)
    80003428:	03513c23          	sd	s5,56(sp)
    8000342c:	03613823          	sd	s6,48(sp)
    80003430:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003434:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003438:	00006517          	auipc	a0,0x6
    8000343c:	00850513          	addi	a0,a0,8 # 80009440 <CONSOLE_STATUS+0x430>
    80003440:	00002097          	auipc	ra,0x2
    80003444:	a9c080e7          	jalr	-1380(ra) # 80004edc <_Z11printStringPKc>
    getString(input, 30);
    80003448:	01e00593          	li	a1,30
    8000344c:	fa040493          	addi	s1,s0,-96
    80003450:	00048513          	mv	a0,s1
    80003454:	00002097          	auipc	ra,0x2
    80003458:	b10080e7          	jalr	-1264(ra) # 80004f64 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000345c:	00048513          	mv	a0,s1
    80003460:	00002097          	auipc	ra,0x2
    80003464:	bdc080e7          	jalr	-1060(ra) # 8000503c <_Z11stringToIntPKc>
    80003468:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000346c:	00006517          	auipc	a0,0x6
    80003470:	ff450513          	addi	a0,a0,-12 # 80009460 <CONSOLE_STATUS+0x450>
    80003474:	00002097          	auipc	ra,0x2
    80003478:	a68080e7          	jalr	-1432(ra) # 80004edc <_Z11printStringPKc>
    getString(input, 30);
    8000347c:	01e00593          	li	a1,30
    80003480:	00048513          	mv	a0,s1
    80003484:	00002097          	auipc	ra,0x2
    80003488:	ae0080e7          	jalr	-1312(ra) # 80004f64 <_Z9getStringPci>
    n = stringToInt(input);
    8000348c:	00048513          	mv	a0,s1
    80003490:	00002097          	auipc	ra,0x2
    80003494:	bac080e7          	jalr	-1108(ra) # 8000503c <_Z11stringToIntPKc>
    80003498:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000349c:	00006517          	auipc	a0,0x6
    800034a0:	fe450513          	addi	a0,a0,-28 # 80009480 <CONSOLE_STATUS+0x470>
    800034a4:	00002097          	auipc	ra,0x2
    800034a8:	a38080e7          	jalr	-1480(ra) # 80004edc <_Z11printStringPKc>
    800034ac:	00000613          	li	a2,0
    800034b0:	00a00593          	li	a1,10
    800034b4:	00090513          	mv	a0,s2
    800034b8:	00002097          	auipc	ra,0x2
    800034bc:	bd4080e7          	jalr	-1068(ra) # 8000508c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800034c0:	00006517          	auipc	a0,0x6
    800034c4:	fd850513          	addi	a0,a0,-40 # 80009498 <CONSOLE_STATUS+0x488>
    800034c8:	00002097          	auipc	ra,0x2
    800034cc:	a14080e7          	jalr	-1516(ra) # 80004edc <_Z11printStringPKc>
    800034d0:	00000613          	li	a2,0
    800034d4:	00a00593          	li	a1,10
    800034d8:	00048513          	mv	a0,s1
    800034dc:	00002097          	auipc	ra,0x2
    800034e0:	bb0080e7          	jalr	-1104(ra) # 8000508c <_Z8printIntiii>
    printString(".\n");
    800034e4:	00006517          	auipc	a0,0x6
    800034e8:	fcc50513          	addi	a0,a0,-52 # 800094b0 <CONSOLE_STATUS+0x4a0>
    800034ec:	00002097          	auipc	ra,0x2
    800034f0:	9f0080e7          	jalr	-1552(ra) # 80004edc <_Z11printStringPKc>
    if(threadNum > n) {
    800034f4:	0324c463          	blt	s1,s2,8000351c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800034f8:	03205c63          	blez	s2,80003530 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800034fc:	03800513          	li	a0,56
    80003500:	ffffe097          	auipc	ra,0xffffe
    80003504:	704080e7          	jalr	1796(ra) # 80001c04 <_Znwm>
    80003508:	00050a13          	mv	s4,a0
    8000350c:	00048593          	mv	a1,s1
    80003510:	00002097          	auipc	ra,0x2
    80003514:	67c080e7          	jalr	1660(ra) # 80005b8c <_ZN6BufferC1Ei>
    80003518:	0300006f          	j	80003548 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000351c:	00006517          	auipc	a0,0x6
    80003520:	f9c50513          	addi	a0,a0,-100 # 800094b8 <CONSOLE_STATUS+0x4a8>
    80003524:	00002097          	auipc	ra,0x2
    80003528:	9b8080e7          	jalr	-1608(ra) # 80004edc <_Z11printStringPKc>
        return;
    8000352c:	0140006f          	j	80003540 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003530:	00006517          	auipc	a0,0x6
    80003534:	fc850513          	addi	a0,a0,-56 # 800094f8 <CONSOLE_STATUS+0x4e8>
    80003538:	00002097          	auipc	ra,0x2
    8000353c:	9a4080e7          	jalr	-1628(ra) # 80004edc <_Z11printStringPKc>
        return;
    80003540:	000b0113          	mv	sp,s6
    80003544:	1500006f          	j	80003694 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003548:	00000593          	li	a1,0
    8000354c:	00008517          	auipc	a0,0x8
    80003550:	1dc50513          	addi	a0,a0,476 # 8000b728 <_ZL10waitForAll>
    80003554:	ffffe097          	auipc	ra,0xffffe
    80003558:	fbc080e7          	jalr	-68(ra) # 80001510 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    8000355c:	00391793          	slli	a5,s2,0x3
    80003560:	00f78793          	addi	a5,a5,15
    80003564:	ff07f793          	andi	a5,a5,-16
    80003568:	40f10133          	sub	sp,sp,a5
    8000356c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003570:	0019071b          	addiw	a4,s2,1
    80003574:	00171793          	slli	a5,a4,0x1
    80003578:	00e787b3          	add	a5,a5,a4
    8000357c:	00379793          	slli	a5,a5,0x3
    80003580:	00f78793          	addi	a5,a5,15
    80003584:	ff07f793          	andi	a5,a5,-16
    80003588:	40f10133          	sub	sp,sp,a5
    8000358c:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003590:	00191613          	slli	a2,s2,0x1
    80003594:	012607b3          	add	a5,a2,s2
    80003598:	00379793          	slli	a5,a5,0x3
    8000359c:	00f987b3          	add	a5,s3,a5
    800035a0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800035a4:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800035a8:	00008717          	auipc	a4,0x8
    800035ac:	18073703          	ld	a4,384(a4) # 8000b728 <_ZL10waitForAll>
    800035b0:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800035b4:	00078613          	mv	a2,a5
    800035b8:	00000597          	auipc	a1,0x0
    800035bc:	d7458593          	addi	a1,a1,-652 # 8000332c <_ZL8consumerPv>
    800035c0:	f9840513          	addi	a0,s0,-104
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	e38080e7          	jalr	-456(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800035cc:	00000493          	li	s1,0
    800035d0:	0280006f          	j	800035f8 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800035d4:	00000597          	auipc	a1,0x0
    800035d8:	c1458593          	addi	a1,a1,-1004 # 800031e8 <_ZL16producerKeyboardPv>
                      data + i);
    800035dc:	00179613          	slli	a2,a5,0x1
    800035e0:	00f60633          	add	a2,a2,a5
    800035e4:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800035e8:	00c98633          	add	a2,s3,a2
    800035ec:	ffffe097          	auipc	ra,0xffffe
    800035f0:	e10080e7          	jalr	-496(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800035f4:	0014849b          	addiw	s1,s1,1
    800035f8:	0524d263          	bge	s1,s2,8000363c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800035fc:	00149793          	slli	a5,s1,0x1
    80003600:	009787b3          	add	a5,a5,s1
    80003604:	00379793          	slli	a5,a5,0x3
    80003608:	00f987b3          	add	a5,s3,a5
    8000360c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003610:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003614:	00008717          	auipc	a4,0x8
    80003618:	11473703          	ld	a4,276(a4) # 8000b728 <_ZL10waitForAll>
    8000361c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003620:	00048793          	mv	a5,s1
    80003624:	00349513          	slli	a0,s1,0x3
    80003628:	00aa8533          	add	a0,s5,a0
    8000362c:	fa9054e3          	blez	s1,800035d4 <_Z22producerConsumer_C_APIv+0x1c8>
    80003630:	00000597          	auipc	a1,0x0
    80003634:	c6858593          	addi	a1,a1,-920 # 80003298 <_ZL8producerPv>
    80003638:	fa5ff06f          	j	800035dc <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    8000363c:	ffffe097          	auipc	ra,0xffffe
    80003640:	e88080e7          	jalr	-376(ra) # 800014c4 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003644:	00000493          	li	s1,0
    80003648:	00994e63          	blt	s2,s1,80003664 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    8000364c:	00008517          	auipc	a0,0x8
    80003650:	0dc53503          	ld	a0,220(a0) # 8000b728 <_ZL10waitForAll>
    80003654:	ffffe097          	auipc	ra,0xffffe
    80003658:	f28080e7          	jalr	-216(ra) # 8000157c <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    8000365c:	0014849b          	addiw	s1,s1,1
    80003660:	fe9ff06f          	j	80003648 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003664:	00008517          	auipc	a0,0x8
    80003668:	0c453503          	ld	a0,196(a0) # 8000b728 <_ZL10waitForAll>
    8000366c:	ffffe097          	auipc	ra,0xffffe
    80003670:	edc080e7          	jalr	-292(ra) # 80001548 <_Z9sem_closeP4_sem>
    delete buffer;
    80003674:	000a0e63          	beqz	s4,80003690 <_Z22producerConsumer_C_APIv+0x284>
    80003678:	000a0513          	mv	a0,s4
    8000367c:	00002097          	auipc	ra,0x2
    80003680:	750080e7          	jalr	1872(ra) # 80005dcc <_ZN6BufferD1Ev>
    80003684:	000a0513          	mv	a0,s4
    80003688:	ffffe097          	auipc	ra,0xffffe
    8000368c:	5a4080e7          	jalr	1444(ra) # 80001c2c <_ZdlPv>
    80003690:	000b0113          	mv	sp,s6

}
    80003694:	f9040113          	addi	sp,s0,-112
    80003698:	06813083          	ld	ra,104(sp)
    8000369c:	06013403          	ld	s0,96(sp)
    800036a0:	05813483          	ld	s1,88(sp)
    800036a4:	05013903          	ld	s2,80(sp)
    800036a8:	04813983          	ld	s3,72(sp)
    800036ac:	04013a03          	ld	s4,64(sp)
    800036b0:	03813a83          	ld	s5,56(sp)
    800036b4:	03013b03          	ld	s6,48(sp)
    800036b8:	07010113          	addi	sp,sp,112
    800036bc:	00008067          	ret
    800036c0:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800036c4:	000a0513          	mv	a0,s4
    800036c8:	ffffe097          	auipc	ra,0xffffe
    800036cc:	564080e7          	jalr	1380(ra) # 80001c2c <_ZdlPv>
    800036d0:	00048513          	mv	a0,s1
    800036d4:	00009097          	auipc	ra,0x9
    800036d8:	154080e7          	jalr	340(ra) # 8000c828 <_Unwind_Resume>

00000000800036dc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800036dc:	fe010113          	addi	sp,sp,-32
    800036e0:	00113c23          	sd	ra,24(sp)
    800036e4:	00813823          	sd	s0,16(sp)
    800036e8:	00913423          	sd	s1,8(sp)
    800036ec:	01213023          	sd	s2,0(sp)
    800036f0:	02010413          	addi	s0,sp,32
    800036f4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800036f8:	00100793          	li	a5,1
    800036fc:	02a7f863          	bgeu	a5,a0,8000372c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003700:	00a00793          	li	a5,10
    80003704:	02f577b3          	remu	a5,a0,a5
    80003708:	02078e63          	beqz	a5,80003744 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000370c:	fff48513          	addi	a0,s1,-1
    80003710:	00000097          	auipc	ra,0x0
    80003714:	fcc080e7          	jalr	-52(ra) # 800036dc <_ZL9fibonaccim>
    80003718:	00050913          	mv	s2,a0
    8000371c:	ffe48513          	addi	a0,s1,-2
    80003720:	00000097          	auipc	ra,0x0
    80003724:	fbc080e7          	jalr	-68(ra) # 800036dc <_ZL9fibonaccim>
    80003728:	00a90533          	add	a0,s2,a0
}
    8000372c:	01813083          	ld	ra,24(sp)
    80003730:	01013403          	ld	s0,16(sp)
    80003734:	00813483          	ld	s1,8(sp)
    80003738:	00013903          	ld	s2,0(sp)
    8000373c:	02010113          	addi	sp,sp,32
    80003740:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003744:	ffffe097          	auipc	ra,0xffffe
    80003748:	d80080e7          	jalr	-640(ra) # 800014c4 <_Z15thread_dispatchv>
    8000374c:	fc1ff06f          	j	8000370c <_ZL9fibonaccim+0x30>

0000000080003750 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003750:	fe010113          	addi	sp,sp,-32
    80003754:	00113c23          	sd	ra,24(sp)
    80003758:	00813823          	sd	s0,16(sp)
    8000375c:	00913423          	sd	s1,8(sp)
    80003760:	01213023          	sd	s2,0(sp)
    80003764:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003768:	00000913          	li	s2,0
    8000376c:	0380006f          	j	800037a4 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003770:	ffffe097          	auipc	ra,0xffffe
    80003774:	d54080e7          	jalr	-684(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003778:	00148493          	addi	s1,s1,1
    8000377c:	000027b7          	lui	a5,0x2
    80003780:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003784:	0097ee63          	bltu	a5,s1,800037a0 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003788:	00000713          	li	a4,0
    8000378c:	000077b7          	lui	a5,0x7
    80003790:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003794:	fce7eee3          	bltu	a5,a4,80003770 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003798:	00170713          	addi	a4,a4,1
    8000379c:	ff1ff06f          	j	8000378c <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800037a0:	00190913          	addi	s2,s2,1
    800037a4:	00900793          	li	a5,9
    800037a8:	0527e063          	bltu	a5,s2,800037e8 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800037ac:	00006517          	auipc	a0,0x6
    800037b0:	d7c50513          	addi	a0,a0,-644 # 80009528 <CONSOLE_STATUS+0x518>
    800037b4:	00001097          	auipc	ra,0x1
    800037b8:	728080e7          	jalr	1832(ra) # 80004edc <_Z11printStringPKc>
    800037bc:	00000613          	li	a2,0
    800037c0:	00a00593          	li	a1,10
    800037c4:	0009051b          	sext.w	a0,s2
    800037c8:	00002097          	auipc	ra,0x2
    800037cc:	8c4080e7          	jalr	-1852(ra) # 8000508c <_Z8printIntiii>
    800037d0:	00006517          	auipc	a0,0x6
    800037d4:	a4050513          	addi	a0,a0,-1472 # 80009210 <CONSOLE_STATUS+0x200>
    800037d8:	00001097          	auipc	ra,0x1
    800037dc:	704080e7          	jalr	1796(ra) # 80004edc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800037e0:	00000493          	li	s1,0
    800037e4:	f99ff06f          	j	8000377c <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    800037e8:	00006517          	auipc	a0,0x6
    800037ec:	d4850513          	addi	a0,a0,-696 # 80009530 <CONSOLE_STATUS+0x520>
    800037f0:	00001097          	auipc	ra,0x1
    800037f4:	6ec080e7          	jalr	1772(ra) # 80004edc <_Z11printStringPKc>
    finishedA = true;
    800037f8:	00100793          	li	a5,1
    800037fc:	00008717          	auipc	a4,0x8
    80003800:	f2f70a23          	sb	a5,-204(a4) # 8000b730 <_ZL9finishedA>
}
    80003804:	01813083          	ld	ra,24(sp)
    80003808:	01013403          	ld	s0,16(sp)
    8000380c:	00813483          	ld	s1,8(sp)
    80003810:	00013903          	ld	s2,0(sp)
    80003814:	02010113          	addi	sp,sp,32
    80003818:	00008067          	ret

000000008000381c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    8000381c:	fe010113          	addi	sp,sp,-32
    80003820:	00113c23          	sd	ra,24(sp)
    80003824:	00813823          	sd	s0,16(sp)
    80003828:	00913423          	sd	s1,8(sp)
    8000382c:	01213023          	sd	s2,0(sp)
    80003830:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003834:	00000913          	li	s2,0
    80003838:	0380006f          	j	80003870 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000383c:	ffffe097          	auipc	ra,0xffffe
    80003840:	c88080e7          	jalr	-888(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003844:	00148493          	addi	s1,s1,1
    80003848:	000027b7          	lui	a5,0x2
    8000384c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003850:	0097ee63          	bltu	a5,s1,8000386c <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003854:	00000713          	li	a4,0
    80003858:	000077b7          	lui	a5,0x7
    8000385c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003860:	fce7eee3          	bltu	a5,a4,8000383c <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003864:	00170713          	addi	a4,a4,1
    80003868:	ff1ff06f          	j	80003858 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000386c:	00190913          	addi	s2,s2,1
    80003870:	00f00793          	li	a5,15
    80003874:	0527e063          	bltu	a5,s2,800038b4 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003878:	00006517          	auipc	a0,0x6
    8000387c:	cc850513          	addi	a0,a0,-824 # 80009540 <CONSOLE_STATUS+0x530>
    80003880:	00001097          	auipc	ra,0x1
    80003884:	65c080e7          	jalr	1628(ra) # 80004edc <_Z11printStringPKc>
    80003888:	00000613          	li	a2,0
    8000388c:	00a00593          	li	a1,10
    80003890:	0009051b          	sext.w	a0,s2
    80003894:	00001097          	auipc	ra,0x1
    80003898:	7f8080e7          	jalr	2040(ra) # 8000508c <_Z8printIntiii>
    8000389c:	00006517          	auipc	a0,0x6
    800038a0:	97450513          	addi	a0,a0,-1676 # 80009210 <CONSOLE_STATUS+0x200>
    800038a4:	00001097          	auipc	ra,0x1
    800038a8:	638080e7          	jalr	1592(ra) # 80004edc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800038ac:	00000493          	li	s1,0
    800038b0:	f99ff06f          	j	80003848 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800038b4:	00006517          	auipc	a0,0x6
    800038b8:	c9450513          	addi	a0,a0,-876 # 80009548 <CONSOLE_STATUS+0x538>
    800038bc:	00001097          	auipc	ra,0x1
    800038c0:	620080e7          	jalr	1568(ra) # 80004edc <_Z11printStringPKc>
    finishedB = true;
    800038c4:	00100793          	li	a5,1
    800038c8:	00008717          	auipc	a4,0x8
    800038cc:	e6f704a3          	sb	a5,-407(a4) # 8000b731 <_ZL9finishedB>
    thread_dispatch();
    800038d0:	ffffe097          	auipc	ra,0xffffe
    800038d4:	bf4080e7          	jalr	-1036(ra) # 800014c4 <_Z15thread_dispatchv>
}
    800038d8:	01813083          	ld	ra,24(sp)
    800038dc:	01013403          	ld	s0,16(sp)
    800038e0:	00813483          	ld	s1,8(sp)
    800038e4:	00013903          	ld	s2,0(sp)
    800038e8:	02010113          	addi	sp,sp,32
    800038ec:	00008067          	ret

00000000800038f0 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    800038f0:	fe010113          	addi	sp,sp,-32
    800038f4:	00113c23          	sd	ra,24(sp)
    800038f8:	00813823          	sd	s0,16(sp)
    800038fc:	00913423          	sd	s1,8(sp)
    80003900:	01213023          	sd	s2,0(sp)
    80003904:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003908:	00000493          	li	s1,0
    8000390c:	0400006f          	j	8000394c <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003910:	00006517          	auipc	a0,0x6
    80003914:	c4850513          	addi	a0,a0,-952 # 80009558 <CONSOLE_STATUS+0x548>
    80003918:	00001097          	auipc	ra,0x1
    8000391c:	5c4080e7          	jalr	1476(ra) # 80004edc <_Z11printStringPKc>
    80003920:	00000613          	li	a2,0
    80003924:	00a00593          	li	a1,10
    80003928:	00048513          	mv	a0,s1
    8000392c:	00001097          	auipc	ra,0x1
    80003930:	760080e7          	jalr	1888(ra) # 8000508c <_Z8printIntiii>
    80003934:	00006517          	auipc	a0,0x6
    80003938:	8dc50513          	addi	a0,a0,-1828 # 80009210 <CONSOLE_STATUS+0x200>
    8000393c:	00001097          	auipc	ra,0x1
    80003940:	5a0080e7          	jalr	1440(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003944:	0014849b          	addiw	s1,s1,1
    80003948:	0ff4f493          	andi	s1,s1,255
    8000394c:	00200793          	li	a5,2
    80003950:	fc97f0e3          	bgeu	a5,s1,80003910 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003954:	00006517          	auipc	a0,0x6
    80003958:	c0c50513          	addi	a0,a0,-1012 # 80009560 <CONSOLE_STATUS+0x550>
    8000395c:	00001097          	auipc	ra,0x1
    80003960:	580080e7          	jalr	1408(ra) # 80004edc <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003964:	00700313          	li	t1,7
    thread_dispatch();
    80003968:	ffffe097          	auipc	ra,0xffffe
    8000396c:	b5c080e7          	jalr	-1188(ra) # 800014c4 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003970:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003974:	00006517          	auipc	a0,0x6
    80003978:	bfc50513          	addi	a0,a0,-1028 # 80009570 <CONSOLE_STATUS+0x560>
    8000397c:	00001097          	auipc	ra,0x1
    80003980:	560080e7          	jalr	1376(ra) # 80004edc <_Z11printStringPKc>
    80003984:	00000613          	li	a2,0
    80003988:	00a00593          	li	a1,10
    8000398c:	0009051b          	sext.w	a0,s2
    80003990:	00001097          	auipc	ra,0x1
    80003994:	6fc080e7          	jalr	1788(ra) # 8000508c <_Z8printIntiii>
    80003998:	00006517          	auipc	a0,0x6
    8000399c:	87850513          	addi	a0,a0,-1928 # 80009210 <CONSOLE_STATUS+0x200>
    800039a0:	00001097          	auipc	ra,0x1
    800039a4:	53c080e7          	jalr	1340(ra) # 80004edc <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800039a8:	00c00513          	li	a0,12
    800039ac:	00000097          	auipc	ra,0x0
    800039b0:	d30080e7          	jalr	-720(ra) # 800036dc <_ZL9fibonaccim>
    800039b4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800039b8:	00006517          	auipc	a0,0x6
    800039bc:	bc050513          	addi	a0,a0,-1088 # 80009578 <CONSOLE_STATUS+0x568>
    800039c0:	00001097          	auipc	ra,0x1
    800039c4:	51c080e7          	jalr	1308(ra) # 80004edc <_Z11printStringPKc>
    800039c8:	00000613          	li	a2,0
    800039cc:	00a00593          	li	a1,10
    800039d0:	0009051b          	sext.w	a0,s2
    800039d4:	00001097          	auipc	ra,0x1
    800039d8:	6b8080e7          	jalr	1720(ra) # 8000508c <_Z8printIntiii>
    800039dc:	00006517          	auipc	a0,0x6
    800039e0:	83450513          	addi	a0,a0,-1996 # 80009210 <CONSOLE_STATUS+0x200>
    800039e4:	00001097          	auipc	ra,0x1
    800039e8:	4f8080e7          	jalr	1272(ra) # 80004edc <_Z11printStringPKc>
    800039ec:	0400006f          	j	80003a2c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800039f0:	00006517          	auipc	a0,0x6
    800039f4:	b6850513          	addi	a0,a0,-1176 # 80009558 <CONSOLE_STATUS+0x548>
    800039f8:	00001097          	auipc	ra,0x1
    800039fc:	4e4080e7          	jalr	1252(ra) # 80004edc <_Z11printStringPKc>
    80003a00:	00000613          	li	a2,0
    80003a04:	00a00593          	li	a1,10
    80003a08:	00048513          	mv	a0,s1
    80003a0c:	00001097          	auipc	ra,0x1
    80003a10:	680080e7          	jalr	1664(ra) # 8000508c <_Z8printIntiii>
    80003a14:	00005517          	auipc	a0,0x5
    80003a18:	7fc50513          	addi	a0,a0,2044 # 80009210 <CONSOLE_STATUS+0x200>
    80003a1c:	00001097          	auipc	ra,0x1
    80003a20:	4c0080e7          	jalr	1216(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003a24:	0014849b          	addiw	s1,s1,1
    80003a28:	0ff4f493          	andi	s1,s1,255
    80003a2c:	00500793          	li	a5,5
    80003a30:	fc97f0e3          	bgeu	a5,s1,800039f0 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003a34:	00006517          	auipc	a0,0x6
    80003a38:	afc50513          	addi	a0,a0,-1284 # 80009530 <CONSOLE_STATUS+0x520>
    80003a3c:	00001097          	auipc	ra,0x1
    80003a40:	4a0080e7          	jalr	1184(ra) # 80004edc <_Z11printStringPKc>
    finishedC = true;
    80003a44:	00100793          	li	a5,1
    80003a48:	00008717          	auipc	a4,0x8
    80003a4c:	cef70523          	sb	a5,-790(a4) # 8000b732 <_ZL9finishedC>
    thread_dispatch();
    80003a50:	ffffe097          	auipc	ra,0xffffe
    80003a54:	a74080e7          	jalr	-1420(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80003a58:	01813083          	ld	ra,24(sp)
    80003a5c:	01013403          	ld	s0,16(sp)
    80003a60:	00813483          	ld	s1,8(sp)
    80003a64:	00013903          	ld	s2,0(sp)
    80003a68:	02010113          	addi	sp,sp,32
    80003a6c:	00008067          	ret

0000000080003a70 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003a70:	fe010113          	addi	sp,sp,-32
    80003a74:	00113c23          	sd	ra,24(sp)
    80003a78:	00813823          	sd	s0,16(sp)
    80003a7c:	00913423          	sd	s1,8(sp)
    80003a80:	01213023          	sd	s2,0(sp)
    80003a84:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003a88:	00a00493          	li	s1,10
    80003a8c:	0400006f          	j	80003acc <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003a90:	00006517          	auipc	a0,0x6
    80003a94:	af850513          	addi	a0,a0,-1288 # 80009588 <CONSOLE_STATUS+0x578>
    80003a98:	00001097          	auipc	ra,0x1
    80003a9c:	444080e7          	jalr	1092(ra) # 80004edc <_Z11printStringPKc>
    80003aa0:	00000613          	li	a2,0
    80003aa4:	00a00593          	li	a1,10
    80003aa8:	00048513          	mv	a0,s1
    80003aac:	00001097          	auipc	ra,0x1
    80003ab0:	5e0080e7          	jalr	1504(ra) # 8000508c <_Z8printIntiii>
    80003ab4:	00005517          	auipc	a0,0x5
    80003ab8:	75c50513          	addi	a0,a0,1884 # 80009210 <CONSOLE_STATUS+0x200>
    80003abc:	00001097          	auipc	ra,0x1
    80003ac0:	420080e7          	jalr	1056(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003ac4:	0014849b          	addiw	s1,s1,1
    80003ac8:	0ff4f493          	andi	s1,s1,255
    80003acc:	00c00793          	li	a5,12
    80003ad0:	fc97f0e3          	bgeu	a5,s1,80003a90 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003ad4:	00006517          	auipc	a0,0x6
    80003ad8:	abc50513          	addi	a0,a0,-1348 # 80009590 <CONSOLE_STATUS+0x580>
    80003adc:	00001097          	auipc	ra,0x1
    80003ae0:	400080e7          	jalr	1024(ra) # 80004edc <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003ae4:	00500313          	li	t1,5
    thread_dispatch();
    80003ae8:	ffffe097          	auipc	ra,0xffffe
    80003aec:	9dc080e7          	jalr	-1572(ra) # 800014c4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003af0:	01000513          	li	a0,16
    80003af4:	00000097          	auipc	ra,0x0
    80003af8:	be8080e7          	jalr	-1048(ra) # 800036dc <_ZL9fibonaccim>
    80003afc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003b00:	00006517          	auipc	a0,0x6
    80003b04:	aa050513          	addi	a0,a0,-1376 # 800095a0 <CONSOLE_STATUS+0x590>
    80003b08:	00001097          	auipc	ra,0x1
    80003b0c:	3d4080e7          	jalr	980(ra) # 80004edc <_Z11printStringPKc>
    80003b10:	00000613          	li	a2,0
    80003b14:	00a00593          	li	a1,10
    80003b18:	0009051b          	sext.w	a0,s2
    80003b1c:	00001097          	auipc	ra,0x1
    80003b20:	570080e7          	jalr	1392(ra) # 8000508c <_Z8printIntiii>
    80003b24:	00005517          	auipc	a0,0x5
    80003b28:	6ec50513          	addi	a0,a0,1772 # 80009210 <CONSOLE_STATUS+0x200>
    80003b2c:	00001097          	auipc	ra,0x1
    80003b30:	3b0080e7          	jalr	944(ra) # 80004edc <_Z11printStringPKc>
    80003b34:	0400006f          	j	80003b74 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003b38:	00006517          	auipc	a0,0x6
    80003b3c:	a5050513          	addi	a0,a0,-1456 # 80009588 <CONSOLE_STATUS+0x578>
    80003b40:	00001097          	auipc	ra,0x1
    80003b44:	39c080e7          	jalr	924(ra) # 80004edc <_Z11printStringPKc>
    80003b48:	00000613          	li	a2,0
    80003b4c:	00a00593          	li	a1,10
    80003b50:	00048513          	mv	a0,s1
    80003b54:	00001097          	auipc	ra,0x1
    80003b58:	538080e7          	jalr	1336(ra) # 8000508c <_Z8printIntiii>
    80003b5c:	00005517          	auipc	a0,0x5
    80003b60:	6b450513          	addi	a0,a0,1716 # 80009210 <CONSOLE_STATUS+0x200>
    80003b64:	00001097          	auipc	ra,0x1
    80003b68:	378080e7          	jalr	888(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003b6c:	0014849b          	addiw	s1,s1,1
    80003b70:	0ff4f493          	andi	s1,s1,255
    80003b74:	00f00793          	li	a5,15
    80003b78:	fc97f0e3          	bgeu	a5,s1,80003b38 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003b7c:	00006517          	auipc	a0,0x6
    80003b80:	a3450513          	addi	a0,a0,-1484 # 800095b0 <CONSOLE_STATUS+0x5a0>
    80003b84:	00001097          	auipc	ra,0x1
    80003b88:	358080e7          	jalr	856(ra) # 80004edc <_Z11printStringPKc>
    finishedD = true;
    80003b8c:	00100793          	li	a5,1
    80003b90:	00008717          	auipc	a4,0x8
    80003b94:	baf701a3          	sb	a5,-1117(a4) # 8000b733 <_ZL9finishedD>
    thread_dispatch();
    80003b98:	ffffe097          	auipc	ra,0xffffe
    80003b9c:	92c080e7          	jalr	-1748(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80003ba0:	01813083          	ld	ra,24(sp)
    80003ba4:	01013403          	ld	s0,16(sp)
    80003ba8:	00813483          	ld	s1,8(sp)
    80003bac:	00013903          	ld	s2,0(sp)
    80003bb0:	02010113          	addi	sp,sp,32
    80003bb4:	00008067          	ret

0000000080003bb8 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003bb8:	fc010113          	addi	sp,sp,-64
    80003bbc:	02113c23          	sd	ra,56(sp)
    80003bc0:	02813823          	sd	s0,48(sp)
    80003bc4:	02913423          	sd	s1,40(sp)
    80003bc8:	03213023          	sd	s2,32(sp)
    80003bcc:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003bd0:	02000513          	li	a0,32
    80003bd4:	ffffe097          	auipc	ra,0xffffe
    80003bd8:	030080e7          	jalr	48(ra) # 80001c04 <_Znwm>
    80003bdc:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003be0:	ffffe097          	auipc	ra,0xffffe
    80003be4:	148080e7          	jalr	328(ra) # 80001d28 <_ZN6ThreadC1Ev>
    80003be8:	00008797          	auipc	a5,0x8
    80003bec:	94878793          	addi	a5,a5,-1720 # 8000b530 <_ZTV7WorkerA+0x10>
    80003bf0:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003bf4:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003bf8:	00006517          	auipc	a0,0x6
    80003bfc:	9c850513          	addi	a0,a0,-1592 # 800095c0 <CONSOLE_STATUS+0x5b0>
    80003c00:	00001097          	auipc	ra,0x1
    80003c04:	2dc080e7          	jalr	732(ra) # 80004edc <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003c08:	02000513          	li	a0,32
    80003c0c:	ffffe097          	auipc	ra,0xffffe
    80003c10:	ff8080e7          	jalr	-8(ra) # 80001c04 <_Znwm>
    80003c14:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003c18:	ffffe097          	auipc	ra,0xffffe
    80003c1c:	110080e7          	jalr	272(ra) # 80001d28 <_ZN6ThreadC1Ev>
    80003c20:	00008797          	auipc	a5,0x8
    80003c24:	93878793          	addi	a5,a5,-1736 # 8000b558 <_ZTV7WorkerB+0x10>
    80003c28:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003c2c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003c30:	00006517          	auipc	a0,0x6
    80003c34:	9a850513          	addi	a0,a0,-1624 # 800095d8 <CONSOLE_STATUS+0x5c8>
    80003c38:	00001097          	auipc	ra,0x1
    80003c3c:	2a4080e7          	jalr	676(ra) # 80004edc <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003c40:	02000513          	li	a0,32
    80003c44:	ffffe097          	auipc	ra,0xffffe
    80003c48:	fc0080e7          	jalr	-64(ra) # 80001c04 <_Znwm>
    80003c4c:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003c50:	ffffe097          	auipc	ra,0xffffe
    80003c54:	0d8080e7          	jalr	216(ra) # 80001d28 <_ZN6ThreadC1Ev>
    80003c58:	00008797          	auipc	a5,0x8
    80003c5c:	92878793          	addi	a5,a5,-1752 # 8000b580 <_ZTV7WorkerC+0x10>
    80003c60:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003c64:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003c68:	00006517          	auipc	a0,0x6
    80003c6c:	98850513          	addi	a0,a0,-1656 # 800095f0 <CONSOLE_STATUS+0x5e0>
    80003c70:	00001097          	auipc	ra,0x1
    80003c74:	26c080e7          	jalr	620(ra) # 80004edc <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003c78:	02000513          	li	a0,32
    80003c7c:	ffffe097          	auipc	ra,0xffffe
    80003c80:	f88080e7          	jalr	-120(ra) # 80001c04 <_Znwm>
    80003c84:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003c88:	ffffe097          	auipc	ra,0xffffe
    80003c8c:	0a0080e7          	jalr	160(ra) # 80001d28 <_ZN6ThreadC1Ev>
    80003c90:	00008797          	auipc	a5,0x8
    80003c94:	91878793          	addi	a5,a5,-1768 # 8000b5a8 <_ZTV7WorkerD+0x10>
    80003c98:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003c9c:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003ca0:	00006517          	auipc	a0,0x6
    80003ca4:	96850513          	addi	a0,a0,-1688 # 80009608 <CONSOLE_STATUS+0x5f8>
    80003ca8:	00001097          	auipc	ra,0x1
    80003cac:	234080e7          	jalr	564(ra) # 80004edc <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003cb0:	00000493          	li	s1,0
    80003cb4:	00300793          	li	a5,3
    80003cb8:	0297c663          	blt	a5,s1,80003ce4 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003cbc:	00349793          	slli	a5,s1,0x3
    80003cc0:	fe040713          	addi	a4,s0,-32
    80003cc4:	00f707b3          	add	a5,a4,a5
    80003cc8:	fe07b503          	ld	a0,-32(a5)
    80003ccc:	ffffe097          	auipc	ra,0xffffe
    80003cd0:	0ac080e7          	jalr	172(ra) # 80001d78 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003cd4:	0014849b          	addiw	s1,s1,1
    80003cd8:	fddff06f          	j	80003cb4 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003cdc:	ffffe097          	auipc	ra,0xffffe
    80003ce0:	118080e7          	jalr	280(ra) # 80001df4 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003ce4:	00008797          	auipc	a5,0x8
    80003ce8:	a4c7c783          	lbu	a5,-1460(a5) # 8000b730 <_ZL9finishedA>
    80003cec:	fe0788e3          	beqz	a5,80003cdc <_Z20Threads_CPP_API_testv+0x124>
    80003cf0:	00008797          	auipc	a5,0x8
    80003cf4:	a417c783          	lbu	a5,-1471(a5) # 8000b731 <_ZL9finishedB>
    80003cf8:	fe0782e3          	beqz	a5,80003cdc <_Z20Threads_CPP_API_testv+0x124>
    80003cfc:	00008797          	auipc	a5,0x8
    80003d00:	a367c783          	lbu	a5,-1482(a5) # 8000b732 <_ZL9finishedC>
    80003d04:	fc078ce3          	beqz	a5,80003cdc <_Z20Threads_CPP_API_testv+0x124>
    80003d08:	00008797          	auipc	a5,0x8
    80003d0c:	a2b7c783          	lbu	a5,-1493(a5) # 8000b733 <_ZL9finishedD>
    80003d10:	fc0786e3          	beqz	a5,80003cdc <_Z20Threads_CPP_API_testv+0x124>
    80003d14:	fc040493          	addi	s1,s0,-64
    80003d18:	0080006f          	j	80003d20 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003d1c:	00848493          	addi	s1,s1,8
    80003d20:	fe040793          	addi	a5,s0,-32
    80003d24:	08f48663          	beq	s1,a5,80003db0 <_Z20Threads_CPP_API_testv+0x1f8>
    80003d28:	0004b503          	ld	a0,0(s1)
    80003d2c:	fe0508e3          	beqz	a0,80003d1c <_Z20Threads_CPP_API_testv+0x164>
    80003d30:	00053783          	ld	a5,0(a0)
    80003d34:	0087b783          	ld	a5,8(a5)
    80003d38:	000780e7          	jalr	a5
    80003d3c:	fe1ff06f          	j	80003d1c <_Z20Threads_CPP_API_testv+0x164>
    80003d40:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003d44:	00048513          	mv	a0,s1
    80003d48:	ffffe097          	auipc	ra,0xffffe
    80003d4c:	ee4080e7          	jalr	-284(ra) # 80001c2c <_ZdlPv>
    80003d50:	00090513          	mv	a0,s2
    80003d54:	00009097          	auipc	ra,0x9
    80003d58:	ad4080e7          	jalr	-1324(ra) # 8000c828 <_Unwind_Resume>
    80003d5c:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003d60:	00048513          	mv	a0,s1
    80003d64:	ffffe097          	auipc	ra,0xffffe
    80003d68:	ec8080e7          	jalr	-312(ra) # 80001c2c <_ZdlPv>
    80003d6c:	00090513          	mv	a0,s2
    80003d70:	00009097          	auipc	ra,0x9
    80003d74:	ab8080e7          	jalr	-1352(ra) # 8000c828 <_Unwind_Resume>
    80003d78:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003d7c:	00048513          	mv	a0,s1
    80003d80:	ffffe097          	auipc	ra,0xffffe
    80003d84:	eac080e7          	jalr	-340(ra) # 80001c2c <_ZdlPv>
    80003d88:	00090513          	mv	a0,s2
    80003d8c:	00009097          	auipc	ra,0x9
    80003d90:	a9c080e7          	jalr	-1380(ra) # 8000c828 <_Unwind_Resume>
    80003d94:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003d98:	00048513          	mv	a0,s1
    80003d9c:	ffffe097          	auipc	ra,0xffffe
    80003da0:	e90080e7          	jalr	-368(ra) # 80001c2c <_ZdlPv>
    80003da4:	00090513          	mv	a0,s2
    80003da8:	00009097          	auipc	ra,0x9
    80003dac:	a80080e7          	jalr	-1408(ra) # 8000c828 <_Unwind_Resume>
}
    80003db0:	03813083          	ld	ra,56(sp)
    80003db4:	03013403          	ld	s0,48(sp)
    80003db8:	02813483          	ld	s1,40(sp)
    80003dbc:	02013903          	ld	s2,32(sp)
    80003dc0:	04010113          	addi	sp,sp,64
    80003dc4:	00008067          	ret

0000000080003dc8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003dc8:	ff010113          	addi	sp,sp,-16
    80003dcc:	00113423          	sd	ra,8(sp)
    80003dd0:	00813023          	sd	s0,0(sp)
    80003dd4:	01010413          	addi	s0,sp,16
    80003dd8:	00007797          	auipc	a5,0x7
    80003ddc:	75878793          	addi	a5,a5,1880 # 8000b530 <_ZTV7WorkerA+0x10>
    80003de0:	00f53023          	sd	a5,0(a0)
    80003de4:	ffffe097          	auipc	ra,0xffffe
    80003de8:	188080e7          	jalr	392(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80003dec:	00813083          	ld	ra,8(sp)
    80003df0:	00013403          	ld	s0,0(sp)
    80003df4:	01010113          	addi	sp,sp,16
    80003df8:	00008067          	ret

0000000080003dfc <_ZN7WorkerAD0Ev>:
    80003dfc:	fe010113          	addi	sp,sp,-32
    80003e00:	00113c23          	sd	ra,24(sp)
    80003e04:	00813823          	sd	s0,16(sp)
    80003e08:	00913423          	sd	s1,8(sp)
    80003e0c:	02010413          	addi	s0,sp,32
    80003e10:	00050493          	mv	s1,a0
    80003e14:	00007797          	auipc	a5,0x7
    80003e18:	71c78793          	addi	a5,a5,1820 # 8000b530 <_ZTV7WorkerA+0x10>
    80003e1c:	00f53023          	sd	a5,0(a0)
    80003e20:	ffffe097          	auipc	ra,0xffffe
    80003e24:	14c080e7          	jalr	332(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80003e28:	00048513          	mv	a0,s1
    80003e2c:	ffffe097          	auipc	ra,0xffffe
    80003e30:	e00080e7          	jalr	-512(ra) # 80001c2c <_ZdlPv>
    80003e34:	01813083          	ld	ra,24(sp)
    80003e38:	01013403          	ld	s0,16(sp)
    80003e3c:	00813483          	ld	s1,8(sp)
    80003e40:	02010113          	addi	sp,sp,32
    80003e44:	00008067          	ret

0000000080003e48 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003e48:	ff010113          	addi	sp,sp,-16
    80003e4c:	00113423          	sd	ra,8(sp)
    80003e50:	00813023          	sd	s0,0(sp)
    80003e54:	01010413          	addi	s0,sp,16
    80003e58:	00007797          	auipc	a5,0x7
    80003e5c:	70078793          	addi	a5,a5,1792 # 8000b558 <_ZTV7WorkerB+0x10>
    80003e60:	00f53023          	sd	a5,0(a0)
    80003e64:	ffffe097          	auipc	ra,0xffffe
    80003e68:	108080e7          	jalr	264(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80003e6c:	00813083          	ld	ra,8(sp)
    80003e70:	00013403          	ld	s0,0(sp)
    80003e74:	01010113          	addi	sp,sp,16
    80003e78:	00008067          	ret

0000000080003e7c <_ZN7WorkerBD0Ev>:
    80003e7c:	fe010113          	addi	sp,sp,-32
    80003e80:	00113c23          	sd	ra,24(sp)
    80003e84:	00813823          	sd	s0,16(sp)
    80003e88:	00913423          	sd	s1,8(sp)
    80003e8c:	02010413          	addi	s0,sp,32
    80003e90:	00050493          	mv	s1,a0
    80003e94:	00007797          	auipc	a5,0x7
    80003e98:	6c478793          	addi	a5,a5,1732 # 8000b558 <_ZTV7WorkerB+0x10>
    80003e9c:	00f53023          	sd	a5,0(a0)
    80003ea0:	ffffe097          	auipc	ra,0xffffe
    80003ea4:	0cc080e7          	jalr	204(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80003ea8:	00048513          	mv	a0,s1
    80003eac:	ffffe097          	auipc	ra,0xffffe
    80003eb0:	d80080e7          	jalr	-640(ra) # 80001c2c <_ZdlPv>
    80003eb4:	01813083          	ld	ra,24(sp)
    80003eb8:	01013403          	ld	s0,16(sp)
    80003ebc:	00813483          	ld	s1,8(sp)
    80003ec0:	02010113          	addi	sp,sp,32
    80003ec4:	00008067          	ret

0000000080003ec8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80003ec8:	ff010113          	addi	sp,sp,-16
    80003ecc:	00113423          	sd	ra,8(sp)
    80003ed0:	00813023          	sd	s0,0(sp)
    80003ed4:	01010413          	addi	s0,sp,16
    80003ed8:	00007797          	auipc	a5,0x7
    80003edc:	6a878793          	addi	a5,a5,1704 # 8000b580 <_ZTV7WorkerC+0x10>
    80003ee0:	00f53023          	sd	a5,0(a0)
    80003ee4:	ffffe097          	auipc	ra,0xffffe
    80003ee8:	088080e7          	jalr	136(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80003eec:	00813083          	ld	ra,8(sp)
    80003ef0:	00013403          	ld	s0,0(sp)
    80003ef4:	01010113          	addi	sp,sp,16
    80003ef8:	00008067          	ret

0000000080003efc <_ZN7WorkerCD0Ev>:
    80003efc:	fe010113          	addi	sp,sp,-32
    80003f00:	00113c23          	sd	ra,24(sp)
    80003f04:	00813823          	sd	s0,16(sp)
    80003f08:	00913423          	sd	s1,8(sp)
    80003f0c:	02010413          	addi	s0,sp,32
    80003f10:	00050493          	mv	s1,a0
    80003f14:	00007797          	auipc	a5,0x7
    80003f18:	66c78793          	addi	a5,a5,1644 # 8000b580 <_ZTV7WorkerC+0x10>
    80003f1c:	00f53023          	sd	a5,0(a0)
    80003f20:	ffffe097          	auipc	ra,0xffffe
    80003f24:	04c080e7          	jalr	76(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80003f28:	00048513          	mv	a0,s1
    80003f2c:	ffffe097          	auipc	ra,0xffffe
    80003f30:	d00080e7          	jalr	-768(ra) # 80001c2c <_ZdlPv>
    80003f34:	01813083          	ld	ra,24(sp)
    80003f38:	01013403          	ld	s0,16(sp)
    80003f3c:	00813483          	ld	s1,8(sp)
    80003f40:	02010113          	addi	sp,sp,32
    80003f44:	00008067          	ret

0000000080003f48 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003f48:	ff010113          	addi	sp,sp,-16
    80003f4c:	00113423          	sd	ra,8(sp)
    80003f50:	00813023          	sd	s0,0(sp)
    80003f54:	01010413          	addi	s0,sp,16
    80003f58:	00007797          	auipc	a5,0x7
    80003f5c:	65078793          	addi	a5,a5,1616 # 8000b5a8 <_ZTV7WorkerD+0x10>
    80003f60:	00f53023          	sd	a5,0(a0)
    80003f64:	ffffe097          	auipc	ra,0xffffe
    80003f68:	008080e7          	jalr	8(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80003f6c:	00813083          	ld	ra,8(sp)
    80003f70:	00013403          	ld	s0,0(sp)
    80003f74:	01010113          	addi	sp,sp,16
    80003f78:	00008067          	ret

0000000080003f7c <_ZN7WorkerDD0Ev>:
    80003f7c:	fe010113          	addi	sp,sp,-32
    80003f80:	00113c23          	sd	ra,24(sp)
    80003f84:	00813823          	sd	s0,16(sp)
    80003f88:	00913423          	sd	s1,8(sp)
    80003f8c:	02010413          	addi	s0,sp,32
    80003f90:	00050493          	mv	s1,a0
    80003f94:	00007797          	auipc	a5,0x7
    80003f98:	61478793          	addi	a5,a5,1556 # 8000b5a8 <_ZTV7WorkerD+0x10>
    80003f9c:	00f53023          	sd	a5,0(a0)
    80003fa0:	ffffe097          	auipc	ra,0xffffe
    80003fa4:	fcc080e7          	jalr	-52(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80003fa8:	00048513          	mv	a0,s1
    80003fac:	ffffe097          	auipc	ra,0xffffe
    80003fb0:	c80080e7          	jalr	-896(ra) # 80001c2c <_ZdlPv>
    80003fb4:	01813083          	ld	ra,24(sp)
    80003fb8:	01013403          	ld	s0,16(sp)
    80003fbc:	00813483          	ld	s1,8(sp)
    80003fc0:	02010113          	addi	sp,sp,32
    80003fc4:	00008067          	ret

0000000080003fc8 <_ZN7WorkerA3runEv>:
    void run() override {
    80003fc8:	ff010113          	addi	sp,sp,-16
    80003fcc:	00113423          	sd	ra,8(sp)
    80003fd0:	00813023          	sd	s0,0(sp)
    80003fd4:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003fd8:	00000593          	li	a1,0
    80003fdc:	fffff097          	auipc	ra,0xfffff
    80003fe0:	774080e7          	jalr	1908(ra) # 80003750 <_ZN7WorkerA11workerBodyAEPv>
    }
    80003fe4:	00813083          	ld	ra,8(sp)
    80003fe8:	00013403          	ld	s0,0(sp)
    80003fec:	01010113          	addi	sp,sp,16
    80003ff0:	00008067          	ret

0000000080003ff4 <_ZN7WorkerB3runEv>:
    void run() override {
    80003ff4:	ff010113          	addi	sp,sp,-16
    80003ff8:	00113423          	sd	ra,8(sp)
    80003ffc:	00813023          	sd	s0,0(sp)
    80004000:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004004:	00000593          	li	a1,0
    80004008:	00000097          	auipc	ra,0x0
    8000400c:	814080e7          	jalr	-2028(ra) # 8000381c <_ZN7WorkerB11workerBodyBEPv>
    }
    80004010:	00813083          	ld	ra,8(sp)
    80004014:	00013403          	ld	s0,0(sp)
    80004018:	01010113          	addi	sp,sp,16
    8000401c:	00008067          	ret

0000000080004020 <_ZN7WorkerC3runEv>:
    void run() override {
    80004020:	ff010113          	addi	sp,sp,-16
    80004024:	00113423          	sd	ra,8(sp)
    80004028:	00813023          	sd	s0,0(sp)
    8000402c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004030:	00000593          	li	a1,0
    80004034:	00000097          	auipc	ra,0x0
    80004038:	8bc080e7          	jalr	-1860(ra) # 800038f0 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000403c:	00813083          	ld	ra,8(sp)
    80004040:	00013403          	ld	s0,0(sp)
    80004044:	01010113          	addi	sp,sp,16
    80004048:	00008067          	ret

000000008000404c <_ZN7WorkerD3runEv>:
    void run() override {
    8000404c:	ff010113          	addi	sp,sp,-16
    80004050:	00113423          	sd	ra,8(sp)
    80004054:	00813023          	sd	s0,0(sp)
    80004058:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    8000405c:	00000593          	li	a1,0
    80004060:	00000097          	auipc	ra,0x0
    80004064:	a10080e7          	jalr	-1520(ra) # 80003a70 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004068:	00813083          	ld	ra,8(sp)
    8000406c:	00013403          	ld	s0,0(sp)
    80004070:	01010113          	addi	sp,sp,16
    80004074:	00008067          	ret

0000000080004078 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004078:	fe010113          	addi	sp,sp,-32
    8000407c:	00113c23          	sd	ra,24(sp)
    80004080:	00813823          	sd	s0,16(sp)
    80004084:	00913423          	sd	s1,8(sp)
    80004088:	01213023          	sd	s2,0(sp)
    8000408c:	02010413          	addi	s0,sp,32
    80004090:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004094:	00100793          	li	a5,1
    80004098:	02a7f863          	bgeu	a5,a0,800040c8 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000409c:	00a00793          	li	a5,10
    800040a0:	02f577b3          	remu	a5,a0,a5
    800040a4:	02078e63          	beqz	a5,800040e0 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800040a8:	fff48513          	addi	a0,s1,-1
    800040ac:	00000097          	auipc	ra,0x0
    800040b0:	fcc080e7          	jalr	-52(ra) # 80004078 <_ZL9fibonaccim>
    800040b4:	00050913          	mv	s2,a0
    800040b8:	ffe48513          	addi	a0,s1,-2
    800040bc:	00000097          	auipc	ra,0x0
    800040c0:	fbc080e7          	jalr	-68(ra) # 80004078 <_ZL9fibonaccim>
    800040c4:	00a90533          	add	a0,s2,a0
}
    800040c8:	01813083          	ld	ra,24(sp)
    800040cc:	01013403          	ld	s0,16(sp)
    800040d0:	00813483          	ld	s1,8(sp)
    800040d4:	00013903          	ld	s2,0(sp)
    800040d8:	02010113          	addi	sp,sp,32
    800040dc:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800040e0:	ffffd097          	auipc	ra,0xffffd
    800040e4:	3e4080e7          	jalr	996(ra) # 800014c4 <_Z15thread_dispatchv>
    800040e8:	fc1ff06f          	j	800040a8 <_ZL9fibonaccim+0x30>

00000000800040ec <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800040ec:	fe010113          	addi	sp,sp,-32
    800040f0:	00113c23          	sd	ra,24(sp)
    800040f4:	00813823          	sd	s0,16(sp)
    800040f8:	00913423          	sd	s1,8(sp)
    800040fc:	01213023          	sd	s2,0(sp)
    80004100:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004104:	00a00493          	li	s1,10
    80004108:	0400006f          	j	80004148 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000410c:	00005517          	auipc	a0,0x5
    80004110:	47c50513          	addi	a0,a0,1148 # 80009588 <CONSOLE_STATUS+0x578>
    80004114:	00001097          	auipc	ra,0x1
    80004118:	dc8080e7          	jalr	-568(ra) # 80004edc <_Z11printStringPKc>
    8000411c:	00000613          	li	a2,0
    80004120:	00a00593          	li	a1,10
    80004124:	00048513          	mv	a0,s1
    80004128:	00001097          	auipc	ra,0x1
    8000412c:	f64080e7          	jalr	-156(ra) # 8000508c <_Z8printIntiii>
    80004130:	00005517          	auipc	a0,0x5
    80004134:	0e050513          	addi	a0,a0,224 # 80009210 <CONSOLE_STATUS+0x200>
    80004138:	00001097          	auipc	ra,0x1
    8000413c:	da4080e7          	jalr	-604(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004140:	0014849b          	addiw	s1,s1,1
    80004144:	0ff4f493          	andi	s1,s1,255
    80004148:	00c00793          	li	a5,12
    8000414c:	fc97f0e3          	bgeu	a5,s1,8000410c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004150:	00005517          	auipc	a0,0x5
    80004154:	44050513          	addi	a0,a0,1088 # 80009590 <CONSOLE_STATUS+0x580>
    80004158:	00001097          	auipc	ra,0x1
    8000415c:	d84080e7          	jalr	-636(ra) # 80004edc <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004160:	00500313          	li	t1,5
    thread_dispatch();
    80004164:	ffffd097          	auipc	ra,0xffffd
    80004168:	360080e7          	jalr	864(ra) # 800014c4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000416c:	01000513          	li	a0,16
    80004170:	00000097          	auipc	ra,0x0
    80004174:	f08080e7          	jalr	-248(ra) # 80004078 <_ZL9fibonaccim>
    80004178:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000417c:	00005517          	auipc	a0,0x5
    80004180:	42450513          	addi	a0,a0,1060 # 800095a0 <CONSOLE_STATUS+0x590>
    80004184:	00001097          	auipc	ra,0x1
    80004188:	d58080e7          	jalr	-680(ra) # 80004edc <_Z11printStringPKc>
    8000418c:	00000613          	li	a2,0
    80004190:	00a00593          	li	a1,10
    80004194:	0009051b          	sext.w	a0,s2
    80004198:	00001097          	auipc	ra,0x1
    8000419c:	ef4080e7          	jalr	-268(ra) # 8000508c <_Z8printIntiii>
    800041a0:	00005517          	auipc	a0,0x5
    800041a4:	07050513          	addi	a0,a0,112 # 80009210 <CONSOLE_STATUS+0x200>
    800041a8:	00001097          	auipc	ra,0x1
    800041ac:	d34080e7          	jalr	-716(ra) # 80004edc <_Z11printStringPKc>
    800041b0:	0400006f          	j	800041f0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800041b4:	00005517          	auipc	a0,0x5
    800041b8:	3d450513          	addi	a0,a0,980 # 80009588 <CONSOLE_STATUS+0x578>
    800041bc:	00001097          	auipc	ra,0x1
    800041c0:	d20080e7          	jalr	-736(ra) # 80004edc <_Z11printStringPKc>
    800041c4:	00000613          	li	a2,0
    800041c8:	00a00593          	li	a1,10
    800041cc:	00048513          	mv	a0,s1
    800041d0:	00001097          	auipc	ra,0x1
    800041d4:	ebc080e7          	jalr	-324(ra) # 8000508c <_Z8printIntiii>
    800041d8:	00005517          	auipc	a0,0x5
    800041dc:	03850513          	addi	a0,a0,56 # 80009210 <CONSOLE_STATUS+0x200>
    800041e0:	00001097          	auipc	ra,0x1
    800041e4:	cfc080e7          	jalr	-772(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 16; i++) {
    800041e8:	0014849b          	addiw	s1,s1,1
    800041ec:	0ff4f493          	andi	s1,s1,255
    800041f0:	00f00793          	li	a5,15
    800041f4:	fc97f0e3          	bgeu	a5,s1,800041b4 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800041f8:	00005517          	auipc	a0,0x5
    800041fc:	3b850513          	addi	a0,a0,952 # 800095b0 <CONSOLE_STATUS+0x5a0>
    80004200:	00001097          	auipc	ra,0x1
    80004204:	cdc080e7          	jalr	-804(ra) # 80004edc <_Z11printStringPKc>
    finishedD = true;
    80004208:	00100793          	li	a5,1
    8000420c:	00007717          	auipc	a4,0x7
    80004210:	52f70423          	sb	a5,1320(a4) # 8000b734 <_ZL9finishedD>
    thread_dispatch();
    80004214:	ffffd097          	auipc	ra,0xffffd
    80004218:	2b0080e7          	jalr	688(ra) # 800014c4 <_Z15thread_dispatchv>
}
    8000421c:	01813083          	ld	ra,24(sp)
    80004220:	01013403          	ld	s0,16(sp)
    80004224:	00813483          	ld	s1,8(sp)
    80004228:	00013903          	ld	s2,0(sp)
    8000422c:	02010113          	addi	sp,sp,32
    80004230:	00008067          	ret

0000000080004234 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004234:	fe010113          	addi	sp,sp,-32
    80004238:	00113c23          	sd	ra,24(sp)
    8000423c:	00813823          	sd	s0,16(sp)
    80004240:	00913423          	sd	s1,8(sp)
    80004244:	01213023          	sd	s2,0(sp)
    80004248:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000424c:	00000493          	li	s1,0
    80004250:	0400006f          	j	80004290 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004254:	00005517          	auipc	a0,0x5
    80004258:	30450513          	addi	a0,a0,772 # 80009558 <CONSOLE_STATUS+0x548>
    8000425c:	00001097          	auipc	ra,0x1
    80004260:	c80080e7          	jalr	-896(ra) # 80004edc <_Z11printStringPKc>
    80004264:	00000613          	li	a2,0
    80004268:	00a00593          	li	a1,10
    8000426c:	00048513          	mv	a0,s1
    80004270:	00001097          	auipc	ra,0x1
    80004274:	e1c080e7          	jalr	-484(ra) # 8000508c <_Z8printIntiii>
    80004278:	00005517          	auipc	a0,0x5
    8000427c:	f9850513          	addi	a0,a0,-104 # 80009210 <CONSOLE_STATUS+0x200>
    80004280:	00001097          	auipc	ra,0x1
    80004284:	c5c080e7          	jalr	-932(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004288:	0014849b          	addiw	s1,s1,1
    8000428c:	0ff4f493          	andi	s1,s1,255
    80004290:	00200793          	li	a5,2
    80004294:	fc97f0e3          	bgeu	a5,s1,80004254 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004298:	00005517          	auipc	a0,0x5
    8000429c:	2c850513          	addi	a0,a0,712 # 80009560 <CONSOLE_STATUS+0x550>
    800042a0:	00001097          	auipc	ra,0x1
    800042a4:	c3c080e7          	jalr	-964(ra) # 80004edc <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800042a8:	00700313          	li	t1,7
    thread_dispatch();
    800042ac:	ffffd097          	auipc	ra,0xffffd
    800042b0:	218080e7          	jalr	536(ra) # 800014c4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800042b4:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800042b8:	00005517          	auipc	a0,0x5
    800042bc:	2b850513          	addi	a0,a0,696 # 80009570 <CONSOLE_STATUS+0x560>
    800042c0:	00001097          	auipc	ra,0x1
    800042c4:	c1c080e7          	jalr	-996(ra) # 80004edc <_Z11printStringPKc>
    800042c8:	00000613          	li	a2,0
    800042cc:	00a00593          	li	a1,10
    800042d0:	0009051b          	sext.w	a0,s2
    800042d4:	00001097          	auipc	ra,0x1
    800042d8:	db8080e7          	jalr	-584(ra) # 8000508c <_Z8printIntiii>
    800042dc:	00005517          	auipc	a0,0x5
    800042e0:	f3450513          	addi	a0,a0,-204 # 80009210 <CONSOLE_STATUS+0x200>
    800042e4:	00001097          	auipc	ra,0x1
    800042e8:	bf8080e7          	jalr	-1032(ra) # 80004edc <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800042ec:	00c00513          	li	a0,12
    800042f0:	00000097          	auipc	ra,0x0
    800042f4:	d88080e7          	jalr	-632(ra) # 80004078 <_ZL9fibonaccim>
    800042f8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800042fc:	00005517          	auipc	a0,0x5
    80004300:	27c50513          	addi	a0,a0,636 # 80009578 <CONSOLE_STATUS+0x568>
    80004304:	00001097          	auipc	ra,0x1
    80004308:	bd8080e7          	jalr	-1064(ra) # 80004edc <_Z11printStringPKc>
    8000430c:	00000613          	li	a2,0
    80004310:	00a00593          	li	a1,10
    80004314:	0009051b          	sext.w	a0,s2
    80004318:	00001097          	auipc	ra,0x1
    8000431c:	d74080e7          	jalr	-652(ra) # 8000508c <_Z8printIntiii>
    80004320:	00005517          	auipc	a0,0x5
    80004324:	ef050513          	addi	a0,a0,-272 # 80009210 <CONSOLE_STATUS+0x200>
    80004328:	00001097          	auipc	ra,0x1
    8000432c:	bb4080e7          	jalr	-1100(ra) # 80004edc <_Z11printStringPKc>
    80004330:	0400006f          	j	80004370 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004334:	00005517          	auipc	a0,0x5
    80004338:	22450513          	addi	a0,a0,548 # 80009558 <CONSOLE_STATUS+0x548>
    8000433c:	00001097          	auipc	ra,0x1
    80004340:	ba0080e7          	jalr	-1120(ra) # 80004edc <_Z11printStringPKc>
    80004344:	00000613          	li	a2,0
    80004348:	00a00593          	li	a1,10
    8000434c:	00048513          	mv	a0,s1
    80004350:	00001097          	auipc	ra,0x1
    80004354:	d3c080e7          	jalr	-708(ra) # 8000508c <_Z8printIntiii>
    80004358:	00005517          	auipc	a0,0x5
    8000435c:	eb850513          	addi	a0,a0,-328 # 80009210 <CONSOLE_STATUS+0x200>
    80004360:	00001097          	auipc	ra,0x1
    80004364:	b7c080e7          	jalr	-1156(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004368:	0014849b          	addiw	s1,s1,1
    8000436c:	0ff4f493          	andi	s1,s1,255
    80004370:	00500793          	li	a5,5
    80004374:	fc97f0e3          	bgeu	a5,s1,80004334 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004378:	00005517          	auipc	a0,0x5
    8000437c:	1b850513          	addi	a0,a0,440 # 80009530 <CONSOLE_STATUS+0x520>
    80004380:	00001097          	auipc	ra,0x1
    80004384:	b5c080e7          	jalr	-1188(ra) # 80004edc <_Z11printStringPKc>
    finishedC = true;
    80004388:	00100793          	li	a5,1
    8000438c:	00007717          	auipc	a4,0x7
    80004390:	3af704a3          	sb	a5,937(a4) # 8000b735 <_ZL9finishedC>
    thread_dispatch();
    80004394:	ffffd097          	auipc	ra,0xffffd
    80004398:	130080e7          	jalr	304(ra) # 800014c4 <_Z15thread_dispatchv>
}
    8000439c:	01813083          	ld	ra,24(sp)
    800043a0:	01013403          	ld	s0,16(sp)
    800043a4:	00813483          	ld	s1,8(sp)
    800043a8:	00013903          	ld	s2,0(sp)
    800043ac:	02010113          	addi	sp,sp,32
    800043b0:	00008067          	ret

00000000800043b4 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800043b4:	fe010113          	addi	sp,sp,-32
    800043b8:	00113c23          	sd	ra,24(sp)
    800043bc:	00813823          	sd	s0,16(sp)
    800043c0:	00913423          	sd	s1,8(sp)
    800043c4:	01213023          	sd	s2,0(sp)
    800043c8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800043cc:	00000913          	li	s2,0
    800043d0:	0380006f          	j	80004408 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800043d4:	ffffd097          	auipc	ra,0xffffd
    800043d8:	0f0080e7          	jalr	240(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800043dc:	00148493          	addi	s1,s1,1
    800043e0:	000027b7          	lui	a5,0x2
    800043e4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800043e8:	0097ee63          	bltu	a5,s1,80004404 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800043ec:	00000713          	li	a4,0
    800043f0:	000077b7          	lui	a5,0x7
    800043f4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800043f8:	fce7eee3          	bltu	a5,a4,800043d4 <_ZL11workerBodyBPv+0x20>
    800043fc:	00170713          	addi	a4,a4,1
    80004400:	ff1ff06f          	j	800043f0 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004404:	00190913          	addi	s2,s2,1
    80004408:	00f00793          	li	a5,15
    8000440c:	0527e063          	bltu	a5,s2,8000444c <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004410:	00005517          	auipc	a0,0x5
    80004414:	13050513          	addi	a0,a0,304 # 80009540 <CONSOLE_STATUS+0x530>
    80004418:	00001097          	auipc	ra,0x1
    8000441c:	ac4080e7          	jalr	-1340(ra) # 80004edc <_Z11printStringPKc>
    80004420:	00000613          	li	a2,0
    80004424:	00a00593          	li	a1,10
    80004428:	0009051b          	sext.w	a0,s2
    8000442c:	00001097          	auipc	ra,0x1
    80004430:	c60080e7          	jalr	-928(ra) # 8000508c <_Z8printIntiii>
    80004434:	00005517          	auipc	a0,0x5
    80004438:	ddc50513          	addi	a0,a0,-548 # 80009210 <CONSOLE_STATUS+0x200>
    8000443c:	00001097          	auipc	ra,0x1
    80004440:	aa0080e7          	jalr	-1376(ra) # 80004edc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004444:	00000493          	li	s1,0
    80004448:	f99ff06f          	j	800043e0 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    8000444c:	00005517          	auipc	a0,0x5
    80004450:	0fc50513          	addi	a0,a0,252 # 80009548 <CONSOLE_STATUS+0x538>
    80004454:	00001097          	auipc	ra,0x1
    80004458:	a88080e7          	jalr	-1400(ra) # 80004edc <_Z11printStringPKc>
    finishedB = true;
    8000445c:	00100793          	li	a5,1
    80004460:	00007717          	auipc	a4,0x7
    80004464:	2cf70b23          	sb	a5,726(a4) # 8000b736 <_ZL9finishedB>
    thread_dispatch();
    80004468:	ffffd097          	auipc	ra,0xffffd
    8000446c:	05c080e7          	jalr	92(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80004470:	01813083          	ld	ra,24(sp)
    80004474:	01013403          	ld	s0,16(sp)
    80004478:	00813483          	ld	s1,8(sp)
    8000447c:	00013903          	ld	s2,0(sp)
    80004480:	02010113          	addi	sp,sp,32
    80004484:	00008067          	ret

0000000080004488 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004488:	fe010113          	addi	sp,sp,-32
    8000448c:	00113c23          	sd	ra,24(sp)
    80004490:	00813823          	sd	s0,16(sp)
    80004494:	00913423          	sd	s1,8(sp)
    80004498:	01213023          	sd	s2,0(sp)
    8000449c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800044a0:	00000913          	li	s2,0
    800044a4:	0380006f          	j	800044dc <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800044a8:	ffffd097          	auipc	ra,0xffffd
    800044ac:	01c080e7          	jalr	28(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800044b0:	00148493          	addi	s1,s1,1
    800044b4:	000027b7          	lui	a5,0x2
    800044b8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800044bc:	0097ee63          	bltu	a5,s1,800044d8 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800044c0:	00000713          	li	a4,0
    800044c4:	000077b7          	lui	a5,0x7
    800044c8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800044cc:	fce7eee3          	bltu	a5,a4,800044a8 <_ZL11workerBodyAPv+0x20>
    800044d0:	00170713          	addi	a4,a4,1
    800044d4:	ff1ff06f          	j	800044c4 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800044d8:	00190913          	addi	s2,s2,1
    800044dc:	00900793          	li	a5,9
    800044e0:	0527e063          	bltu	a5,s2,80004520 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800044e4:	00005517          	auipc	a0,0x5
    800044e8:	04450513          	addi	a0,a0,68 # 80009528 <CONSOLE_STATUS+0x518>
    800044ec:	00001097          	auipc	ra,0x1
    800044f0:	9f0080e7          	jalr	-1552(ra) # 80004edc <_Z11printStringPKc>
    800044f4:	00000613          	li	a2,0
    800044f8:	00a00593          	li	a1,10
    800044fc:	0009051b          	sext.w	a0,s2
    80004500:	00001097          	auipc	ra,0x1
    80004504:	b8c080e7          	jalr	-1140(ra) # 8000508c <_Z8printIntiii>
    80004508:	00005517          	auipc	a0,0x5
    8000450c:	d0850513          	addi	a0,a0,-760 # 80009210 <CONSOLE_STATUS+0x200>
    80004510:	00001097          	auipc	ra,0x1
    80004514:	9cc080e7          	jalr	-1588(ra) # 80004edc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004518:	00000493          	li	s1,0
    8000451c:	f99ff06f          	j	800044b4 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004520:	00005517          	auipc	a0,0x5
    80004524:	01050513          	addi	a0,a0,16 # 80009530 <CONSOLE_STATUS+0x520>
    80004528:	00001097          	auipc	ra,0x1
    8000452c:	9b4080e7          	jalr	-1612(ra) # 80004edc <_Z11printStringPKc>
    finishedA = true;
    80004530:	00100793          	li	a5,1
    80004534:	00007717          	auipc	a4,0x7
    80004538:	20f701a3          	sb	a5,515(a4) # 8000b737 <_ZL9finishedA>
}
    8000453c:	01813083          	ld	ra,24(sp)
    80004540:	01013403          	ld	s0,16(sp)
    80004544:	00813483          	ld	s1,8(sp)
    80004548:	00013903          	ld	s2,0(sp)
    8000454c:	02010113          	addi	sp,sp,32
    80004550:	00008067          	ret

0000000080004554 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004554:	fd010113          	addi	sp,sp,-48
    80004558:	02113423          	sd	ra,40(sp)
    8000455c:	02813023          	sd	s0,32(sp)
    80004560:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004564:	00000613          	li	a2,0
    80004568:	00000597          	auipc	a1,0x0
    8000456c:	f2058593          	addi	a1,a1,-224 # 80004488 <_ZL11workerBodyAPv>
    80004570:	fd040513          	addi	a0,s0,-48
    80004574:	ffffd097          	auipc	ra,0xffffd
    80004578:	e88080e7          	jalr	-376(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000457c:	00005517          	auipc	a0,0x5
    80004580:	04450513          	addi	a0,a0,68 # 800095c0 <CONSOLE_STATUS+0x5b0>
    80004584:	00001097          	auipc	ra,0x1
    80004588:	958080e7          	jalr	-1704(ra) # 80004edc <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000458c:	00000613          	li	a2,0
    80004590:	00000597          	auipc	a1,0x0
    80004594:	e2458593          	addi	a1,a1,-476 # 800043b4 <_ZL11workerBodyBPv>
    80004598:	fd840513          	addi	a0,s0,-40
    8000459c:	ffffd097          	auipc	ra,0xffffd
    800045a0:	e60080e7          	jalr	-416(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800045a4:	00005517          	auipc	a0,0x5
    800045a8:	03450513          	addi	a0,a0,52 # 800095d8 <CONSOLE_STATUS+0x5c8>
    800045ac:	00001097          	auipc	ra,0x1
    800045b0:	930080e7          	jalr	-1744(ra) # 80004edc <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800045b4:	00000613          	li	a2,0
    800045b8:	00000597          	auipc	a1,0x0
    800045bc:	c7c58593          	addi	a1,a1,-900 # 80004234 <_ZL11workerBodyCPv>
    800045c0:	fe040513          	addi	a0,s0,-32
    800045c4:	ffffd097          	auipc	ra,0xffffd
    800045c8:	e38080e7          	jalr	-456(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800045cc:	00005517          	auipc	a0,0x5
    800045d0:	02450513          	addi	a0,a0,36 # 800095f0 <CONSOLE_STATUS+0x5e0>
    800045d4:	00001097          	auipc	ra,0x1
    800045d8:	908080e7          	jalr	-1784(ra) # 80004edc <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800045dc:	00000613          	li	a2,0
    800045e0:	00000597          	auipc	a1,0x0
    800045e4:	b0c58593          	addi	a1,a1,-1268 # 800040ec <_ZL11workerBodyDPv>
    800045e8:	fe840513          	addi	a0,s0,-24
    800045ec:	ffffd097          	auipc	ra,0xffffd
    800045f0:	e10080e7          	jalr	-496(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800045f4:	00005517          	auipc	a0,0x5
    800045f8:	01450513          	addi	a0,a0,20 # 80009608 <CONSOLE_STATUS+0x5f8>
    800045fc:	00001097          	auipc	ra,0x1
    80004600:	8e0080e7          	jalr	-1824(ra) # 80004edc <_Z11printStringPKc>
    80004604:	00c0006f          	j	80004610 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004608:	ffffd097          	auipc	ra,0xffffd
    8000460c:	ebc080e7          	jalr	-324(ra) # 800014c4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004610:	00007797          	auipc	a5,0x7
    80004614:	1277c783          	lbu	a5,295(a5) # 8000b737 <_ZL9finishedA>
    80004618:	fe0788e3          	beqz	a5,80004608 <_Z18Threads_C_API_testv+0xb4>
    8000461c:	00007797          	auipc	a5,0x7
    80004620:	11a7c783          	lbu	a5,282(a5) # 8000b736 <_ZL9finishedB>
    80004624:	fe0782e3          	beqz	a5,80004608 <_Z18Threads_C_API_testv+0xb4>
    80004628:	00007797          	auipc	a5,0x7
    8000462c:	10d7c783          	lbu	a5,269(a5) # 8000b735 <_ZL9finishedC>
    80004630:	fc078ce3          	beqz	a5,80004608 <_Z18Threads_C_API_testv+0xb4>
    80004634:	00007797          	auipc	a5,0x7
    80004638:	1007c783          	lbu	a5,256(a5) # 8000b734 <_ZL9finishedD>
    8000463c:	fc0786e3          	beqz	a5,80004608 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004640:	02813083          	ld	ra,40(sp)
    80004644:	02013403          	ld	s0,32(sp)
    80004648:	03010113          	addi	sp,sp,48
    8000464c:	00008067          	ret

0000000080004650 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004650:	fd010113          	addi	sp,sp,-48
    80004654:	02113423          	sd	ra,40(sp)
    80004658:	02813023          	sd	s0,32(sp)
    8000465c:	00913c23          	sd	s1,24(sp)
    80004660:	01213823          	sd	s2,16(sp)
    80004664:	01313423          	sd	s3,8(sp)
    80004668:	03010413          	addi	s0,sp,48
    8000466c:	00050993          	mv	s3,a0
    80004670:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004674:	00000913          	li	s2,0
    80004678:	00c0006f          	j	80004684 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000467c:	ffffd097          	auipc	ra,0xffffd
    80004680:	778080e7          	jalr	1912(ra) # 80001df4 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004684:	ffffd097          	auipc	ra,0xffffd
    80004688:	f60080e7          	jalr	-160(ra) # 800015e4 <_Z4getcv>
    8000468c:	0005059b          	sext.w	a1,a0
    80004690:	01b00793          	li	a5,27
    80004694:	02f58a63          	beq	a1,a5,800046c8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004698:	0084b503          	ld	a0,8(s1)
    8000469c:	00001097          	auipc	ra,0x1
    800046a0:	c64080e7          	jalr	-924(ra) # 80005300 <_ZN9BufferCPP3putEi>
        i++;
    800046a4:	0019071b          	addiw	a4,s2,1
    800046a8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800046ac:	0004a683          	lw	a3,0(s1)
    800046b0:	0026979b          	slliw	a5,a3,0x2
    800046b4:	00d787bb          	addw	a5,a5,a3
    800046b8:	0017979b          	slliw	a5,a5,0x1
    800046bc:	02f767bb          	remw	a5,a4,a5
    800046c0:	fc0792e3          	bnez	a5,80004684 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800046c4:	fb9ff06f          	j	8000467c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800046c8:	00100793          	li	a5,1
    800046cc:	00007717          	auipc	a4,0x7
    800046d0:	06f72623          	sw	a5,108(a4) # 8000b738 <_ZL9threadEnd>
    td->buffer->put('!');
    800046d4:	0209b783          	ld	a5,32(s3)
    800046d8:	02100593          	li	a1,33
    800046dc:	0087b503          	ld	a0,8(a5)
    800046e0:	00001097          	auipc	ra,0x1
    800046e4:	c20080e7          	jalr	-992(ra) # 80005300 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800046e8:	0104b503          	ld	a0,16(s1)
    800046ec:	ffffe097          	auipc	ra,0xffffe
    800046f0:	804080e7          	jalr	-2044(ra) # 80001ef0 <_ZN9Semaphore6signalEv>
}
    800046f4:	02813083          	ld	ra,40(sp)
    800046f8:	02013403          	ld	s0,32(sp)
    800046fc:	01813483          	ld	s1,24(sp)
    80004700:	01013903          	ld	s2,16(sp)
    80004704:	00813983          	ld	s3,8(sp)
    80004708:	03010113          	addi	sp,sp,48
    8000470c:	00008067          	ret

0000000080004710 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80004710:	fe010113          	addi	sp,sp,-32
    80004714:	00113c23          	sd	ra,24(sp)
    80004718:	00813823          	sd	s0,16(sp)
    8000471c:	00913423          	sd	s1,8(sp)
    80004720:	01213023          	sd	s2,0(sp)
    80004724:	02010413          	addi	s0,sp,32
    80004728:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000472c:	00000913          	li	s2,0
    80004730:	00c0006f          	j	8000473c <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004734:	ffffd097          	auipc	ra,0xffffd
    80004738:	6c0080e7          	jalr	1728(ra) # 80001df4 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    8000473c:	00007797          	auipc	a5,0x7
    80004740:	ffc7a783          	lw	a5,-4(a5) # 8000b738 <_ZL9threadEnd>
    80004744:	02079e63          	bnez	a5,80004780 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80004748:	0004a583          	lw	a1,0(s1)
    8000474c:	0305859b          	addiw	a1,a1,48
    80004750:	0084b503          	ld	a0,8(s1)
    80004754:	00001097          	auipc	ra,0x1
    80004758:	bac080e7          	jalr	-1108(ra) # 80005300 <_ZN9BufferCPP3putEi>
        i++;
    8000475c:	0019071b          	addiw	a4,s2,1
    80004760:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004764:	0004a683          	lw	a3,0(s1)
    80004768:	0026979b          	slliw	a5,a3,0x2
    8000476c:	00d787bb          	addw	a5,a5,a3
    80004770:	0017979b          	slliw	a5,a5,0x1
    80004774:	02f767bb          	remw	a5,a4,a5
    80004778:	fc0792e3          	bnez	a5,8000473c <_ZN12ProducerSync8producerEPv+0x2c>
    8000477c:	fb9ff06f          	j	80004734 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004780:	0104b503          	ld	a0,16(s1)
    80004784:	ffffd097          	auipc	ra,0xffffd
    80004788:	76c080e7          	jalr	1900(ra) # 80001ef0 <_ZN9Semaphore6signalEv>
}
    8000478c:	01813083          	ld	ra,24(sp)
    80004790:	01013403          	ld	s0,16(sp)
    80004794:	00813483          	ld	s1,8(sp)
    80004798:	00013903          	ld	s2,0(sp)
    8000479c:	02010113          	addi	sp,sp,32
    800047a0:	00008067          	ret

00000000800047a4 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800047a4:	fd010113          	addi	sp,sp,-48
    800047a8:	02113423          	sd	ra,40(sp)
    800047ac:	02813023          	sd	s0,32(sp)
    800047b0:	00913c23          	sd	s1,24(sp)
    800047b4:	01213823          	sd	s2,16(sp)
    800047b8:	01313423          	sd	s3,8(sp)
    800047bc:	01413023          	sd	s4,0(sp)
    800047c0:	03010413          	addi	s0,sp,48
    800047c4:	00050993          	mv	s3,a0
    800047c8:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800047cc:	00000a13          	li	s4,0
    800047d0:	01c0006f          	j	800047ec <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800047d4:	ffffd097          	auipc	ra,0xffffd
    800047d8:	620080e7          	jalr	1568(ra) # 80001df4 <_ZN6Thread8dispatchEv>
    800047dc:	0500006f          	j	8000482c <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800047e0:	00a00513          	li	a0,10
    800047e4:	ffffd097          	auipc	ra,0xffffd
    800047e8:	e34080e7          	jalr	-460(ra) # 80001618 <_Z4putcc>
    while (!threadEnd) {
    800047ec:	00007797          	auipc	a5,0x7
    800047f0:	f4c7a783          	lw	a5,-180(a5) # 8000b738 <_ZL9threadEnd>
    800047f4:	06079263          	bnez	a5,80004858 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800047f8:	00893503          	ld	a0,8(s2)
    800047fc:	00001097          	auipc	ra,0x1
    80004800:	b94080e7          	jalr	-1132(ra) # 80005390 <_ZN9BufferCPP3getEv>
        i++;
    80004804:	001a049b          	addiw	s1,s4,1
    80004808:	00048a1b          	sext.w	s4,s1
        putc(key);
    8000480c:	0ff57513          	andi	a0,a0,255
    80004810:	ffffd097          	auipc	ra,0xffffd
    80004814:	e08080e7          	jalr	-504(ra) # 80001618 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80004818:	00092703          	lw	a4,0(s2)
    8000481c:	0027179b          	slliw	a5,a4,0x2
    80004820:	00e787bb          	addw	a5,a5,a4
    80004824:	02f4e7bb          	remw	a5,s1,a5
    80004828:	fa0786e3          	beqz	a5,800047d4 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    8000482c:	05000793          	li	a5,80
    80004830:	02f4e4bb          	remw	s1,s1,a5
    80004834:	fa049ce3          	bnez	s1,800047ec <_ZN12ConsumerSync8consumerEPv+0x48>
    80004838:	fa9ff06f          	j	800047e0 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    8000483c:	0209b783          	ld	a5,32(s3)
    80004840:	0087b503          	ld	a0,8(a5)
    80004844:	00001097          	auipc	ra,0x1
    80004848:	b4c080e7          	jalr	-1204(ra) # 80005390 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    8000484c:	0ff57513          	andi	a0,a0,255
    80004850:	ffffd097          	auipc	ra,0xffffd
    80004854:	6f4080e7          	jalr	1780(ra) # 80001f44 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80004858:	0209b783          	ld	a5,32(s3)
    8000485c:	0087b503          	ld	a0,8(a5)
    80004860:	00001097          	auipc	ra,0x1
    80004864:	bbc080e7          	jalr	-1092(ra) # 8000541c <_ZN9BufferCPP6getCntEv>
    80004868:	fca04ae3          	bgtz	a0,8000483c <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    8000486c:	01093503          	ld	a0,16(s2)
    80004870:	ffffd097          	auipc	ra,0xffffd
    80004874:	680080e7          	jalr	1664(ra) # 80001ef0 <_ZN9Semaphore6signalEv>
}
    80004878:	02813083          	ld	ra,40(sp)
    8000487c:	02013403          	ld	s0,32(sp)
    80004880:	01813483          	ld	s1,24(sp)
    80004884:	01013903          	ld	s2,16(sp)
    80004888:	00813983          	ld	s3,8(sp)
    8000488c:	00013a03          	ld	s4,0(sp)
    80004890:	03010113          	addi	sp,sp,48
    80004894:	00008067          	ret

0000000080004898 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80004898:	f8010113          	addi	sp,sp,-128
    8000489c:	06113c23          	sd	ra,120(sp)
    800048a0:	06813823          	sd	s0,112(sp)
    800048a4:	06913423          	sd	s1,104(sp)
    800048a8:	07213023          	sd	s2,96(sp)
    800048ac:	05313c23          	sd	s3,88(sp)
    800048b0:	05413823          	sd	s4,80(sp)
    800048b4:	05513423          	sd	s5,72(sp)
    800048b8:	05613023          	sd	s6,64(sp)
    800048bc:	03713c23          	sd	s7,56(sp)
    800048c0:	03813823          	sd	s8,48(sp)
    800048c4:	03913423          	sd	s9,40(sp)
    800048c8:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800048cc:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800048d0:	00005517          	auipc	a0,0x5
    800048d4:	b7050513          	addi	a0,a0,-1168 # 80009440 <CONSOLE_STATUS+0x430>
    800048d8:	00000097          	auipc	ra,0x0
    800048dc:	604080e7          	jalr	1540(ra) # 80004edc <_Z11printStringPKc>
    getString(input, 30);
    800048e0:	01e00593          	li	a1,30
    800048e4:	f8040493          	addi	s1,s0,-128
    800048e8:	00048513          	mv	a0,s1
    800048ec:	00000097          	auipc	ra,0x0
    800048f0:	678080e7          	jalr	1656(ra) # 80004f64 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800048f4:	00048513          	mv	a0,s1
    800048f8:	00000097          	auipc	ra,0x0
    800048fc:	744080e7          	jalr	1860(ra) # 8000503c <_Z11stringToIntPKc>
    80004900:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80004904:	00005517          	auipc	a0,0x5
    80004908:	b5c50513          	addi	a0,a0,-1188 # 80009460 <CONSOLE_STATUS+0x450>
    8000490c:	00000097          	auipc	ra,0x0
    80004910:	5d0080e7          	jalr	1488(ra) # 80004edc <_Z11printStringPKc>
    getString(input, 30);
    80004914:	01e00593          	li	a1,30
    80004918:	00048513          	mv	a0,s1
    8000491c:	00000097          	auipc	ra,0x0
    80004920:	648080e7          	jalr	1608(ra) # 80004f64 <_Z9getStringPci>
    n = stringToInt(input);
    80004924:	00048513          	mv	a0,s1
    80004928:	00000097          	auipc	ra,0x0
    8000492c:	714080e7          	jalr	1812(ra) # 8000503c <_Z11stringToIntPKc>
    80004930:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80004934:	00005517          	auipc	a0,0x5
    80004938:	b4c50513          	addi	a0,a0,-1204 # 80009480 <CONSOLE_STATUS+0x470>
    8000493c:	00000097          	auipc	ra,0x0
    80004940:	5a0080e7          	jalr	1440(ra) # 80004edc <_Z11printStringPKc>
    80004944:	00000613          	li	a2,0
    80004948:	00a00593          	li	a1,10
    8000494c:	00090513          	mv	a0,s2
    80004950:	00000097          	auipc	ra,0x0
    80004954:	73c080e7          	jalr	1852(ra) # 8000508c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004958:	00005517          	auipc	a0,0x5
    8000495c:	b4050513          	addi	a0,a0,-1216 # 80009498 <CONSOLE_STATUS+0x488>
    80004960:	00000097          	auipc	ra,0x0
    80004964:	57c080e7          	jalr	1404(ra) # 80004edc <_Z11printStringPKc>
    80004968:	00000613          	li	a2,0
    8000496c:	00a00593          	li	a1,10
    80004970:	00048513          	mv	a0,s1
    80004974:	00000097          	auipc	ra,0x0
    80004978:	718080e7          	jalr	1816(ra) # 8000508c <_Z8printIntiii>
    printString(".\n");
    8000497c:	00005517          	auipc	a0,0x5
    80004980:	b3450513          	addi	a0,a0,-1228 # 800094b0 <CONSOLE_STATUS+0x4a0>
    80004984:	00000097          	auipc	ra,0x0
    80004988:	558080e7          	jalr	1368(ra) # 80004edc <_Z11printStringPKc>
    if(threadNum > n) {
    8000498c:	0324c463          	blt	s1,s2,800049b4 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80004990:	03205c63          	blez	s2,800049c8 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004994:	03800513          	li	a0,56
    80004998:	ffffd097          	auipc	ra,0xffffd
    8000499c:	26c080e7          	jalr	620(ra) # 80001c04 <_Znwm>
    800049a0:	00050a93          	mv	s5,a0
    800049a4:	00048593          	mv	a1,s1
    800049a8:	00001097          	auipc	ra,0x1
    800049ac:	804080e7          	jalr	-2044(ra) # 800051ac <_ZN9BufferCPPC1Ei>
    800049b0:	0300006f          	j	800049e0 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800049b4:	00005517          	auipc	a0,0x5
    800049b8:	b0450513          	addi	a0,a0,-1276 # 800094b8 <CONSOLE_STATUS+0x4a8>
    800049bc:	00000097          	auipc	ra,0x0
    800049c0:	520080e7          	jalr	1312(ra) # 80004edc <_Z11printStringPKc>
        return;
    800049c4:	0140006f          	j	800049d8 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800049c8:	00005517          	auipc	a0,0x5
    800049cc:	b3050513          	addi	a0,a0,-1232 # 800094f8 <CONSOLE_STATUS+0x4e8>
    800049d0:	00000097          	auipc	ra,0x0
    800049d4:	50c080e7          	jalr	1292(ra) # 80004edc <_Z11printStringPKc>
        return;
    800049d8:	000b8113          	mv	sp,s7
    800049dc:	2380006f          	j	80004c14 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800049e0:	01000513          	li	a0,16
    800049e4:	ffffd097          	auipc	ra,0xffffd
    800049e8:	220080e7          	jalr	544(ra) # 80001c04 <_Znwm>
    800049ec:	00050493          	mv	s1,a0
    800049f0:	00000593          	li	a1,0
    800049f4:	ffffd097          	auipc	ra,0xffffd
    800049f8:	494080e7          	jalr	1172(ra) # 80001e88 <_ZN9SemaphoreC1Ej>
    800049fc:	00007797          	auipc	a5,0x7
    80004a00:	d497b223          	sd	s1,-700(a5) # 8000b740 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80004a04:	00391793          	slli	a5,s2,0x3
    80004a08:	00f78793          	addi	a5,a5,15
    80004a0c:	ff07f793          	andi	a5,a5,-16
    80004a10:	40f10133          	sub	sp,sp,a5
    80004a14:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80004a18:	0019071b          	addiw	a4,s2,1
    80004a1c:	00171793          	slli	a5,a4,0x1
    80004a20:	00e787b3          	add	a5,a5,a4
    80004a24:	00379793          	slli	a5,a5,0x3
    80004a28:	00f78793          	addi	a5,a5,15
    80004a2c:	ff07f793          	andi	a5,a5,-16
    80004a30:	40f10133          	sub	sp,sp,a5
    80004a34:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80004a38:	00191c13          	slli	s8,s2,0x1
    80004a3c:	012c07b3          	add	a5,s8,s2
    80004a40:	00379793          	slli	a5,a5,0x3
    80004a44:	00fa07b3          	add	a5,s4,a5
    80004a48:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004a4c:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80004a50:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80004a54:	02800513          	li	a0,40
    80004a58:	ffffd097          	auipc	ra,0xffffd
    80004a5c:	1ac080e7          	jalr	428(ra) # 80001c04 <_Znwm>
    80004a60:	00050b13          	mv	s6,a0
    80004a64:	012c0c33          	add	s8,s8,s2
    80004a68:	003c1c13          	slli	s8,s8,0x3
    80004a6c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80004a70:	ffffd097          	auipc	ra,0xffffd
    80004a74:	2b8080e7          	jalr	696(ra) # 80001d28 <_ZN6ThreadC1Ev>
    80004a78:	00007797          	auipc	a5,0x7
    80004a7c:	ba878793          	addi	a5,a5,-1112 # 8000b620 <_ZTV12ConsumerSync+0x10>
    80004a80:	00fb3023          	sd	a5,0(s6)
    80004a84:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80004a88:	000b0513          	mv	a0,s6
    80004a8c:	ffffd097          	auipc	ra,0xffffd
    80004a90:	2ec080e7          	jalr	748(ra) # 80001d78 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004a94:	00000493          	li	s1,0
    80004a98:	0380006f          	j	80004ad0 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004a9c:	00007797          	auipc	a5,0x7
    80004aa0:	b5c78793          	addi	a5,a5,-1188 # 8000b5f8 <_ZTV12ProducerSync+0x10>
    80004aa4:	00fcb023          	sd	a5,0(s9)
    80004aa8:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80004aac:	00349793          	slli	a5,s1,0x3
    80004ab0:	00f987b3          	add	a5,s3,a5
    80004ab4:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80004ab8:	00349793          	slli	a5,s1,0x3
    80004abc:	00f987b3          	add	a5,s3,a5
    80004ac0:	0007b503          	ld	a0,0(a5)
    80004ac4:	ffffd097          	auipc	ra,0xffffd
    80004ac8:	2b4080e7          	jalr	692(ra) # 80001d78 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004acc:	0014849b          	addiw	s1,s1,1
    80004ad0:	0b24d063          	bge	s1,s2,80004b70 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80004ad4:	00149793          	slli	a5,s1,0x1
    80004ad8:	009787b3          	add	a5,a5,s1
    80004adc:	00379793          	slli	a5,a5,0x3
    80004ae0:	00fa07b3          	add	a5,s4,a5
    80004ae4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004ae8:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80004aec:	00007717          	auipc	a4,0x7
    80004af0:	c5473703          	ld	a4,-940(a4) # 8000b740 <_ZL10waitForAll>
    80004af4:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80004af8:	02905863          	blez	s1,80004b28 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80004afc:	02800513          	li	a0,40
    80004b00:	ffffd097          	auipc	ra,0xffffd
    80004b04:	104080e7          	jalr	260(ra) # 80001c04 <_Znwm>
    80004b08:	00050c93          	mv	s9,a0
    80004b0c:	00149c13          	slli	s8,s1,0x1
    80004b10:	009c0c33          	add	s8,s8,s1
    80004b14:	003c1c13          	slli	s8,s8,0x3
    80004b18:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004b1c:	ffffd097          	auipc	ra,0xffffd
    80004b20:	20c080e7          	jalr	524(ra) # 80001d28 <_ZN6ThreadC1Ev>
    80004b24:	f79ff06f          	j	80004a9c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80004b28:	02800513          	li	a0,40
    80004b2c:	ffffd097          	auipc	ra,0xffffd
    80004b30:	0d8080e7          	jalr	216(ra) # 80001c04 <_Znwm>
    80004b34:	00050c93          	mv	s9,a0
    80004b38:	00149c13          	slli	s8,s1,0x1
    80004b3c:	009c0c33          	add	s8,s8,s1
    80004b40:	003c1c13          	slli	s8,s8,0x3
    80004b44:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80004b48:	ffffd097          	auipc	ra,0xffffd
    80004b4c:	1e0080e7          	jalr	480(ra) # 80001d28 <_ZN6ThreadC1Ev>
    80004b50:	00007797          	auipc	a5,0x7
    80004b54:	a8078793          	addi	a5,a5,-1408 # 8000b5d0 <_ZTV16ProducerKeyboard+0x10>
    80004b58:	00fcb023          	sd	a5,0(s9)
    80004b5c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80004b60:	00349793          	slli	a5,s1,0x3
    80004b64:	00f987b3          	add	a5,s3,a5
    80004b68:	0197b023          	sd	s9,0(a5)
    80004b6c:	f4dff06f          	j	80004ab8 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80004b70:	ffffd097          	auipc	ra,0xffffd
    80004b74:	284080e7          	jalr	644(ra) # 80001df4 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004b78:	00000493          	li	s1,0
    80004b7c:	00994e63          	blt	s2,s1,80004b98 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80004b80:	00007517          	auipc	a0,0x7
    80004b84:	bc053503          	ld	a0,-1088(a0) # 8000b740 <_ZL10waitForAll>
    80004b88:	ffffd097          	auipc	ra,0xffffd
    80004b8c:	33c080e7          	jalr	828(ra) # 80001ec4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004b90:	0014849b          	addiw	s1,s1,1
    80004b94:	fe9ff06f          	j	80004b7c <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80004b98:	00000493          	li	s1,0
    80004b9c:	0080006f          	j	80004ba4 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80004ba0:	0014849b          	addiw	s1,s1,1
    80004ba4:	0324d263          	bge	s1,s2,80004bc8 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80004ba8:	00349793          	slli	a5,s1,0x3
    80004bac:	00f987b3          	add	a5,s3,a5
    80004bb0:	0007b503          	ld	a0,0(a5)
    80004bb4:	fe0506e3          	beqz	a0,80004ba0 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80004bb8:	00053783          	ld	a5,0(a0)
    80004bbc:	0087b783          	ld	a5,8(a5)
    80004bc0:	000780e7          	jalr	a5
    80004bc4:	fddff06f          	j	80004ba0 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80004bc8:	000b0a63          	beqz	s6,80004bdc <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80004bcc:	000b3783          	ld	a5,0(s6)
    80004bd0:	0087b783          	ld	a5,8(a5)
    80004bd4:	000b0513          	mv	a0,s6
    80004bd8:	000780e7          	jalr	a5
    delete waitForAll;
    80004bdc:	00007517          	auipc	a0,0x7
    80004be0:	b6453503          	ld	a0,-1180(a0) # 8000b740 <_ZL10waitForAll>
    80004be4:	00050863          	beqz	a0,80004bf4 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80004be8:	00053783          	ld	a5,0(a0)
    80004bec:	0087b783          	ld	a5,8(a5)
    80004bf0:	000780e7          	jalr	a5
    delete buffer;
    80004bf4:	000a8e63          	beqz	s5,80004c10 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80004bf8:	000a8513          	mv	a0,s5
    80004bfc:	00001097          	auipc	ra,0x1
    80004c00:	8a8080e7          	jalr	-1880(ra) # 800054a4 <_ZN9BufferCPPD1Ev>
    80004c04:	000a8513          	mv	a0,s5
    80004c08:	ffffd097          	auipc	ra,0xffffd
    80004c0c:	024080e7          	jalr	36(ra) # 80001c2c <_ZdlPv>
    80004c10:	000b8113          	mv	sp,s7

}
    80004c14:	f8040113          	addi	sp,s0,-128
    80004c18:	07813083          	ld	ra,120(sp)
    80004c1c:	07013403          	ld	s0,112(sp)
    80004c20:	06813483          	ld	s1,104(sp)
    80004c24:	06013903          	ld	s2,96(sp)
    80004c28:	05813983          	ld	s3,88(sp)
    80004c2c:	05013a03          	ld	s4,80(sp)
    80004c30:	04813a83          	ld	s5,72(sp)
    80004c34:	04013b03          	ld	s6,64(sp)
    80004c38:	03813b83          	ld	s7,56(sp)
    80004c3c:	03013c03          	ld	s8,48(sp)
    80004c40:	02813c83          	ld	s9,40(sp)
    80004c44:	08010113          	addi	sp,sp,128
    80004c48:	00008067          	ret
    80004c4c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004c50:	000a8513          	mv	a0,s5
    80004c54:	ffffd097          	auipc	ra,0xffffd
    80004c58:	fd8080e7          	jalr	-40(ra) # 80001c2c <_ZdlPv>
    80004c5c:	00048513          	mv	a0,s1
    80004c60:	00008097          	auipc	ra,0x8
    80004c64:	bc8080e7          	jalr	-1080(ra) # 8000c828 <_Unwind_Resume>
    80004c68:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80004c6c:	00048513          	mv	a0,s1
    80004c70:	ffffd097          	auipc	ra,0xffffd
    80004c74:	fbc080e7          	jalr	-68(ra) # 80001c2c <_ZdlPv>
    80004c78:	00090513          	mv	a0,s2
    80004c7c:	00008097          	auipc	ra,0x8
    80004c80:	bac080e7          	jalr	-1108(ra) # 8000c828 <_Unwind_Resume>
    80004c84:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80004c88:	000b0513          	mv	a0,s6
    80004c8c:	ffffd097          	auipc	ra,0xffffd
    80004c90:	fa0080e7          	jalr	-96(ra) # 80001c2c <_ZdlPv>
    80004c94:	00048513          	mv	a0,s1
    80004c98:	00008097          	auipc	ra,0x8
    80004c9c:	b90080e7          	jalr	-1136(ra) # 8000c828 <_Unwind_Resume>
    80004ca0:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80004ca4:	000c8513          	mv	a0,s9
    80004ca8:	ffffd097          	auipc	ra,0xffffd
    80004cac:	f84080e7          	jalr	-124(ra) # 80001c2c <_ZdlPv>
    80004cb0:	00048513          	mv	a0,s1
    80004cb4:	00008097          	auipc	ra,0x8
    80004cb8:	b74080e7          	jalr	-1164(ra) # 8000c828 <_Unwind_Resume>
    80004cbc:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80004cc0:	000c8513          	mv	a0,s9
    80004cc4:	ffffd097          	auipc	ra,0xffffd
    80004cc8:	f68080e7          	jalr	-152(ra) # 80001c2c <_ZdlPv>
    80004ccc:	00048513          	mv	a0,s1
    80004cd0:	00008097          	auipc	ra,0x8
    80004cd4:	b58080e7          	jalr	-1192(ra) # 8000c828 <_Unwind_Resume>

0000000080004cd8 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80004cd8:	ff010113          	addi	sp,sp,-16
    80004cdc:	00113423          	sd	ra,8(sp)
    80004ce0:	00813023          	sd	s0,0(sp)
    80004ce4:	01010413          	addi	s0,sp,16
    80004ce8:	00007797          	auipc	a5,0x7
    80004cec:	93878793          	addi	a5,a5,-1736 # 8000b620 <_ZTV12ConsumerSync+0x10>
    80004cf0:	00f53023          	sd	a5,0(a0)
    80004cf4:	ffffd097          	auipc	ra,0xffffd
    80004cf8:	278080e7          	jalr	632(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80004cfc:	00813083          	ld	ra,8(sp)
    80004d00:	00013403          	ld	s0,0(sp)
    80004d04:	01010113          	addi	sp,sp,16
    80004d08:	00008067          	ret

0000000080004d0c <_ZN12ConsumerSyncD0Ev>:
    80004d0c:	fe010113          	addi	sp,sp,-32
    80004d10:	00113c23          	sd	ra,24(sp)
    80004d14:	00813823          	sd	s0,16(sp)
    80004d18:	00913423          	sd	s1,8(sp)
    80004d1c:	02010413          	addi	s0,sp,32
    80004d20:	00050493          	mv	s1,a0
    80004d24:	00007797          	auipc	a5,0x7
    80004d28:	8fc78793          	addi	a5,a5,-1796 # 8000b620 <_ZTV12ConsumerSync+0x10>
    80004d2c:	00f53023          	sd	a5,0(a0)
    80004d30:	ffffd097          	auipc	ra,0xffffd
    80004d34:	23c080e7          	jalr	572(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80004d38:	00048513          	mv	a0,s1
    80004d3c:	ffffd097          	auipc	ra,0xffffd
    80004d40:	ef0080e7          	jalr	-272(ra) # 80001c2c <_ZdlPv>
    80004d44:	01813083          	ld	ra,24(sp)
    80004d48:	01013403          	ld	s0,16(sp)
    80004d4c:	00813483          	ld	s1,8(sp)
    80004d50:	02010113          	addi	sp,sp,32
    80004d54:	00008067          	ret

0000000080004d58 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80004d58:	ff010113          	addi	sp,sp,-16
    80004d5c:	00113423          	sd	ra,8(sp)
    80004d60:	00813023          	sd	s0,0(sp)
    80004d64:	01010413          	addi	s0,sp,16
    80004d68:	00007797          	auipc	a5,0x7
    80004d6c:	89078793          	addi	a5,a5,-1904 # 8000b5f8 <_ZTV12ProducerSync+0x10>
    80004d70:	00f53023          	sd	a5,0(a0)
    80004d74:	ffffd097          	auipc	ra,0xffffd
    80004d78:	1f8080e7          	jalr	504(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80004d7c:	00813083          	ld	ra,8(sp)
    80004d80:	00013403          	ld	s0,0(sp)
    80004d84:	01010113          	addi	sp,sp,16
    80004d88:	00008067          	ret

0000000080004d8c <_ZN12ProducerSyncD0Ev>:
    80004d8c:	fe010113          	addi	sp,sp,-32
    80004d90:	00113c23          	sd	ra,24(sp)
    80004d94:	00813823          	sd	s0,16(sp)
    80004d98:	00913423          	sd	s1,8(sp)
    80004d9c:	02010413          	addi	s0,sp,32
    80004da0:	00050493          	mv	s1,a0
    80004da4:	00007797          	auipc	a5,0x7
    80004da8:	85478793          	addi	a5,a5,-1964 # 8000b5f8 <_ZTV12ProducerSync+0x10>
    80004dac:	00f53023          	sd	a5,0(a0)
    80004db0:	ffffd097          	auipc	ra,0xffffd
    80004db4:	1bc080e7          	jalr	444(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80004db8:	00048513          	mv	a0,s1
    80004dbc:	ffffd097          	auipc	ra,0xffffd
    80004dc0:	e70080e7          	jalr	-400(ra) # 80001c2c <_ZdlPv>
    80004dc4:	01813083          	ld	ra,24(sp)
    80004dc8:	01013403          	ld	s0,16(sp)
    80004dcc:	00813483          	ld	s1,8(sp)
    80004dd0:	02010113          	addi	sp,sp,32
    80004dd4:	00008067          	ret

0000000080004dd8 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80004dd8:	ff010113          	addi	sp,sp,-16
    80004ddc:	00113423          	sd	ra,8(sp)
    80004de0:	00813023          	sd	s0,0(sp)
    80004de4:	01010413          	addi	s0,sp,16
    80004de8:	00006797          	auipc	a5,0x6
    80004dec:	7e878793          	addi	a5,a5,2024 # 8000b5d0 <_ZTV16ProducerKeyboard+0x10>
    80004df0:	00f53023          	sd	a5,0(a0)
    80004df4:	ffffd097          	auipc	ra,0xffffd
    80004df8:	178080e7          	jalr	376(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80004dfc:	00813083          	ld	ra,8(sp)
    80004e00:	00013403          	ld	s0,0(sp)
    80004e04:	01010113          	addi	sp,sp,16
    80004e08:	00008067          	ret

0000000080004e0c <_ZN16ProducerKeyboardD0Ev>:
    80004e0c:	fe010113          	addi	sp,sp,-32
    80004e10:	00113c23          	sd	ra,24(sp)
    80004e14:	00813823          	sd	s0,16(sp)
    80004e18:	00913423          	sd	s1,8(sp)
    80004e1c:	02010413          	addi	s0,sp,32
    80004e20:	00050493          	mv	s1,a0
    80004e24:	00006797          	auipc	a5,0x6
    80004e28:	7ac78793          	addi	a5,a5,1964 # 8000b5d0 <_ZTV16ProducerKeyboard+0x10>
    80004e2c:	00f53023          	sd	a5,0(a0)
    80004e30:	ffffd097          	auipc	ra,0xffffd
    80004e34:	13c080e7          	jalr	316(ra) # 80001f6c <_ZN6ThreadD1Ev>
    80004e38:	00048513          	mv	a0,s1
    80004e3c:	ffffd097          	auipc	ra,0xffffd
    80004e40:	df0080e7          	jalr	-528(ra) # 80001c2c <_ZdlPv>
    80004e44:	01813083          	ld	ra,24(sp)
    80004e48:	01013403          	ld	s0,16(sp)
    80004e4c:	00813483          	ld	s1,8(sp)
    80004e50:	02010113          	addi	sp,sp,32
    80004e54:	00008067          	ret

0000000080004e58 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80004e58:	ff010113          	addi	sp,sp,-16
    80004e5c:	00113423          	sd	ra,8(sp)
    80004e60:	00813023          	sd	s0,0(sp)
    80004e64:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80004e68:	02053583          	ld	a1,32(a0)
    80004e6c:	fffff097          	auipc	ra,0xfffff
    80004e70:	7e4080e7          	jalr	2020(ra) # 80004650 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80004e74:	00813083          	ld	ra,8(sp)
    80004e78:	00013403          	ld	s0,0(sp)
    80004e7c:	01010113          	addi	sp,sp,16
    80004e80:	00008067          	ret

0000000080004e84 <_ZN12ProducerSync3runEv>:
    void run() override {
    80004e84:	ff010113          	addi	sp,sp,-16
    80004e88:	00113423          	sd	ra,8(sp)
    80004e8c:	00813023          	sd	s0,0(sp)
    80004e90:	01010413          	addi	s0,sp,16
        producer(td);
    80004e94:	02053583          	ld	a1,32(a0)
    80004e98:	00000097          	auipc	ra,0x0
    80004e9c:	878080e7          	jalr	-1928(ra) # 80004710 <_ZN12ProducerSync8producerEPv>
    }
    80004ea0:	00813083          	ld	ra,8(sp)
    80004ea4:	00013403          	ld	s0,0(sp)
    80004ea8:	01010113          	addi	sp,sp,16
    80004eac:	00008067          	ret

0000000080004eb0 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80004eb0:	ff010113          	addi	sp,sp,-16
    80004eb4:	00113423          	sd	ra,8(sp)
    80004eb8:	00813023          	sd	s0,0(sp)
    80004ebc:	01010413          	addi	s0,sp,16
        consumer(td);
    80004ec0:	02053583          	ld	a1,32(a0)
    80004ec4:	00000097          	auipc	ra,0x0
    80004ec8:	8e0080e7          	jalr	-1824(ra) # 800047a4 <_ZN12ConsumerSync8consumerEPv>
    }
    80004ecc:	00813083          	ld	ra,8(sp)
    80004ed0:	00013403          	ld	s0,0(sp)
    80004ed4:	01010113          	addi	sp,sp,16
    80004ed8:	00008067          	ret

0000000080004edc <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80004edc:	fe010113          	addi	sp,sp,-32
    80004ee0:	00113c23          	sd	ra,24(sp)
    80004ee4:	00813823          	sd	s0,16(sp)
    80004ee8:	00913423          	sd	s1,8(sp)
    80004eec:	02010413          	addi	s0,sp,32
    80004ef0:	00050493          	mv	s1,a0
    LOCK();
    80004ef4:	00100613          	li	a2,1
    80004ef8:	00000593          	li	a1,0
    80004efc:	00007517          	auipc	a0,0x7
    80004f00:	84c50513          	addi	a0,a0,-1972 # 8000b748 <lockPrint>
    80004f04:	ffffc097          	auipc	ra,0xffffc
    80004f08:	458080e7          	jalr	1112(ra) # 8000135c <copy_and_swap>
    80004f0c:	00050863          	beqz	a0,80004f1c <_Z11printStringPKc+0x40>
    80004f10:	ffffc097          	auipc	ra,0xffffc
    80004f14:	5b4080e7          	jalr	1460(ra) # 800014c4 <_Z15thread_dispatchv>
    80004f18:	fddff06f          	j	80004ef4 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80004f1c:	0004c503          	lbu	a0,0(s1)
    80004f20:	00050a63          	beqz	a0,80004f34 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80004f24:	ffffc097          	auipc	ra,0xffffc
    80004f28:	6f4080e7          	jalr	1780(ra) # 80001618 <_Z4putcc>
        string++;
    80004f2c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80004f30:	fedff06f          	j	80004f1c <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80004f34:	00000613          	li	a2,0
    80004f38:	00100593          	li	a1,1
    80004f3c:	00007517          	auipc	a0,0x7
    80004f40:	80c50513          	addi	a0,a0,-2036 # 8000b748 <lockPrint>
    80004f44:	ffffc097          	auipc	ra,0xffffc
    80004f48:	418080e7          	jalr	1048(ra) # 8000135c <copy_and_swap>
    80004f4c:	fe0514e3          	bnez	a0,80004f34 <_Z11printStringPKc+0x58>
}
    80004f50:	01813083          	ld	ra,24(sp)
    80004f54:	01013403          	ld	s0,16(sp)
    80004f58:	00813483          	ld	s1,8(sp)
    80004f5c:	02010113          	addi	sp,sp,32
    80004f60:	00008067          	ret

0000000080004f64 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004f64:	fd010113          	addi	sp,sp,-48
    80004f68:	02113423          	sd	ra,40(sp)
    80004f6c:	02813023          	sd	s0,32(sp)
    80004f70:	00913c23          	sd	s1,24(sp)
    80004f74:	01213823          	sd	s2,16(sp)
    80004f78:	01313423          	sd	s3,8(sp)
    80004f7c:	01413023          	sd	s4,0(sp)
    80004f80:	03010413          	addi	s0,sp,48
    80004f84:	00050993          	mv	s3,a0
    80004f88:	00058a13          	mv	s4,a1
    LOCK();
    80004f8c:	00100613          	li	a2,1
    80004f90:	00000593          	li	a1,0
    80004f94:	00006517          	auipc	a0,0x6
    80004f98:	7b450513          	addi	a0,a0,1972 # 8000b748 <lockPrint>
    80004f9c:	ffffc097          	auipc	ra,0xffffc
    80004fa0:	3c0080e7          	jalr	960(ra) # 8000135c <copy_and_swap>
    80004fa4:	00050863          	beqz	a0,80004fb4 <_Z9getStringPci+0x50>
    80004fa8:	ffffc097          	auipc	ra,0xffffc
    80004fac:	51c080e7          	jalr	1308(ra) # 800014c4 <_Z15thread_dispatchv>
    80004fb0:	fddff06f          	j	80004f8c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80004fb4:	00000913          	li	s2,0
    80004fb8:	00090493          	mv	s1,s2
    80004fbc:	0019091b          	addiw	s2,s2,1
    80004fc0:	03495a63          	bge	s2,s4,80004ff4 <_Z9getStringPci+0x90>
        cc = getc();
    80004fc4:	ffffc097          	auipc	ra,0xffffc
    80004fc8:	620080e7          	jalr	1568(ra) # 800015e4 <_Z4getcv>
        if(cc < 1)
    80004fcc:	02050463          	beqz	a0,80004ff4 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80004fd0:	009984b3          	add	s1,s3,s1
    80004fd4:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80004fd8:	00a00793          	li	a5,10
    80004fdc:	00f50a63          	beq	a0,a5,80004ff0 <_Z9getStringPci+0x8c>
    80004fe0:	00d00793          	li	a5,13
    80004fe4:	fcf51ae3          	bne	a0,a5,80004fb8 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80004fe8:	00090493          	mv	s1,s2
    80004fec:	0080006f          	j	80004ff4 <_Z9getStringPci+0x90>
    80004ff0:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80004ff4:	009984b3          	add	s1,s3,s1
    80004ff8:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80004ffc:	00000613          	li	a2,0
    80005000:	00100593          	li	a1,1
    80005004:	00006517          	auipc	a0,0x6
    80005008:	74450513          	addi	a0,a0,1860 # 8000b748 <lockPrint>
    8000500c:	ffffc097          	auipc	ra,0xffffc
    80005010:	350080e7          	jalr	848(ra) # 8000135c <copy_and_swap>
    80005014:	fe0514e3          	bnez	a0,80004ffc <_Z9getStringPci+0x98>
    return buf;
}
    80005018:	00098513          	mv	a0,s3
    8000501c:	02813083          	ld	ra,40(sp)
    80005020:	02013403          	ld	s0,32(sp)
    80005024:	01813483          	ld	s1,24(sp)
    80005028:	01013903          	ld	s2,16(sp)
    8000502c:	00813983          	ld	s3,8(sp)
    80005030:	00013a03          	ld	s4,0(sp)
    80005034:	03010113          	addi	sp,sp,48
    80005038:	00008067          	ret

000000008000503c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    8000503c:	ff010113          	addi	sp,sp,-16
    80005040:	00813423          	sd	s0,8(sp)
    80005044:	01010413          	addi	s0,sp,16
    80005048:	00050693          	mv	a3,a0
    int n;

    n = 0;
    8000504c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005050:	0006c603          	lbu	a2,0(a3)
    80005054:	fd06071b          	addiw	a4,a2,-48
    80005058:	0ff77713          	andi	a4,a4,255
    8000505c:	00900793          	li	a5,9
    80005060:	02e7e063          	bltu	a5,a4,80005080 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005064:	0025179b          	slliw	a5,a0,0x2
    80005068:	00a787bb          	addw	a5,a5,a0
    8000506c:	0017979b          	slliw	a5,a5,0x1
    80005070:	00168693          	addi	a3,a3,1
    80005074:	00c787bb          	addw	a5,a5,a2
    80005078:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    8000507c:	fd5ff06f          	j	80005050 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005080:	00813403          	ld	s0,8(sp)
    80005084:	01010113          	addi	sp,sp,16
    80005088:	00008067          	ret

000000008000508c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    8000508c:	fc010113          	addi	sp,sp,-64
    80005090:	02113c23          	sd	ra,56(sp)
    80005094:	02813823          	sd	s0,48(sp)
    80005098:	02913423          	sd	s1,40(sp)
    8000509c:	03213023          	sd	s2,32(sp)
    800050a0:	01313c23          	sd	s3,24(sp)
    800050a4:	04010413          	addi	s0,sp,64
    800050a8:	00050493          	mv	s1,a0
    800050ac:	00058913          	mv	s2,a1
    800050b0:	00060993          	mv	s3,a2
    LOCK();
    800050b4:	00100613          	li	a2,1
    800050b8:	00000593          	li	a1,0
    800050bc:	00006517          	auipc	a0,0x6
    800050c0:	68c50513          	addi	a0,a0,1676 # 8000b748 <lockPrint>
    800050c4:	ffffc097          	auipc	ra,0xffffc
    800050c8:	298080e7          	jalr	664(ra) # 8000135c <copy_and_swap>
    800050cc:	00050863          	beqz	a0,800050dc <_Z8printIntiii+0x50>
    800050d0:	ffffc097          	auipc	ra,0xffffc
    800050d4:	3f4080e7          	jalr	1012(ra) # 800014c4 <_Z15thread_dispatchv>
    800050d8:	fddff06f          	j	800050b4 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800050dc:	00098463          	beqz	s3,800050e4 <_Z8printIntiii+0x58>
    800050e0:	0804c463          	bltz	s1,80005168 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800050e4:	0004851b          	sext.w	a0,s1
    neg = 0;
    800050e8:	00000593          	li	a1,0
    }

    i = 0;
    800050ec:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800050f0:	0009079b          	sext.w	a5,s2
    800050f4:	0325773b          	remuw	a4,a0,s2
    800050f8:	00048613          	mv	a2,s1
    800050fc:	0014849b          	addiw	s1,s1,1
    80005100:	02071693          	slli	a3,a4,0x20
    80005104:	0206d693          	srli	a3,a3,0x20
    80005108:	00006717          	auipc	a4,0x6
    8000510c:	53070713          	addi	a4,a4,1328 # 8000b638 <digits>
    80005110:	00d70733          	add	a4,a4,a3
    80005114:	00074683          	lbu	a3,0(a4)
    80005118:	fd040713          	addi	a4,s0,-48
    8000511c:	00c70733          	add	a4,a4,a2
    80005120:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005124:	0005071b          	sext.w	a4,a0
    80005128:	0325553b          	divuw	a0,a0,s2
    8000512c:	fcf772e3          	bgeu	a4,a5,800050f0 <_Z8printIntiii+0x64>
    if(neg)
    80005130:	00058c63          	beqz	a1,80005148 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005134:	fd040793          	addi	a5,s0,-48
    80005138:	009784b3          	add	s1,a5,s1
    8000513c:	02d00793          	li	a5,45
    80005140:	fef48823          	sb	a5,-16(s1)
    80005144:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005148:	fff4849b          	addiw	s1,s1,-1
    8000514c:	0204c463          	bltz	s1,80005174 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005150:	fd040793          	addi	a5,s0,-48
    80005154:	009787b3          	add	a5,a5,s1
    80005158:	ff07c503          	lbu	a0,-16(a5)
    8000515c:	ffffc097          	auipc	ra,0xffffc
    80005160:	4bc080e7          	jalr	1212(ra) # 80001618 <_Z4putcc>
    80005164:	fe5ff06f          	j	80005148 <_Z8printIntiii+0xbc>
        x = -xx;
    80005168:	4090053b          	negw	a0,s1
        neg = 1;
    8000516c:	00100593          	li	a1,1
        x = -xx;
    80005170:	f7dff06f          	j	800050ec <_Z8printIntiii+0x60>

    UNLOCK();
    80005174:	00000613          	li	a2,0
    80005178:	00100593          	li	a1,1
    8000517c:	00006517          	auipc	a0,0x6
    80005180:	5cc50513          	addi	a0,a0,1484 # 8000b748 <lockPrint>
    80005184:	ffffc097          	auipc	ra,0xffffc
    80005188:	1d8080e7          	jalr	472(ra) # 8000135c <copy_and_swap>
    8000518c:	fe0514e3          	bnez	a0,80005174 <_Z8printIntiii+0xe8>
    80005190:	03813083          	ld	ra,56(sp)
    80005194:	03013403          	ld	s0,48(sp)
    80005198:	02813483          	ld	s1,40(sp)
    8000519c:	02013903          	ld	s2,32(sp)
    800051a0:	01813983          	ld	s3,24(sp)
    800051a4:	04010113          	addi	sp,sp,64
    800051a8:	00008067          	ret

00000000800051ac <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800051ac:	fd010113          	addi	sp,sp,-48
    800051b0:	02113423          	sd	ra,40(sp)
    800051b4:	02813023          	sd	s0,32(sp)
    800051b8:	00913c23          	sd	s1,24(sp)
    800051bc:	01213823          	sd	s2,16(sp)
    800051c0:	01313423          	sd	s3,8(sp)
    800051c4:	03010413          	addi	s0,sp,48
    800051c8:	00050493          	mv	s1,a0
    800051cc:	00058913          	mv	s2,a1
    800051d0:	0015879b          	addiw	a5,a1,1
    800051d4:	0007851b          	sext.w	a0,a5
    800051d8:	00f4a023          	sw	a5,0(s1)
    800051dc:	0004a823          	sw	zero,16(s1)
    800051e0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800051e4:	00251513          	slli	a0,a0,0x2
    800051e8:	ffffc097          	auipc	ra,0xffffc
    800051ec:	194080e7          	jalr	404(ra) # 8000137c <_Z9mem_allocm>
    800051f0:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800051f4:	01000513          	li	a0,16
    800051f8:	ffffd097          	auipc	ra,0xffffd
    800051fc:	a0c080e7          	jalr	-1524(ra) # 80001c04 <_Znwm>
    80005200:	00050993          	mv	s3,a0
    80005204:	00000593          	li	a1,0
    80005208:	ffffd097          	auipc	ra,0xffffd
    8000520c:	c80080e7          	jalr	-896(ra) # 80001e88 <_ZN9SemaphoreC1Ej>
    80005210:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005214:	01000513          	li	a0,16
    80005218:	ffffd097          	auipc	ra,0xffffd
    8000521c:	9ec080e7          	jalr	-1556(ra) # 80001c04 <_Znwm>
    80005220:	00050993          	mv	s3,a0
    80005224:	00090593          	mv	a1,s2
    80005228:	ffffd097          	auipc	ra,0xffffd
    8000522c:	c60080e7          	jalr	-928(ra) # 80001e88 <_ZN9SemaphoreC1Ej>
    80005230:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005234:	01000513          	li	a0,16
    80005238:	ffffd097          	auipc	ra,0xffffd
    8000523c:	9cc080e7          	jalr	-1588(ra) # 80001c04 <_Znwm>
    80005240:	00050913          	mv	s2,a0
    80005244:	00100593          	li	a1,1
    80005248:	ffffd097          	auipc	ra,0xffffd
    8000524c:	c40080e7          	jalr	-960(ra) # 80001e88 <_ZN9SemaphoreC1Ej>
    80005250:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005254:	01000513          	li	a0,16
    80005258:	ffffd097          	auipc	ra,0xffffd
    8000525c:	9ac080e7          	jalr	-1620(ra) # 80001c04 <_Znwm>
    80005260:	00050913          	mv	s2,a0
    80005264:	00100593          	li	a1,1
    80005268:	ffffd097          	auipc	ra,0xffffd
    8000526c:	c20080e7          	jalr	-992(ra) # 80001e88 <_ZN9SemaphoreC1Ej>
    80005270:	0324b823          	sd	s2,48(s1)
}
    80005274:	02813083          	ld	ra,40(sp)
    80005278:	02013403          	ld	s0,32(sp)
    8000527c:	01813483          	ld	s1,24(sp)
    80005280:	01013903          	ld	s2,16(sp)
    80005284:	00813983          	ld	s3,8(sp)
    80005288:	03010113          	addi	sp,sp,48
    8000528c:	00008067          	ret
    80005290:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005294:	00098513          	mv	a0,s3
    80005298:	ffffd097          	auipc	ra,0xffffd
    8000529c:	994080e7          	jalr	-1644(ra) # 80001c2c <_ZdlPv>
    800052a0:	00048513          	mv	a0,s1
    800052a4:	00007097          	auipc	ra,0x7
    800052a8:	584080e7          	jalr	1412(ra) # 8000c828 <_Unwind_Resume>
    800052ac:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800052b0:	00098513          	mv	a0,s3
    800052b4:	ffffd097          	auipc	ra,0xffffd
    800052b8:	978080e7          	jalr	-1672(ra) # 80001c2c <_ZdlPv>
    800052bc:	00048513          	mv	a0,s1
    800052c0:	00007097          	auipc	ra,0x7
    800052c4:	568080e7          	jalr	1384(ra) # 8000c828 <_Unwind_Resume>
    800052c8:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800052cc:	00090513          	mv	a0,s2
    800052d0:	ffffd097          	auipc	ra,0xffffd
    800052d4:	95c080e7          	jalr	-1700(ra) # 80001c2c <_ZdlPv>
    800052d8:	00048513          	mv	a0,s1
    800052dc:	00007097          	auipc	ra,0x7
    800052e0:	54c080e7          	jalr	1356(ra) # 8000c828 <_Unwind_Resume>
    800052e4:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800052e8:	00090513          	mv	a0,s2
    800052ec:	ffffd097          	auipc	ra,0xffffd
    800052f0:	940080e7          	jalr	-1728(ra) # 80001c2c <_ZdlPv>
    800052f4:	00048513          	mv	a0,s1
    800052f8:	00007097          	auipc	ra,0x7
    800052fc:	530080e7          	jalr	1328(ra) # 8000c828 <_Unwind_Resume>

0000000080005300 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005300:	fe010113          	addi	sp,sp,-32
    80005304:	00113c23          	sd	ra,24(sp)
    80005308:	00813823          	sd	s0,16(sp)
    8000530c:	00913423          	sd	s1,8(sp)
    80005310:	01213023          	sd	s2,0(sp)
    80005314:	02010413          	addi	s0,sp,32
    80005318:	00050493          	mv	s1,a0
    8000531c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005320:	01853503          	ld	a0,24(a0)
    80005324:	ffffd097          	auipc	ra,0xffffd
    80005328:	ba0080e7          	jalr	-1120(ra) # 80001ec4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    8000532c:	0304b503          	ld	a0,48(s1)
    80005330:	ffffd097          	auipc	ra,0xffffd
    80005334:	b94080e7          	jalr	-1132(ra) # 80001ec4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005338:	0084b783          	ld	a5,8(s1)
    8000533c:	0144a703          	lw	a4,20(s1)
    80005340:	00271713          	slli	a4,a4,0x2
    80005344:	00e787b3          	add	a5,a5,a4
    80005348:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000534c:	0144a783          	lw	a5,20(s1)
    80005350:	0017879b          	addiw	a5,a5,1
    80005354:	0004a703          	lw	a4,0(s1)
    80005358:	02e7e7bb          	remw	a5,a5,a4
    8000535c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005360:	0304b503          	ld	a0,48(s1)
    80005364:	ffffd097          	auipc	ra,0xffffd
    80005368:	b8c080e7          	jalr	-1140(ra) # 80001ef0 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    8000536c:	0204b503          	ld	a0,32(s1)
    80005370:	ffffd097          	auipc	ra,0xffffd
    80005374:	b80080e7          	jalr	-1152(ra) # 80001ef0 <_ZN9Semaphore6signalEv>

}
    80005378:	01813083          	ld	ra,24(sp)
    8000537c:	01013403          	ld	s0,16(sp)
    80005380:	00813483          	ld	s1,8(sp)
    80005384:	00013903          	ld	s2,0(sp)
    80005388:	02010113          	addi	sp,sp,32
    8000538c:	00008067          	ret

0000000080005390 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005390:	fe010113          	addi	sp,sp,-32
    80005394:	00113c23          	sd	ra,24(sp)
    80005398:	00813823          	sd	s0,16(sp)
    8000539c:	00913423          	sd	s1,8(sp)
    800053a0:	01213023          	sd	s2,0(sp)
    800053a4:	02010413          	addi	s0,sp,32
    800053a8:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800053ac:	02053503          	ld	a0,32(a0)
    800053b0:	ffffd097          	auipc	ra,0xffffd
    800053b4:	b14080e7          	jalr	-1260(ra) # 80001ec4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800053b8:	0284b503          	ld	a0,40(s1)
    800053bc:	ffffd097          	auipc	ra,0xffffd
    800053c0:	b08080e7          	jalr	-1272(ra) # 80001ec4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800053c4:	0084b703          	ld	a4,8(s1)
    800053c8:	0104a783          	lw	a5,16(s1)
    800053cc:	00279693          	slli	a3,a5,0x2
    800053d0:	00d70733          	add	a4,a4,a3
    800053d4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800053d8:	0017879b          	addiw	a5,a5,1
    800053dc:	0004a703          	lw	a4,0(s1)
    800053e0:	02e7e7bb          	remw	a5,a5,a4
    800053e4:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800053e8:	0284b503          	ld	a0,40(s1)
    800053ec:	ffffd097          	auipc	ra,0xffffd
    800053f0:	b04080e7          	jalr	-1276(ra) # 80001ef0 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800053f4:	0184b503          	ld	a0,24(s1)
    800053f8:	ffffd097          	auipc	ra,0xffffd
    800053fc:	af8080e7          	jalr	-1288(ra) # 80001ef0 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005400:	00090513          	mv	a0,s2
    80005404:	01813083          	ld	ra,24(sp)
    80005408:	01013403          	ld	s0,16(sp)
    8000540c:	00813483          	ld	s1,8(sp)
    80005410:	00013903          	ld	s2,0(sp)
    80005414:	02010113          	addi	sp,sp,32
    80005418:	00008067          	ret

000000008000541c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    8000541c:	fe010113          	addi	sp,sp,-32
    80005420:	00113c23          	sd	ra,24(sp)
    80005424:	00813823          	sd	s0,16(sp)
    80005428:	00913423          	sd	s1,8(sp)
    8000542c:	01213023          	sd	s2,0(sp)
    80005430:	02010413          	addi	s0,sp,32
    80005434:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005438:	02853503          	ld	a0,40(a0)
    8000543c:	ffffd097          	auipc	ra,0xffffd
    80005440:	a88080e7          	jalr	-1400(ra) # 80001ec4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005444:	0304b503          	ld	a0,48(s1)
    80005448:	ffffd097          	auipc	ra,0xffffd
    8000544c:	a7c080e7          	jalr	-1412(ra) # 80001ec4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005450:	0144a783          	lw	a5,20(s1)
    80005454:	0104a903          	lw	s2,16(s1)
    80005458:	0327ce63          	blt	a5,s2,80005494 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    8000545c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005460:	0304b503          	ld	a0,48(s1)
    80005464:	ffffd097          	auipc	ra,0xffffd
    80005468:	a8c080e7          	jalr	-1396(ra) # 80001ef0 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    8000546c:	0284b503          	ld	a0,40(s1)
    80005470:	ffffd097          	auipc	ra,0xffffd
    80005474:	a80080e7          	jalr	-1408(ra) # 80001ef0 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005478:	00090513          	mv	a0,s2
    8000547c:	01813083          	ld	ra,24(sp)
    80005480:	01013403          	ld	s0,16(sp)
    80005484:	00813483          	ld	s1,8(sp)
    80005488:	00013903          	ld	s2,0(sp)
    8000548c:	02010113          	addi	sp,sp,32
    80005490:	00008067          	ret
        ret = cap - head + tail;
    80005494:	0004a703          	lw	a4,0(s1)
    80005498:	4127093b          	subw	s2,a4,s2
    8000549c:	00f9093b          	addw	s2,s2,a5
    800054a0:	fc1ff06f          	j	80005460 <_ZN9BufferCPP6getCntEv+0x44>

00000000800054a4 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800054a4:	fe010113          	addi	sp,sp,-32
    800054a8:	00113c23          	sd	ra,24(sp)
    800054ac:	00813823          	sd	s0,16(sp)
    800054b0:	00913423          	sd	s1,8(sp)
    800054b4:	02010413          	addi	s0,sp,32
    800054b8:	00050493          	mv	s1,a0
    Console::putc('\n');
    800054bc:	00a00513          	li	a0,10
    800054c0:	ffffd097          	auipc	ra,0xffffd
    800054c4:	a84080e7          	jalr	-1404(ra) # 80001f44 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800054c8:	00004517          	auipc	a0,0x4
    800054cc:	15850513          	addi	a0,a0,344 # 80009620 <CONSOLE_STATUS+0x610>
    800054d0:	00000097          	auipc	ra,0x0
    800054d4:	a0c080e7          	jalr	-1524(ra) # 80004edc <_Z11printStringPKc>
    while (getCnt()) {
    800054d8:	00048513          	mv	a0,s1
    800054dc:	00000097          	auipc	ra,0x0
    800054e0:	f40080e7          	jalr	-192(ra) # 8000541c <_ZN9BufferCPP6getCntEv>
    800054e4:	02050c63          	beqz	a0,8000551c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800054e8:	0084b783          	ld	a5,8(s1)
    800054ec:	0104a703          	lw	a4,16(s1)
    800054f0:	00271713          	slli	a4,a4,0x2
    800054f4:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800054f8:	0007c503          	lbu	a0,0(a5)
    800054fc:	ffffd097          	auipc	ra,0xffffd
    80005500:	a48080e7          	jalr	-1464(ra) # 80001f44 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005504:	0104a783          	lw	a5,16(s1)
    80005508:	0017879b          	addiw	a5,a5,1
    8000550c:	0004a703          	lw	a4,0(s1)
    80005510:	02e7e7bb          	remw	a5,a5,a4
    80005514:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005518:	fc1ff06f          	j	800054d8 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    8000551c:	02100513          	li	a0,33
    80005520:	ffffd097          	auipc	ra,0xffffd
    80005524:	a24080e7          	jalr	-1500(ra) # 80001f44 <_ZN7Console4putcEc>
    Console::putc('\n');
    80005528:	00a00513          	li	a0,10
    8000552c:	ffffd097          	auipc	ra,0xffffd
    80005530:	a18080e7          	jalr	-1512(ra) # 80001f44 <_ZN7Console4putcEc>
    mem_free(buffer);
    80005534:	0084b503          	ld	a0,8(s1)
    80005538:	ffffc097          	auipc	ra,0xffffc
    8000553c:	e90080e7          	jalr	-368(ra) # 800013c8 <_Z8mem_freePv>
    delete itemAvailable;
    80005540:	0204b503          	ld	a0,32(s1)
    80005544:	00050863          	beqz	a0,80005554 <_ZN9BufferCPPD1Ev+0xb0>
    80005548:	00053783          	ld	a5,0(a0)
    8000554c:	0087b783          	ld	a5,8(a5)
    80005550:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005554:	0184b503          	ld	a0,24(s1)
    80005558:	00050863          	beqz	a0,80005568 <_ZN9BufferCPPD1Ev+0xc4>
    8000555c:	00053783          	ld	a5,0(a0)
    80005560:	0087b783          	ld	a5,8(a5)
    80005564:	000780e7          	jalr	a5
    delete mutexTail;
    80005568:	0304b503          	ld	a0,48(s1)
    8000556c:	00050863          	beqz	a0,8000557c <_ZN9BufferCPPD1Ev+0xd8>
    80005570:	00053783          	ld	a5,0(a0)
    80005574:	0087b783          	ld	a5,8(a5)
    80005578:	000780e7          	jalr	a5
    delete mutexHead;
    8000557c:	0284b503          	ld	a0,40(s1)
    80005580:	00050863          	beqz	a0,80005590 <_ZN9BufferCPPD1Ev+0xec>
    80005584:	00053783          	ld	a5,0(a0)
    80005588:	0087b783          	ld	a5,8(a5)
    8000558c:	000780e7          	jalr	a5
}
    80005590:	01813083          	ld	ra,24(sp)
    80005594:	01013403          	ld	s0,16(sp)
    80005598:	00813483          	ld	s1,8(sp)
    8000559c:	02010113          	addi	sp,sp,32
    800055a0:	00008067          	ret

00000000800055a4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800055a4:	fe010113          	addi	sp,sp,-32
    800055a8:	00113c23          	sd	ra,24(sp)
    800055ac:	00813823          	sd	s0,16(sp)
    800055b0:	00913423          	sd	s1,8(sp)
    800055b4:	01213023          	sd	s2,0(sp)
    800055b8:	02010413          	addi	s0,sp,32
    800055bc:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800055c0:	00100793          	li	a5,1
    800055c4:	02a7f863          	bgeu	a5,a0,800055f4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800055c8:	00a00793          	li	a5,10
    800055cc:	02f577b3          	remu	a5,a0,a5
    800055d0:	02078e63          	beqz	a5,8000560c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800055d4:	fff48513          	addi	a0,s1,-1
    800055d8:	00000097          	auipc	ra,0x0
    800055dc:	fcc080e7          	jalr	-52(ra) # 800055a4 <_ZL9fibonaccim>
    800055e0:	00050913          	mv	s2,a0
    800055e4:	ffe48513          	addi	a0,s1,-2
    800055e8:	00000097          	auipc	ra,0x0
    800055ec:	fbc080e7          	jalr	-68(ra) # 800055a4 <_ZL9fibonaccim>
    800055f0:	00a90533          	add	a0,s2,a0
}
    800055f4:	01813083          	ld	ra,24(sp)
    800055f8:	01013403          	ld	s0,16(sp)
    800055fc:	00813483          	ld	s1,8(sp)
    80005600:	00013903          	ld	s2,0(sp)
    80005604:	02010113          	addi	sp,sp,32
    80005608:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000560c:	ffffc097          	auipc	ra,0xffffc
    80005610:	eb8080e7          	jalr	-328(ra) # 800014c4 <_Z15thread_dispatchv>
    80005614:	fc1ff06f          	j	800055d4 <_ZL9fibonaccim+0x30>

0000000080005618 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005618:	fe010113          	addi	sp,sp,-32
    8000561c:	00113c23          	sd	ra,24(sp)
    80005620:	00813823          	sd	s0,16(sp)
    80005624:	00913423          	sd	s1,8(sp)
    80005628:	01213023          	sd	s2,0(sp)
    8000562c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005630:	00a00493          	li	s1,10
    80005634:	0400006f          	j	80005674 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005638:	00004517          	auipc	a0,0x4
    8000563c:	f5050513          	addi	a0,a0,-176 # 80009588 <CONSOLE_STATUS+0x578>
    80005640:	00000097          	auipc	ra,0x0
    80005644:	89c080e7          	jalr	-1892(ra) # 80004edc <_Z11printStringPKc>
    80005648:	00000613          	li	a2,0
    8000564c:	00a00593          	li	a1,10
    80005650:	00048513          	mv	a0,s1
    80005654:	00000097          	auipc	ra,0x0
    80005658:	a38080e7          	jalr	-1480(ra) # 8000508c <_Z8printIntiii>
    8000565c:	00004517          	auipc	a0,0x4
    80005660:	bb450513          	addi	a0,a0,-1100 # 80009210 <CONSOLE_STATUS+0x200>
    80005664:	00000097          	auipc	ra,0x0
    80005668:	878080e7          	jalr	-1928(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000566c:	0014849b          	addiw	s1,s1,1
    80005670:	0ff4f493          	andi	s1,s1,255
    80005674:	00c00793          	li	a5,12
    80005678:	fc97f0e3          	bgeu	a5,s1,80005638 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000567c:	00004517          	auipc	a0,0x4
    80005680:	f1450513          	addi	a0,a0,-236 # 80009590 <CONSOLE_STATUS+0x580>
    80005684:	00000097          	auipc	ra,0x0
    80005688:	858080e7          	jalr	-1960(ra) # 80004edc <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000568c:	00500313          	li	t1,5
    thread_dispatch();
    80005690:	ffffc097          	auipc	ra,0xffffc
    80005694:	e34080e7          	jalr	-460(ra) # 800014c4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005698:	01000513          	li	a0,16
    8000569c:	00000097          	auipc	ra,0x0
    800056a0:	f08080e7          	jalr	-248(ra) # 800055a4 <_ZL9fibonaccim>
    800056a4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800056a8:	00004517          	auipc	a0,0x4
    800056ac:	ef850513          	addi	a0,a0,-264 # 800095a0 <CONSOLE_STATUS+0x590>
    800056b0:	00000097          	auipc	ra,0x0
    800056b4:	82c080e7          	jalr	-2004(ra) # 80004edc <_Z11printStringPKc>
    800056b8:	00000613          	li	a2,0
    800056bc:	00a00593          	li	a1,10
    800056c0:	0009051b          	sext.w	a0,s2
    800056c4:	00000097          	auipc	ra,0x0
    800056c8:	9c8080e7          	jalr	-1592(ra) # 8000508c <_Z8printIntiii>
    800056cc:	00004517          	auipc	a0,0x4
    800056d0:	b4450513          	addi	a0,a0,-1212 # 80009210 <CONSOLE_STATUS+0x200>
    800056d4:	00000097          	auipc	ra,0x0
    800056d8:	808080e7          	jalr	-2040(ra) # 80004edc <_Z11printStringPKc>
    800056dc:	0400006f          	j	8000571c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800056e0:	00004517          	auipc	a0,0x4
    800056e4:	ea850513          	addi	a0,a0,-344 # 80009588 <CONSOLE_STATUS+0x578>
    800056e8:	fffff097          	auipc	ra,0xfffff
    800056ec:	7f4080e7          	jalr	2036(ra) # 80004edc <_Z11printStringPKc>
    800056f0:	00000613          	li	a2,0
    800056f4:	00a00593          	li	a1,10
    800056f8:	00048513          	mv	a0,s1
    800056fc:	00000097          	auipc	ra,0x0
    80005700:	990080e7          	jalr	-1648(ra) # 8000508c <_Z8printIntiii>
    80005704:	00004517          	auipc	a0,0x4
    80005708:	b0c50513          	addi	a0,a0,-1268 # 80009210 <CONSOLE_STATUS+0x200>
    8000570c:	fffff097          	auipc	ra,0xfffff
    80005710:	7d0080e7          	jalr	2000(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005714:	0014849b          	addiw	s1,s1,1
    80005718:	0ff4f493          	andi	s1,s1,255
    8000571c:	00f00793          	li	a5,15
    80005720:	fc97f0e3          	bgeu	a5,s1,800056e0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005724:	00004517          	auipc	a0,0x4
    80005728:	e8c50513          	addi	a0,a0,-372 # 800095b0 <CONSOLE_STATUS+0x5a0>
    8000572c:	fffff097          	auipc	ra,0xfffff
    80005730:	7b0080e7          	jalr	1968(ra) # 80004edc <_Z11printStringPKc>
    finishedD = true;
    80005734:	00100793          	li	a5,1
    80005738:	00006717          	auipc	a4,0x6
    8000573c:	00f70c23          	sb	a5,24(a4) # 8000b750 <_ZL9finishedD>
    thread_dispatch();
    80005740:	ffffc097          	auipc	ra,0xffffc
    80005744:	d84080e7          	jalr	-636(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80005748:	01813083          	ld	ra,24(sp)
    8000574c:	01013403          	ld	s0,16(sp)
    80005750:	00813483          	ld	s1,8(sp)
    80005754:	00013903          	ld	s2,0(sp)
    80005758:	02010113          	addi	sp,sp,32
    8000575c:	00008067          	ret

0000000080005760 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005760:	fe010113          	addi	sp,sp,-32
    80005764:	00113c23          	sd	ra,24(sp)
    80005768:	00813823          	sd	s0,16(sp)
    8000576c:	00913423          	sd	s1,8(sp)
    80005770:	01213023          	sd	s2,0(sp)
    80005774:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005778:	00000493          	li	s1,0
    8000577c:	0400006f          	j	800057bc <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005780:	00004517          	auipc	a0,0x4
    80005784:	dd850513          	addi	a0,a0,-552 # 80009558 <CONSOLE_STATUS+0x548>
    80005788:	fffff097          	auipc	ra,0xfffff
    8000578c:	754080e7          	jalr	1876(ra) # 80004edc <_Z11printStringPKc>
    80005790:	00000613          	li	a2,0
    80005794:	00a00593          	li	a1,10
    80005798:	00048513          	mv	a0,s1
    8000579c:	00000097          	auipc	ra,0x0
    800057a0:	8f0080e7          	jalr	-1808(ra) # 8000508c <_Z8printIntiii>
    800057a4:	00004517          	auipc	a0,0x4
    800057a8:	a6c50513          	addi	a0,a0,-1428 # 80009210 <CONSOLE_STATUS+0x200>
    800057ac:	fffff097          	auipc	ra,0xfffff
    800057b0:	730080e7          	jalr	1840(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 3; i++) {
    800057b4:	0014849b          	addiw	s1,s1,1
    800057b8:	0ff4f493          	andi	s1,s1,255
    800057bc:	00200793          	li	a5,2
    800057c0:	fc97f0e3          	bgeu	a5,s1,80005780 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800057c4:	00004517          	auipc	a0,0x4
    800057c8:	d9c50513          	addi	a0,a0,-612 # 80009560 <CONSOLE_STATUS+0x550>
    800057cc:	fffff097          	auipc	ra,0xfffff
    800057d0:	710080e7          	jalr	1808(ra) # 80004edc <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800057d4:	00700313          	li	t1,7
    thread_dispatch();
    800057d8:	ffffc097          	auipc	ra,0xffffc
    800057dc:	cec080e7          	jalr	-788(ra) # 800014c4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800057e0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800057e4:	00004517          	auipc	a0,0x4
    800057e8:	d8c50513          	addi	a0,a0,-628 # 80009570 <CONSOLE_STATUS+0x560>
    800057ec:	fffff097          	auipc	ra,0xfffff
    800057f0:	6f0080e7          	jalr	1776(ra) # 80004edc <_Z11printStringPKc>
    800057f4:	00000613          	li	a2,0
    800057f8:	00a00593          	li	a1,10
    800057fc:	0009051b          	sext.w	a0,s2
    80005800:	00000097          	auipc	ra,0x0
    80005804:	88c080e7          	jalr	-1908(ra) # 8000508c <_Z8printIntiii>
    80005808:	00004517          	auipc	a0,0x4
    8000580c:	a0850513          	addi	a0,a0,-1528 # 80009210 <CONSOLE_STATUS+0x200>
    80005810:	fffff097          	auipc	ra,0xfffff
    80005814:	6cc080e7          	jalr	1740(ra) # 80004edc <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005818:	00c00513          	li	a0,12
    8000581c:	00000097          	auipc	ra,0x0
    80005820:	d88080e7          	jalr	-632(ra) # 800055a4 <_ZL9fibonaccim>
    80005824:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005828:	00004517          	auipc	a0,0x4
    8000582c:	d5050513          	addi	a0,a0,-688 # 80009578 <CONSOLE_STATUS+0x568>
    80005830:	fffff097          	auipc	ra,0xfffff
    80005834:	6ac080e7          	jalr	1708(ra) # 80004edc <_Z11printStringPKc>
    80005838:	00000613          	li	a2,0
    8000583c:	00a00593          	li	a1,10
    80005840:	0009051b          	sext.w	a0,s2
    80005844:	00000097          	auipc	ra,0x0
    80005848:	848080e7          	jalr	-1976(ra) # 8000508c <_Z8printIntiii>
    8000584c:	00004517          	auipc	a0,0x4
    80005850:	9c450513          	addi	a0,a0,-1596 # 80009210 <CONSOLE_STATUS+0x200>
    80005854:	fffff097          	auipc	ra,0xfffff
    80005858:	688080e7          	jalr	1672(ra) # 80004edc <_Z11printStringPKc>
    8000585c:	0400006f          	j	8000589c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005860:	00004517          	auipc	a0,0x4
    80005864:	cf850513          	addi	a0,a0,-776 # 80009558 <CONSOLE_STATUS+0x548>
    80005868:	fffff097          	auipc	ra,0xfffff
    8000586c:	674080e7          	jalr	1652(ra) # 80004edc <_Z11printStringPKc>
    80005870:	00000613          	li	a2,0
    80005874:	00a00593          	li	a1,10
    80005878:	00048513          	mv	a0,s1
    8000587c:	00000097          	auipc	ra,0x0
    80005880:	810080e7          	jalr	-2032(ra) # 8000508c <_Z8printIntiii>
    80005884:	00004517          	auipc	a0,0x4
    80005888:	98c50513          	addi	a0,a0,-1652 # 80009210 <CONSOLE_STATUS+0x200>
    8000588c:	fffff097          	auipc	ra,0xfffff
    80005890:	650080e7          	jalr	1616(ra) # 80004edc <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005894:	0014849b          	addiw	s1,s1,1
    80005898:	0ff4f493          	andi	s1,s1,255
    8000589c:	00500793          	li	a5,5
    800058a0:	fc97f0e3          	bgeu	a5,s1,80005860 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800058a4:	00004517          	auipc	a0,0x4
    800058a8:	c8c50513          	addi	a0,a0,-884 # 80009530 <CONSOLE_STATUS+0x520>
    800058ac:	fffff097          	auipc	ra,0xfffff
    800058b0:	630080e7          	jalr	1584(ra) # 80004edc <_Z11printStringPKc>
    finishedC = true;
    800058b4:	00100793          	li	a5,1
    800058b8:	00006717          	auipc	a4,0x6
    800058bc:	e8f70ca3          	sb	a5,-359(a4) # 8000b751 <_ZL9finishedC>
    thread_dispatch();
    800058c0:	ffffc097          	auipc	ra,0xffffc
    800058c4:	c04080e7          	jalr	-1020(ra) # 800014c4 <_Z15thread_dispatchv>
}
    800058c8:	01813083          	ld	ra,24(sp)
    800058cc:	01013403          	ld	s0,16(sp)
    800058d0:	00813483          	ld	s1,8(sp)
    800058d4:	00013903          	ld	s2,0(sp)
    800058d8:	02010113          	addi	sp,sp,32
    800058dc:	00008067          	ret

00000000800058e0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800058e0:	fe010113          	addi	sp,sp,-32
    800058e4:	00113c23          	sd	ra,24(sp)
    800058e8:	00813823          	sd	s0,16(sp)
    800058ec:	00913423          	sd	s1,8(sp)
    800058f0:	01213023          	sd	s2,0(sp)
    800058f4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800058f8:	00000913          	li	s2,0
    800058fc:	0400006f          	j	8000593c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80005900:	ffffc097          	auipc	ra,0xffffc
    80005904:	bc4080e7          	jalr	-1084(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005908:	00148493          	addi	s1,s1,1
    8000590c:	000027b7          	lui	a5,0x2
    80005910:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005914:	0097ee63          	bltu	a5,s1,80005930 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005918:	00000713          	li	a4,0
    8000591c:	000077b7          	lui	a5,0x7
    80005920:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005924:	fce7eee3          	bltu	a5,a4,80005900 <_ZL11workerBodyBPv+0x20>
    80005928:	00170713          	addi	a4,a4,1
    8000592c:	ff1ff06f          	j	8000591c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80005930:	00a00793          	li	a5,10
    80005934:	04f90663          	beq	s2,a5,80005980 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80005938:	00190913          	addi	s2,s2,1
    8000593c:	00f00793          	li	a5,15
    80005940:	0527e463          	bltu	a5,s2,80005988 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80005944:	00004517          	auipc	a0,0x4
    80005948:	bfc50513          	addi	a0,a0,-1028 # 80009540 <CONSOLE_STATUS+0x530>
    8000594c:	fffff097          	auipc	ra,0xfffff
    80005950:	590080e7          	jalr	1424(ra) # 80004edc <_Z11printStringPKc>
    80005954:	00000613          	li	a2,0
    80005958:	00a00593          	li	a1,10
    8000595c:	0009051b          	sext.w	a0,s2
    80005960:	fffff097          	auipc	ra,0xfffff
    80005964:	72c080e7          	jalr	1836(ra) # 8000508c <_Z8printIntiii>
    80005968:	00004517          	auipc	a0,0x4
    8000596c:	8a850513          	addi	a0,a0,-1880 # 80009210 <CONSOLE_STATUS+0x200>
    80005970:	fffff097          	auipc	ra,0xfffff
    80005974:	56c080e7          	jalr	1388(ra) # 80004edc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005978:	00000493          	li	s1,0
    8000597c:	f91ff06f          	j	8000590c <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80005980:	14102ff3          	csrr	t6,sepc
    80005984:	fb5ff06f          	j	80005938 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80005988:	00004517          	auipc	a0,0x4
    8000598c:	bc050513          	addi	a0,a0,-1088 # 80009548 <CONSOLE_STATUS+0x538>
    80005990:	fffff097          	auipc	ra,0xfffff
    80005994:	54c080e7          	jalr	1356(ra) # 80004edc <_Z11printStringPKc>
    finishedB = true;
    80005998:	00100793          	li	a5,1
    8000599c:	00006717          	auipc	a4,0x6
    800059a0:	daf70b23          	sb	a5,-586(a4) # 8000b752 <_ZL9finishedB>
    thread_dispatch();
    800059a4:	ffffc097          	auipc	ra,0xffffc
    800059a8:	b20080e7          	jalr	-1248(ra) # 800014c4 <_Z15thread_dispatchv>
}
    800059ac:	01813083          	ld	ra,24(sp)
    800059b0:	01013403          	ld	s0,16(sp)
    800059b4:	00813483          	ld	s1,8(sp)
    800059b8:	00013903          	ld	s2,0(sp)
    800059bc:	02010113          	addi	sp,sp,32
    800059c0:	00008067          	ret

00000000800059c4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800059c4:	fe010113          	addi	sp,sp,-32
    800059c8:	00113c23          	sd	ra,24(sp)
    800059cc:	00813823          	sd	s0,16(sp)
    800059d0:	00913423          	sd	s1,8(sp)
    800059d4:	01213023          	sd	s2,0(sp)
    800059d8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800059dc:	00000913          	li	s2,0
    800059e0:	0380006f          	j	80005a18 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800059e4:	ffffc097          	auipc	ra,0xffffc
    800059e8:	ae0080e7          	jalr	-1312(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800059ec:	00148493          	addi	s1,s1,1
    800059f0:	000027b7          	lui	a5,0x2
    800059f4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800059f8:	0097ee63          	bltu	a5,s1,80005a14 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800059fc:	00000713          	li	a4,0
    80005a00:	000077b7          	lui	a5,0x7
    80005a04:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005a08:	fce7eee3          	bltu	a5,a4,800059e4 <_ZL11workerBodyAPv+0x20>
    80005a0c:	00170713          	addi	a4,a4,1
    80005a10:	ff1ff06f          	j	80005a00 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005a14:	00190913          	addi	s2,s2,1
    80005a18:	00900793          	li	a5,9
    80005a1c:	0527e063          	bltu	a5,s2,80005a5c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005a20:	00004517          	auipc	a0,0x4
    80005a24:	b0850513          	addi	a0,a0,-1272 # 80009528 <CONSOLE_STATUS+0x518>
    80005a28:	fffff097          	auipc	ra,0xfffff
    80005a2c:	4b4080e7          	jalr	1204(ra) # 80004edc <_Z11printStringPKc>
    80005a30:	00000613          	li	a2,0
    80005a34:	00a00593          	li	a1,10
    80005a38:	0009051b          	sext.w	a0,s2
    80005a3c:	fffff097          	auipc	ra,0xfffff
    80005a40:	650080e7          	jalr	1616(ra) # 8000508c <_Z8printIntiii>
    80005a44:	00003517          	auipc	a0,0x3
    80005a48:	7cc50513          	addi	a0,a0,1996 # 80009210 <CONSOLE_STATUS+0x200>
    80005a4c:	fffff097          	auipc	ra,0xfffff
    80005a50:	490080e7          	jalr	1168(ra) # 80004edc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005a54:	00000493          	li	s1,0
    80005a58:	f99ff06f          	j	800059f0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005a5c:	00004517          	auipc	a0,0x4
    80005a60:	ad450513          	addi	a0,a0,-1324 # 80009530 <CONSOLE_STATUS+0x520>
    80005a64:	fffff097          	auipc	ra,0xfffff
    80005a68:	478080e7          	jalr	1144(ra) # 80004edc <_Z11printStringPKc>
    finishedA = true;
    80005a6c:	00100793          	li	a5,1
    80005a70:	00006717          	auipc	a4,0x6
    80005a74:	cef701a3          	sb	a5,-797(a4) # 8000b753 <_ZL9finishedA>
}
    80005a78:	01813083          	ld	ra,24(sp)
    80005a7c:	01013403          	ld	s0,16(sp)
    80005a80:	00813483          	ld	s1,8(sp)
    80005a84:	00013903          	ld	s2,0(sp)
    80005a88:	02010113          	addi	sp,sp,32
    80005a8c:	00008067          	ret

0000000080005a90 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80005a90:	fd010113          	addi	sp,sp,-48
    80005a94:	02113423          	sd	ra,40(sp)
    80005a98:	02813023          	sd	s0,32(sp)
    80005a9c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005aa0:	00000613          	li	a2,0
    80005aa4:	00000597          	auipc	a1,0x0
    80005aa8:	f2058593          	addi	a1,a1,-224 # 800059c4 <_ZL11workerBodyAPv>
    80005aac:	fd040513          	addi	a0,s0,-48
    80005ab0:	ffffc097          	auipc	ra,0xffffc
    80005ab4:	94c080e7          	jalr	-1716(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005ab8:	00004517          	auipc	a0,0x4
    80005abc:	b0850513          	addi	a0,a0,-1272 # 800095c0 <CONSOLE_STATUS+0x5b0>
    80005ac0:	fffff097          	auipc	ra,0xfffff
    80005ac4:	41c080e7          	jalr	1052(ra) # 80004edc <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005ac8:	00000613          	li	a2,0
    80005acc:	00000597          	auipc	a1,0x0
    80005ad0:	e1458593          	addi	a1,a1,-492 # 800058e0 <_ZL11workerBodyBPv>
    80005ad4:	fd840513          	addi	a0,s0,-40
    80005ad8:	ffffc097          	auipc	ra,0xffffc
    80005adc:	924080e7          	jalr	-1756(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005ae0:	00004517          	auipc	a0,0x4
    80005ae4:	af850513          	addi	a0,a0,-1288 # 800095d8 <CONSOLE_STATUS+0x5c8>
    80005ae8:	fffff097          	auipc	ra,0xfffff
    80005aec:	3f4080e7          	jalr	1012(ra) # 80004edc <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005af0:	00000613          	li	a2,0
    80005af4:	00000597          	auipc	a1,0x0
    80005af8:	c6c58593          	addi	a1,a1,-916 # 80005760 <_ZL11workerBodyCPv>
    80005afc:	fe040513          	addi	a0,s0,-32
    80005b00:	ffffc097          	auipc	ra,0xffffc
    80005b04:	8fc080e7          	jalr	-1796(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005b08:	00004517          	auipc	a0,0x4
    80005b0c:	ae850513          	addi	a0,a0,-1304 # 800095f0 <CONSOLE_STATUS+0x5e0>
    80005b10:	fffff097          	auipc	ra,0xfffff
    80005b14:	3cc080e7          	jalr	972(ra) # 80004edc <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005b18:	00000613          	li	a2,0
    80005b1c:	00000597          	auipc	a1,0x0
    80005b20:	afc58593          	addi	a1,a1,-1284 # 80005618 <_ZL11workerBodyDPv>
    80005b24:	fe840513          	addi	a0,s0,-24
    80005b28:	ffffc097          	auipc	ra,0xffffc
    80005b2c:	8d4080e7          	jalr	-1836(ra) # 800013fc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005b30:	00004517          	auipc	a0,0x4
    80005b34:	ad850513          	addi	a0,a0,-1320 # 80009608 <CONSOLE_STATUS+0x5f8>
    80005b38:	fffff097          	auipc	ra,0xfffff
    80005b3c:	3a4080e7          	jalr	932(ra) # 80004edc <_Z11printStringPKc>
    80005b40:	00c0006f          	j	80005b4c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005b44:	ffffc097          	auipc	ra,0xffffc
    80005b48:	980080e7          	jalr	-1664(ra) # 800014c4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005b4c:	00006797          	auipc	a5,0x6
    80005b50:	c077c783          	lbu	a5,-1017(a5) # 8000b753 <_ZL9finishedA>
    80005b54:	fe0788e3          	beqz	a5,80005b44 <_Z16System_Mode_testv+0xb4>
    80005b58:	00006797          	auipc	a5,0x6
    80005b5c:	bfa7c783          	lbu	a5,-1030(a5) # 8000b752 <_ZL9finishedB>
    80005b60:	fe0782e3          	beqz	a5,80005b44 <_Z16System_Mode_testv+0xb4>
    80005b64:	00006797          	auipc	a5,0x6
    80005b68:	bed7c783          	lbu	a5,-1043(a5) # 8000b751 <_ZL9finishedC>
    80005b6c:	fc078ce3          	beqz	a5,80005b44 <_Z16System_Mode_testv+0xb4>
    80005b70:	00006797          	auipc	a5,0x6
    80005b74:	be07c783          	lbu	a5,-1056(a5) # 8000b750 <_ZL9finishedD>
    80005b78:	fc0786e3          	beqz	a5,80005b44 <_Z16System_Mode_testv+0xb4>
    }

}
    80005b7c:	02813083          	ld	ra,40(sp)
    80005b80:	02013403          	ld	s0,32(sp)
    80005b84:	03010113          	addi	sp,sp,48
    80005b88:	00008067          	ret

0000000080005b8c <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005b8c:	fe010113          	addi	sp,sp,-32
    80005b90:	00113c23          	sd	ra,24(sp)
    80005b94:	00813823          	sd	s0,16(sp)
    80005b98:	00913423          	sd	s1,8(sp)
    80005b9c:	01213023          	sd	s2,0(sp)
    80005ba0:	02010413          	addi	s0,sp,32
    80005ba4:	00050493          	mv	s1,a0
    80005ba8:	00058913          	mv	s2,a1
    80005bac:	0015879b          	addiw	a5,a1,1
    80005bb0:	0007851b          	sext.w	a0,a5
    80005bb4:	00f4a023          	sw	a5,0(s1)
    80005bb8:	0004a823          	sw	zero,16(s1)
    80005bbc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005bc0:	00251513          	slli	a0,a0,0x2
    80005bc4:	ffffb097          	auipc	ra,0xffffb
    80005bc8:	7b8080e7          	jalr	1976(ra) # 8000137c <_Z9mem_allocm>
    80005bcc:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80005bd0:	00000593          	li	a1,0
    80005bd4:	02048513          	addi	a0,s1,32
    80005bd8:	ffffc097          	auipc	ra,0xffffc
    80005bdc:	938080e7          	jalr	-1736(ra) # 80001510 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80005be0:	00090593          	mv	a1,s2
    80005be4:	01848513          	addi	a0,s1,24
    80005be8:	ffffc097          	auipc	ra,0xffffc
    80005bec:	928080e7          	jalr	-1752(ra) # 80001510 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80005bf0:	00100593          	li	a1,1
    80005bf4:	02848513          	addi	a0,s1,40
    80005bf8:	ffffc097          	auipc	ra,0xffffc
    80005bfc:	918080e7          	jalr	-1768(ra) # 80001510 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80005c00:	00100593          	li	a1,1
    80005c04:	03048513          	addi	a0,s1,48
    80005c08:	ffffc097          	auipc	ra,0xffffc
    80005c0c:	908080e7          	jalr	-1784(ra) # 80001510 <_Z8sem_openPP4_semj>
}
    80005c10:	01813083          	ld	ra,24(sp)
    80005c14:	01013403          	ld	s0,16(sp)
    80005c18:	00813483          	ld	s1,8(sp)
    80005c1c:	00013903          	ld	s2,0(sp)
    80005c20:	02010113          	addi	sp,sp,32
    80005c24:	00008067          	ret

0000000080005c28 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80005c28:	fe010113          	addi	sp,sp,-32
    80005c2c:	00113c23          	sd	ra,24(sp)
    80005c30:	00813823          	sd	s0,16(sp)
    80005c34:	00913423          	sd	s1,8(sp)
    80005c38:	01213023          	sd	s2,0(sp)
    80005c3c:	02010413          	addi	s0,sp,32
    80005c40:	00050493          	mv	s1,a0
    80005c44:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80005c48:	01853503          	ld	a0,24(a0)
    80005c4c:	ffffc097          	auipc	ra,0xffffc
    80005c50:	930080e7          	jalr	-1744(ra) # 8000157c <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80005c54:	0304b503          	ld	a0,48(s1)
    80005c58:	ffffc097          	auipc	ra,0xffffc
    80005c5c:	924080e7          	jalr	-1756(ra) # 8000157c <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80005c60:	0084b783          	ld	a5,8(s1)
    80005c64:	0144a703          	lw	a4,20(s1)
    80005c68:	00271713          	slli	a4,a4,0x2
    80005c6c:	00e787b3          	add	a5,a5,a4
    80005c70:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005c74:	0144a783          	lw	a5,20(s1)
    80005c78:	0017879b          	addiw	a5,a5,1
    80005c7c:	0004a703          	lw	a4,0(s1)
    80005c80:	02e7e7bb          	remw	a5,a5,a4
    80005c84:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80005c88:	0304b503          	ld	a0,48(s1)
    80005c8c:	ffffc097          	auipc	ra,0xffffc
    80005c90:	924080e7          	jalr	-1756(ra) # 800015b0 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80005c94:	0204b503          	ld	a0,32(s1)
    80005c98:	ffffc097          	auipc	ra,0xffffc
    80005c9c:	918080e7          	jalr	-1768(ra) # 800015b0 <_Z10sem_signalP4_sem>

}
    80005ca0:	01813083          	ld	ra,24(sp)
    80005ca4:	01013403          	ld	s0,16(sp)
    80005ca8:	00813483          	ld	s1,8(sp)
    80005cac:	00013903          	ld	s2,0(sp)
    80005cb0:	02010113          	addi	sp,sp,32
    80005cb4:	00008067          	ret

0000000080005cb8 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80005cb8:	fe010113          	addi	sp,sp,-32
    80005cbc:	00113c23          	sd	ra,24(sp)
    80005cc0:	00813823          	sd	s0,16(sp)
    80005cc4:	00913423          	sd	s1,8(sp)
    80005cc8:	01213023          	sd	s2,0(sp)
    80005ccc:	02010413          	addi	s0,sp,32
    80005cd0:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80005cd4:	02053503          	ld	a0,32(a0)
    80005cd8:	ffffc097          	auipc	ra,0xffffc
    80005cdc:	8a4080e7          	jalr	-1884(ra) # 8000157c <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80005ce0:	0284b503          	ld	a0,40(s1)
    80005ce4:	ffffc097          	auipc	ra,0xffffc
    80005ce8:	898080e7          	jalr	-1896(ra) # 8000157c <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80005cec:	0084b703          	ld	a4,8(s1)
    80005cf0:	0104a783          	lw	a5,16(s1)
    80005cf4:	00279693          	slli	a3,a5,0x2
    80005cf8:	00d70733          	add	a4,a4,a3
    80005cfc:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005d00:	0017879b          	addiw	a5,a5,1
    80005d04:	0004a703          	lw	a4,0(s1)
    80005d08:	02e7e7bb          	remw	a5,a5,a4
    80005d0c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005d10:	0284b503          	ld	a0,40(s1)
    80005d14:	ffffc097          	auipc	ra,0xffffc
    80005d18:	89c080e7          	jalr	-1892(ra) # 800015b0 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80005d1c:	0184b503          	ld	a0,24(s1)
    80005d20:	ffffc097          	auipc	ra,0xffffc
    80005d24:	890080e7          	jalr	-1904(ra) # 800015b0 <_Z10sem_signalP4_sem>

    return ret;
}
    80005d28:	00090513          	mv	a0,s2
    80005d2c:	01813083          	ld	ra,24(sp)
    80005d30:	01013403          	ld	s0,16(sp)
    80005d34:	00813483          	ld	s1,8(sp)
    80005d38:	00013903          	ld	s2,0(sp)
    80005d3c:	02010113          	addi	sp,sp,32
    80005d40:	00008067          	ret

0000000080005d44 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80005d44:	fe010113          	addi	sp,sp,-32
    80005d48:	00113c23          	sd	ra,24(sp)
    80005d4c:	00813823          	sd	s0,16(sp)
    80005d50:	00913423          	sd	s1,8(sp)
    80005d54:	01213023          	sd	s2,0(sp)
    80005d58:	02010413          	addi	s0,sp,32
    80005d5c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80005d60:	02853503          	ld	a0,40(a0)
    80005d64:	ffffc097          	auipc	ra,0xffffc
    80005d68:	818080e7          	jalr	-2024(ra) # 8000157c <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80005d6c:	0304b503          	ld	a0,48(s1)
    80005d70:	ffffc097          	auipc	ra,0xffffc
    80005d74:	80c080e7          	jalr	-2036(ra) # 8000157c <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80005d78:	0144a783          	lw	a5,20(s1)
    80005d7c:	0104a903          	lw	s2,16(s1)
    80005d80:	0327ce63          	blt	a5,s2,80005dbc <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80005d84:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80005d88:	0304b503          	ld	a0,48(s1)
    80005d8c:	ffffc097          	auipc	ra,0xffffc
    80005d90:	824080e7          	jalr	-2012(ra) # 800015b0 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80005d94:	0284b503          	ld	a0,40(s1)
    80005d98:	ffffc097          	auipc	ra,0xffffc
    80005d9c:	818080e7          	jalr	-2024(ra) # 800015b0 <_Z10sem_signalP4_sem>

    return ret;
}
    80005da0:	00090513          	mv	a0,s2
    80005da4:	01813083          	ld	ra,24(sp)
    80005da8:	01013403          	ld	s0,16(sp)
    80005dac:	00813483          	ld	s1,8(sp)
    80005db0:	00013903          	ld	s2,0(sp)
    80005db4:	02010113          	addi	sp,sp,32
    80005db8:	00008067          	ret
        ret = cap - head + tail;
    80005dbc:	0004a703          	lw	a4,0(s1)
    80005dc0:	4127093b          	subw	s2,a4,s2
    80005dc4:	00f9093b          	addw	s2,s2,a5
    80005dc8:	fc1ff06f          	j	80005d88 <_ZN6Buffer6getCntEv+0x44>

0000000080005dcc <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80005dcc:	fe010113          	addi	sp,sp,-32
    80005dd0:	00113c23          	sd	ra,24(sp)
    80005dd4:	00813823          	sd	s0,16(sp)
    80005dd8:	00913423          	sd	s1,8(sp)
    80005ddc:	02010413          	addi	s0,sp,32
    80005de0:	00050493          	mv	s1,a0
    putc('\n');
    80005de4:	00a00513          	li	a0,10
    80005de8:	ffffc097          	auipc	ra,0xffffc
    80005dec:	830080e7          	jalr	-2000(ra) # 80001618 <_Z4putcc>
    printString("Buffer deleted!\n");
    80005df0:	00004517          	auipc	a0,0x4
    80005df4:	83050513          	addi	a0,a0,-2000 # 80009620 <CONSOLE_STATUS+0x610>
    80005df8:	fffff097          	auipc	ra,0xfffff
    80005dfc:	0e4080e7          	jalr	228(ra) # 80004edc <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005e00:	00048513          	mv	a0,s1
    80005e04:	00000097          	auipc	ra,0x0
    80005e08:	f40080e7          	jalr	-192(ra) # 80005d44 <_ZN6Buffer6getCntEv>
    80005e0c:	02a05c63          	blez	a0,80005e44 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005e10:	0084b783          	ld	a5,8(s1)
    80005e14:	0104a703          	lw	a4,16(s1)
    80005e18:	00271713          	slli	a4,a4,0x2
    80005e1c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80005e20:	0007c503          	lbu	a0,0(a5)
    80005e24:	ffffb097          	auipc	ra,0xffffb
    80005e28:	7f4080e7          	jalr	2036(ra) # 80001618 <_Z4putcc>
        head = (head + 1) % cap;
    80005e2c:	0104a783          	lw	a5,16(s1)
    80005e30:	0017879b          	addiw	a5,a5,1
    80005e34:	0004a703          	lw	a4,0(s1)
    80005e38:	02e7e7bb          	remw	a5,a5,a4
    80005e3c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80005e40:	fc1ff06f          	j	80005e00 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80005e44:	02100513          	li	a0,33
    80005e48:	ffffb097          	auipc	ra,0xffffb
    80005e4c:	7d0080e7          	jalr	2000(ra) # 80001618 <_Z4putcc>
    putc('\n');
    80005e50:	00a00513          	li	a0,10
    80005e54:	ffffb097          	auipc	ra,0xffffb
    80005e58:	7c4080e7          	jalr	1988(ra) # 80001618 <_Z4putcc>
    mem_free(buffer);
    80005e5c:	0084b503          	ld	a0,8(s1)
    80005e60:	ffffb097          	auipc	ra,0xffffb
    80005e64:	568080e7          	jalr	1384(ra) # 800013c8 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80005e68:	0204b503          	ld	a0,32(s1)
    80005e6c:	ffffb097          	auipc	ra,0xffffb
    80005e70:	6dc080e7          	jalr	1756(ra) # 80001548 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80005e74:	0184b503          	ld	a0,24(s1)
    80005e78:	ffffb097          	auipc	ra,0xffffb
    80005e7c:	6d0080e7          	jalr	1744(ra) # 80001548 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80005e80:	0304b503          	ld	a0,48(s1)
    80005e84:	ffffb097          	auipc	ra,0xffffb
    80005e88:	6c4080e7          	jalr	1732(ra) # 80001548 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80005e8c:	0284b503          	ld	a0,40(s1)
    80005e90:	ffffb097          	auipc	ra,0xffffb
    80005e94:	6b8080e7          	jalr	1720(ra) # 80001548 <_Z9sem_closeP4_sem>
}
    80005e98:	01813083          	ld	ra,24(sp)
    80005e9c:	01013403          	ld	s0,16(sp)
    80005ea0:	00813483          	ld	s1,8(sp)
    80005ea4:	02010113          	addi	sp,sp,32
    80005ea8:	00008067          	ret

0000000080005eac <start>:
    80005eac:	ff010113          	addi	sp,sp,-16
    80005eb0:	00813423          	sd	s0,8(sp)
    80005eb4:	01010413          	addi	s0,sp,16
    80005eb8:	300027f3          	csrr	a5,mstatus
    80005ebc:	ffffe737          	lui	a4,0xffffe
    80005ec0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1e3f>
    80005ec4:	00e7f7b3          	and	a5,a5,a4
    80005ec8:	00001737          	lui	a4,0x1
    80005ecc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80005ed0:	00e7e7b3          	or	a5,a5,a4
    80005ed4:	30079073          	csrw	mstatus,a5
    80005ed8:	00000797          	auipc	a5,0x0
    80005edc:	16078793          	addi	a5,a5,352 # 80006038 <system_main>
    80005ee0:	34179073          	csrw	mepc,a5
    80005ee4:	00000793          	li	a5,0
    80005ee8:	18079073          	csrw	satp,a5
    80005eec:	000107b7          	lui	a5,0x10
    80005ef0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005ef4:	30279073          	csrw	medeleg,a5
    80005ef8:	30379073          	csrw	mideleg,a5
    80005efc:	104027f3          	csrr	a5,sie
    80005f00:	2227e793          	ori	a5,a5,546
    80005f04:	10479073          	csrw	sie,a5
    80005f08:	fff00793          	li	a5,-1
    80005f0c:	00a7d793          	srli	a5,a5,0xa
    80005f10:	3b079073          	csrw	pmpaddr0,a5
    80005f14:	00f00793          	li	a5,15
    80005f18:	3a079073          	csrw	pmpcfg0,a5
    80005f1c:	f14027f3          	csrr	a5,mhartid
    80005f20:	0200c737          	lui	a4,0x200c
    80005f24:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005f28:	0007869b          	sext.w	a3,a5
    80005f2c:	00269713          	slli	a4,a3,0x2
    80005f30:	000f4637          	lui	a2,0xf4
    80005f34:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005f38:	00d70733          	add	a4,a4,a3
    80005f3c:	0037979b          	slliw	a5,a5,0x3
    80005f40:	020046b7          	lui	a3,0x2004
    80005f44:	00d787b3          	add	a5,a5,a3
    80005f48:	00c585b3          	add	a1,a1,a2
    80005f4c:	00371693          	slli	a3,a4,0x3
    80005f50:	00006717          	auipc	a4,0x6
    80005f54:	81070713          	addi	a4,a4,-2032 # 8000b760 <timer_scratch>
    80005f58:	00b7b023          	sd	a1,0(a5)
    80005f5c:	00d70733          	add	a4,a4,a3
    80005f60:	00f73c23          	sd	a5,24(a4)
    80005f64:	02c73023          	sd	a2,32(a4)
    80005f68:	34071073          	csrw	mscratch,a4
    80005f6c:	00000797          	auipc	a5,0x0
    80005f70:	6e478793          	addi	a5,a5,1764 # 80006650 <timervec>
    80005f74:	30579073          	csrw	mtvec,a5
    80005f78:	300027f3          	csrr	a5,mstatus
    80005f7c:	0087e793          	ori	a5,a5,8
    80005f80:	30079073          	csrw	mstatus,a5
    80005f84:	304027f3          	csrr	a5,mie
    80005f88:	0807e793          	ori	a5,a5,128
    80005f8c:	30479073          	csrw	mie,a5
    80005f90:	f14027f3          	csrr	a5,mhartid
    80005f94:	0007879b          	sext.w	a5,a5
    80005f98:	00078213          	mv	tp,a5
    80005f9c:	30200073          	mret
    80005fa0:	00813403          	ld	s0,8(sp)
    80005fa4:	01010113          	addi	sp,sp,16
    80005fa8:	00008067          	ret

0000000080005fac <timerinit>:
    80005fac:	ff010113          	addi	sp,sp,-16
    80005fb0:	00813423          	sd	s0,8(sp)
    80005fb4:	01010413          	addi	s0,sp,16
    80005fb8:	f14027f3          	csrr	a5,mhartid
    80005fbc:	0200c737          	lui	a4,0x200c
    80005fc0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005fc4:	0007869b          	sext.w	a3,a5
    80005fc8:	00269713          	slli	a4,a3,0x2
    80005fcc:	000f4637          	lui	a2,0xf4
    80005fd0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005fd4:	00d70733          	add	a4,a4,a3
    80005fd8:	0037979b          	slliw	a5,a5,0x3
    80005fdc:	020046b7          	lui	a3,0x2004
    80005fe0:	00d787b3          	add	a5,a5,a3
    80005fe4:	00c585b3          	add	a1,a1,a2
    80005fe8:	00371693          	slli	a3,a4,0x3
    80005fec:	00005717          	auipc	a4,0x5
    80005ff0:	77470713          	addi	a4,a4,1908 # 8000b760 <timer_scratch>
    80005ff4:	00b7b023          	sd	a1,0(a5)
    80005ff8:	00d70733          	add	a4,a4,a3
    80005ffc:	00f73c23          	sd	a5,24(a4)
    80006000:	02c73023          	sd	a2,32(a4)
    80006004:	34071073          	csrw	mscratch,a4
    80006008:	00000797          	auipc	a5,0x0
    8000600c:	64878793          	addi	a5,a5,1608 # 80006650 <timervec>
    80006010:	30579073          	csrw	mtvec,a5
    80006014:	300027f3          	csrr	a5,mstatus
    80006018:	0087e793          	ori	a5,a5,8
    8000601c:	30079073          	csrw	mstatus,a5
    80006020:	304027f3          	csrr	a5,mie
    80006024:	0807e793          	ori	a5,a5,128
    80006028:	30479073          	csrw	mie,a5
    8000602c:	00813403          	ld	s0,8(sp)
    80006030:	01010113          	addi	sp,sp,16
    80006034:	00008067          	ret

0000000080006038 <system_main>:
    80006038:	fe010113          	addi	sp,sp,-32
    8000603c:	00813823          	sd	s0,16(sp)
    80006040:	00913423          	sd	s1,8(sp)
    80006044:	00113c23          	sd	ra,24(sp)
    80006048:	02010413          	addi	s0,sp,32
    8000604c:	00000097          	auipc	ra,0x0
    80006050:	0c4080e7          	jalr	196(ra) # 80006110 <cpuid>
    80006054:	00005497          	auipc	s1,0x5
    80006058:	65c48493          	addi	s1,s1,1628 # 8000b6b0 <started>
    8000605c:	02050263          	beqz	a0,80006080 <system_main+0x48>
    80006060:	0004a783          	lw	a5,0(s1)
    80006064:	0007879b          	sext.w	a5,a5
    80006068:	fe078ce3          	beqz	a5,80006060 <system_main+0x28>
    8000606c:	0ff0000f          	fence
    80006070:	00003517          	auipc	a0,0x3
    80006074:	5f850513          	addi	a0,a0,1528 # 80009668 <CONSOLE_STATUS+0x658>
    80006078:	00001097          	auipc	ra,0x1
    8000607c:	a74080e7          	jalr	-1420(ra) # 80006aec <panic>
    80006080:	00001097          	auipc	ra,0x1
    80006084:	9c8080e7          	jalr	-1592(ra) # 80006a48 <consoleinit>
    80006088:	00001097          	auipc	ra,0x1
    8000608c:	154080e7          	jalr	340(ra) # 800071dc <printfinit>
    80006090:	00003517          	auipc	a0,0x3
    80006094:	18050513          	addi	a0,a0,384 # 80009210 <CONSOLE_STATUS+0x200>
    80006098:	00001097          	auipc	ra,0x1
    8000609c:	ab0080e7          	jalr	-1360(ra) # 80006b48 <__printf>
    800060a0:	00003517          	auipc	a0,0x3
    800060a4:	59850513          	addi	a0,a0,1432 # 80009638 <CONSOLE_STATUS+0x628>
    800060a8:	00001097          	auipc	ra,0x1
    800060ac:	aa0080e7          	jalr	-1376(ra) # 80006b48 <__printf>
    800060b0:	00003517          	auipc	a0,0x3
    800060b4:	16050513          	addi	a0,a0,352 # 80009210 <CONSOLE_STATUS+0x200>
    800060b8:	00001097          	auipc	ra,0x1
    800060bc:	a90080e7          	jalr	-1392(ra) # 80006b48 <__printf>
    800060c0:	00001097          	auipc	ra,0x1
    800060c4:	4a8080e7          	jalr	1192(ra) # 80007568 <kinit>
    800060c8:	00000097          	auipc	ra,0x0
    800060cc:	148080e7          	jalr	328(ra) # 80006210 <trapinit>
    800060d0:	00000097          	auipc	ra,0x0
    800060d4:	16c080e7          	jalr	364(ra) # 8000623c <trapinithart>
    800060d8:	00000097          	auipc	ra,0x0
    800060dc:	5b8080e7          	jalr	1464(ra) # 80006690 <plicinit>
    800060e0:	00000097          	auipc	ra,0x0
    800060e4:	5d8080e7          	jalr	1496(ra) # 800066b8 <plicinithart>
    800060e8:	00000097          	auipc	ra,0x0
    800060ec:	078080e7          	jalr	120(ra) # 80006160 <userinit>
    800060f0:	0ff0000f          	fence
    800060f4:	00100793          	li	a5,1
    800060f8:	00003517          	auipc	a0,0x3
    800060fc:	55850513          	addi	a0,a0,1368 # 80009650 <CONSOLE_STATUS+0x640>
    80006100:	00f4a023          	sw	a5,0(s1)
    80006104:	00001097          	auipc	ra,0x1
    80006108:	a44080e7          	jalr	-1468(ra) # 80006b48 <__printf>
    8000610c:	0000006f          	j	8000610c <system_main+0xd4>

0000000080006110 <cpuid>:
    80006110:	ff010113          	addi	sp,sp,-16
    80006114:	00813423          	sd	s0,8(sp)
    80006118:	01010413          	addi	s0,sp,16
    8000611c:	00020513          	mv	a0,tp
    80006120:	00813403          	ld	s0,8(sp)
    80006124:	0005051b          	sext.w	a0,a0
    80006128:	01010113          	addi	sp,sp,16
    8000612c:	00008067          	ret

0000000080006130 <mycpu>:
    80006130:	ff010113          	addi	sp,sp,-16
    80006134:	00813423          	sd	s0,8(sp)
    80006138:	01010413          	addi	s0,sp,16
    8000613c:	00020793          	mv	a5,tp
    80006140:	00813403          	ld	s0,8(sp)
    80006144:	0007879b          	sext.w	a5,a5
    80006148:	00779793          	slli	a5,a5,0x7
    8000614c:	00006517          	auipc	a0,0x6
    80006150:	64450513          	addi	a0,a0,1604 # 8000c790 <cpus>
    80006154:	00f50533          	add	a0,a0,a5
    80006158:	01010113          	addi	sp,sp,16
    8000615c:	00008067          	ret

0000000080006160 <userinit>:
    80006160:	ff010113          	addi	sp,sp,-16
    80006164:	00813423          	sd	s0,8(sp)
    80006168:	01010413          	addi	s0,sp,16
    8000616c:	00813403          	ld	s0,8(sp)
    80006170:	01010113          	addi	sp,sp,16
    80006174:	ffffb317          	auipc	t1,0xffffb
    80006178:	57430067          	jr	1396(t1) # 800016e8 <main>

000000008000617c <either_copyout>:
    8000617c:	ff010113          	addi	sp,sp,-16
    80006180:	00813023          	sd	s0,0(sp)
    80006184:	00113423          	sd	ra,8(sp)
    80006188:	01010413          	addi	s0,sp,16
    8000618c:	02051663          	bnez	a0,800061b8 <either_copyout+0x3c>
    80006190:	00058513          	mv	a0,a1
    80006194:	00060593          	mv	a1,a2
    80006198:	0006861b          	sext.w	a2,a3
    8000619c:	00002097          	auipc	ra,0x2
    800061a0:	c58080e7          	jalr	-936(ra) # 80007df4 <__memmove>
    800061a4:	00813083          	ld	ra,8(sp)
    800061a8:	00013403          	ld	s0,0(sp)
    800061ac:	00000513          	li	a0,0
    800061b0:	01010113          	addi	sp,sp,16
    800061b4:	00008067          	ret
    800061b8:	00003517          	auipc	a0,0x3
    800061bc:	4d850513          	addi	a0,a0,1240 # 80009690 <CONSOLE_STATUS+0x680>
    800061c0:	00001097          	auipc	ra,0x1
    800061c4:	92c080e7          	jalr	-1748(ra) # 80006aec <panic>

00000000800061c8 <either_copyin>:
    800061c8:	ff010113          	addi	sp,sp,-16
    800061cc:	00813023          	sd	s0,0(sp)
    800061d0:	00113423          	sd	ra,8(sp)
    800061d4:	01010413          	addi	s0,sp,16
    800061d8:	02059463          	bnez	a1,80006200 <either_copyin+0x38>
    800061dc:	00060593          	mv	a1,a2
    800061e0:	0006861b          	sext.w	a2,a3
    800061e4:	00002097          	auipc	ra,0x2
    800061e8:	c10080e7          	jalr	-1008(ra) # 80007df4 <__memmove>
    800061ec:	00813083          	ld	ra,8(sp)
    800061f0:	00013403          	ld	s0,0(sp)
    800061f4:	00000513          	li	a0,0
    800061f8:	01010113          	addi	sp,sp,16
    800061fc:	00008067          	ret
    80006200:	00003517          	auipc	a0,0x3
    80006204:	4b850513          	addi	a0,a0,1208 # 800096b8 <CONSOLE_STATUS+0x6a8>
    80006208:	00001097          	auipc	ra,0x1
    8000620c:	8e4080e7          	jalr	-1820(ra) # 80006aec <panic>

0000000080006210 <trapinit>:
    80006210:	ff010113          	addi	sp,sp,-16
    80006214:	00813423          	sd	s0,8(sp)
    80006218:	01010413          	addi	s0,sp,16
    8000621c:	00813403          	ld	s0,8(sp)
    80006220:	00003597          	auipc	a1,0x3
    80006224:	4c058593          	addi	a1,a1,1216 # 800096e0 <CONSOLE_STATUS+0x6d0>
    80006228:	00006517          	auipc	a0,0x6
    8000622c:	5e850513          	addi	a0,a0,1512 # 8000c810 <tickslock>
    80006230:	01010113          	addi	sp,sp,16
    80006234:	00001317          	auipc	t1,0x1
    80006238:	5c430067          	jr	1476(t1) # 800077f8 <initlock>

000000008000623c <trapinithart>:
    8000623c:	ff010113          	addi	sp,sp,-16
    80006240:	00813423          	sd	s0,8(sp)
    80006244:	01010413          	addi	s0,sp,16
    80006248:	00000797          	auipc	a5,0x0
    8000624c:	2f878793          	addi	a5,a5,760 # 80006540 <kernelvec>
    80006250:	10579073          	csrw	stvec,a5
    80006254:	00813403          	ld	s0,8(sp)
    80006258:	01010113          	addi	sp,sp,16
    8000625c:	00008067          	ret

0000000080006260 <usertrap>:
    80006260:	ff010113          	addi	sp,sp,-16
    80006264:	00813423          	sd	s0,8(sp)
    80006268:	01010413          	addi	s0,sp,16
    8000626c:	00813403          	ld	s0,8(sp)
    80006270:	01010113          	addi	sp,sp,16
    80006274:	00008067          	ret

0000000080006278 <usertrapret>:
    80006278:	ff010113          	addi	sp,sp,-16
    8000627c:	00813423          	sd	s0,8(sp)
    80006280:	01010413          	addi	s0,sp,16
    80006284:	00813403          	ld	s0,8(sp)
    80006288:	01010113          	addi	sp,sp,16
    8000628c:	00008067          	ret

0000000080006290 <kerneltrap>:
    80006290:	fe010113          	addi	sp,sp,-32
    80006294:	00813823          	sd	s0,16(sp)
    80006298:	00113c23          	sd	ra,24(sp)
    8000629c:	00913423          	sd	s1,8(sp)
    800062a0:	02010413          	addi	s0,sp,32
    800062a4:	142025f3          	csrr	a1,scause
    800062a8:	100027f3          	csrr	a5,sstatus
    800062ac:	0027f793          	andi	a5,a5,2
    800062b0:	10079c63          	bnez	a5,800063c8 <kerneltrap+0x138>
    800062b4:	142027f3          	csrr	a5,scause
    800062b8:	0207ce63          	bltz	a5,800062f4 <kerneltrap+0x64>
    800062bc:	00003517          	auipc	a0,0x3
    800062c0:	46c50513          	addi	a0,a0,1132 # 80009728 <CONSOLE_STATUS+0x718>
    800062c4:	00001097          	auipc	ra,0x1
    800062c8:	884080e7          	jalr	-1916(ra) # 80006b48 <__printf>
    800062cc:	141025f3          	csrr	a1,sepc
    800062d0:	14302673          	csrr	a2,stval
    800062d4:	00003517          	auipc	a0,0x3
    800062d8:	46450513          	addi	a0,a0,1124 # 80009738 <CONSOLE_STATUS+0x728>
    800062dc:	00001097          	auipc	ra,0x1
    800062e0:	86c080e7          	jalr	-1940(ra) # 80006b48 <__printf>
    800062e4:	00003517          	auipc	a0,0x3
    800062e8:	46c50513          	addi	a0,a0,1132 # 80009750 <CONSOLE_STATUS+0x740>
    800062ec:	00001097          	auipc	ra,0x1
    800062f0:	800080e7          	jalr	-2048(ra) # 80006aec <panic>
    800062f4:	0ff7f713          	andi	a4,a5,255
    800062f8:	00900693          	li	a3,9
    800062fc:	04d70063          	beq	a4,a3,8000633c <kerneltrap+0xac>
    80006300:	fff00713          	li	a4,-1
    80006304:	03f71713          	slli	a4,a4,0x3f
    80006308:	00170713          	addi	a4,a4,1
    8000630c:	fae798e3          	bne	a5,a4,800062bc <kerneltrap+0x2c>
    80006310:	00000097          	auipc	ra,0x0
    80006314:	e00080e7          	jalr	-512(ra) # 80006110 <cpuid>
    80006318:	06050663          	beqz	a0,80006384 <kerneltrap+0xf4>
    8000631c:	144027f3          	csrr	a5,sip
    80006320:	ffd7f793          	andi	a5,a5,-3
    80006324:	14479073          	csrw	sip,a5
    80006328:	01813083          	ld	ra,24(sp)
    8000632c:	01013403          	ld	s0,16(sp)
    80006330:	00813483          	ld	s1,8(sp)
    80006334:	02010113          	addi	sp,sp,32
    80006338:	00008067          	ret
    8000633c:	00000097          	auipc	ra,0x0
    80006340:	3c8080e7          	jalr	968(ra) # 80006704 <plic_claim>
    80006344:	00a00793          	li	a5,10
    80006348:	00050493          	mv	s1,a0
    8000634c:	06f50863          	beq	a0,a5,800063bc <kerneltrap+0x12c>
    80006350:	fc050ce3          	beqz	a0,80006328 <kerneltrap+0x98>
    80006354:	00050593          	mv	a1,a0
    80006358:	00003517          	auipc	a0,0x3
    8000635c:	3b050513          	addi	a0,a0,944 # 80009708 <CONSOLE_STATUS+0x6f8>
    80006360:	00000097          	auipc	ra,0x0
    80006364:	7e8080e7          	jalr	2024(ra) # 80006b48 <__printf>
    80006368:	01013403          	ld	s0,16(sp)
    8000636c:	01813083          	ld	ra,24(sp)
    80006370:	00048513          	mv	a0,s1
    80006374:	00813483          	ld	s1,8(sp)
    80006378:	02010113          	addi	sp,sp,32
    8000637c:	00000317          	auipc	t1,0x0
    80006380:	3c030067          	jr	960(t1) # 8000673c <plic_complete>
    80006384:	00006517          	auipc	a0,0x6
    80006388:	48c50513          	addi	a0,a0,1164 # 8000c810 <tickslock>
    8000638c:	00001097          	auipc	ra,0x1
    80006390:	490080e7          	jalr	1168(ra) # 8000781c <acquire>
    80006394:	00005717          	auipc	a4,0x5
    80006398:	32070713          	addi	a4,a4,800 # 8000b6b4 <ticks>
    8000639c:	00072783          	lw	a5,0(a4)
    800063a0:	00006517          	auipc	a0,0x6
    800063a4:	47050513          	addi	a0,a0,1136 # 8000c810 <tickslock>
    800063a8:	0017879b          	addiw	a5,a5,1
    800063ac:	00f72023          	sw	a5,0(a4)
    800063b0:	00001097          	auipc	ra,0x1
    800063b4:	538080e7          	jalr	1336(ra) # 800078e8 <release>
    800063b8:	f65ff06f          	j	8000631c <kerneltrap+0x8c>
    800063bc:	00001097          	auipc	ra,0x1
    800063c0:	094080e7          	jalr	148(ra) # 80007450 <uartintr>
    800063c4:	fa5ff06f          	j	80006368 <kerneltrap+0xd8>
    800063c8:	00003517          	auipc	a0,0x3
    800063cc:	32050513          	addi	a0,a0,800 # 800096e8 <CONSOLE_STATUS+0x6d8>
    800063d0:	00000097          	auipc	ra,0x0
    800063d4:	71c080e7          	jalr	1820(ra) # 80006aec <panic>

00000000800063d8 <clockintr>:
    800063d8:	fe010113          	addi	sp,sp,-32
    800063dc:	00813823          	sd	s0,16(sp)
    800063e0:	00913423          	sd	s1,8(sp)
    800063e4:	00113c23          	sd	ra,24(sp)
    800063e8:	02010413          	addi	s0,sp,32
    800063ec:	00006497          	auipc	s1,0x6
    800063f0:	42448493          	addi	s1,s1,1060 # 8000c810 <tickslock>
    800063f4:	00048513          	mv	a0,s1
    800063f8:	00001097          	auipc	ra,0x1
    800063fc:	424080e7          	jalr	1060(ra) # 8000781c <acquire>
    80006400:	00005717          	auipc	a4,0x5
    80006404:	2b470713          	addi	a4,a4,692 # 8000b6b4 <ticks>
    80006408:	00072783          	lw	a5,0(a4)
    8000640c:	01013403          	ld	s0,16(sp)
    80006410:	01813083          	ld	ra,24(sp)
    80006414:	00048513          	mv	a0,s1
    80006418:	0017879b          	addiw	a5,a5,1
    8000641c:	00813483          	ld	s1,8(sp)
    80006420:	00f72023          	sw	a5,0(a4)
    80006424:	02010113          	addi	sp,sp,32
    80006428:	00001317          	auipc	t1,0x1
    8000642c:	4c030067          	jr	1216(t1) # 800078e8 <release>

0000000080006430 <devintr>:
    80006430:	142027f3          	csrr	a5,scause
    80006434:	00000513          	li	a0,0
    80006438:	0007c463          	bltz	a5,80006440 <devintr+0x10>
    8000643c:	00008067          	ret
    80006440:	fe010113          	addi	sp,sp,-32
    80006444:	00813823          	sd	s0,16(sp)
    80006448:	00113c23          	sd	ra,24(sp)
    8000644c:	00913423          	sd	s1,8(sp)
    80006450:	02010413          	addi	s0,sp,32
    80006454:	0ff7f713          	andi	a4,a5,255
    80006458:	00900693          	li	a3,9
    8000645c:	04d70c63          	beq	a4,a3,800064b4 <devintr+0x84>
    80006460:	fff00713          	li	a4,-1
    80006464:	03f71713          	slli	a4,a4,0x3f
    80006468:	00170713          	addi	a4,a4,1
    8000646c:	00e78c63          	beq	a5,a4,80006484 <devintr+0x54>
    80006470:	01813083          	ld	ra,24(sp)
    80006474:	01013403          	ld	s0,16(sp)
    80006478:	00813483          	ld	s1,8(sp)
    8000647c:	02010113          	addi	sp,sp,32
    80006480:	00008067          	ret
    80006484:	00000097          	auipc	ra,0x0
    80006488:	c8c080e7          	jalr	-884(ra) # 80006110 <cpuid>
    8000648c:	06050663          	beqz	a0,800064f8 <devintr+0xc8>
    80006490:	144027f3          	csrr	a5,sip
    80006494:	ffd7f793          	andi	a5,a5,-3
    80006498:	14479073          	csrw	sip,a5
    8000649c:	01813083          	ld	ra,24(sp)
    800064a0:	01013403          	ld	s0,16(sp)
    800064a4:	00813483          	ld	s1,8(sp)
    800064a8:	00200513          	li	a0,2
    800064ac:	02010113          	addi	sp,sp,32
    800064b0:	00008067          	ret
    800064b4:	00000097          	auipc	ra,0x0
    800064b8:	250080e7          	jalr	592(ra) # 80006704 <plic_claim>
    800064bc:	00a00793          	li	a5,10
    800064c0:	00050493          	mv	s1,a0
    800064c4:	06f50663          	beq	a0,a5,80006530 <devintr+0x100>
    800064c8:	00100513          	li	a0,1
    800064cc:	fa0482e3          	beqz	s1,80006470 <devintr+0x40>
    800064d0:	00048593          	mv	a1,s1
    800064d4:	00003517          	auipc	a0,0x3
    800064d8:	23450513          	addi	a0,a0,564 # 80009708 <CONSOLE_STATUS+0x6f8>
    800064dc:	00000097          	auipc	ra,0x0
    800064e0:	66c080e7          	jalr	1644(ra) # 80006b48 <__printf>
    800064e4:	00048513          	mv	a0,s1
    800064e8:	00000097          	auipc	ra,0x0
    800064ec:	254080e7          	jalr	596(ra) # 8000673c <plic_complete>
    800064f0:	00100513          	li	a0,1
    800064f4:	f7dff06f          	j	80006470 <devintr+0x40>
    800064f8:	00006517          	auipc	a0,0x6
    800064fc:	31850513          	addi	a0,a0,792 # 8000c810 <tickslock>
    80006500:	00001097          	auipc	ra,0x1
    80006504:	31c080e7          	jalr	796(ra) # 8000781c <acquire>
    80006508:	00005717          	auipc	a4,0x5
    8000650c:	1ac70713          	addi	a4,a4,428 # 8000b6b4 <ticks>
    80006510:	00072783          	lw	a5,0(a4)
    80006514:	00006517          	auipc	a0,0x6
    80006518:	2fc50513          	addi	a0,a0,764 # 8000c810 <tickslock>
    8000651c:	0017879b          	addiw	a5,a5,1
    80006520:	00f72023          	sw	a5,0(a4)
    80006524:	00001097          	auipc	ra,0x1
    80006528:	3c4080e7          	jalr	964(ra) # 800078e8 <release>
    8000652c:	f65ff06f          	j	80006490 <devintr+0x60>
    80006530:	00001097          	auipc	ra,0x1
    80006534:	f20080e7          	jalr	-224(ra) # 80007450 <uartintr>
    80006538:	fadff06f          	j	800064e4 <devintr+0xb4>
    8000653c:	0000                	unimp
	...

0000000080006540 <kernelvec>:
    80006540:	f0010113          	addi	sp,sp,-256
    80006544:	00113023          	sd	ra,0(sp)
    80006548:	00213423          	sd	sp,8(sp)
    8000654c:	00313823          	sd	gp,16(sp)
    80006550:	00413c23          	sd	tp,24(sp)
    80006554:	02513023          	sd	t0,32(sp)
    80006558:	02613423          	sd	t1,40(sp)
    8000655c:	02713823          	sd	t2,48(sp)
    80006560:	02813c23          	sd	s0,56(sp)
    80006564:	04913023          	sd	s1,64(sp)
    80006568:	04a13423          	sd	a0,72(sp)
    8000656c:	04b13823          	sd	a1,80(sp)
    80006570:	04c13c23          	sd	a2,88(sp)
    80006574:	06d13023          	sd	a3,96(sp)
    80006578:	06e13423          	sd	a4,104(sp)
    8000657c:	06f13823          	sd	a5,112(sp)
    80006580:	07013c23          	sd	a6,120(sp)
    80006584:	09113023          	sd	a7,128(sp)
    80006588:	09213423          	sd	s2,136(sp)
    8000658c:	09313823          	sd	s3,144(sp)
    80006590:	09413c23          	sd	s4,152(sp)
    80006594:	0b513023          	sd	s5,160(sp)
    80006598:	0b613423          	sd	s6,168(sp)
    8000659c:	0b713823          	sd	s7,176(sp)
    800065a0:	0b813c23          	sd	s8,184(sp)
    800065a4:	0d913023          	sd	s9,192(sp)
    800065a8:	0da13423          	sd	s10,200(sp)
    800065ac:	0db13823          	sd	s11,208(sp)
    800065b0:	0dc13c23          	sd	t3,216(sp)
    800065b4:	0fd13023          	sd	t4,224(sp)
    800065b8:	0fe13423          	sd	t5,232(sp)
    800065bc:	0ff13823          	sd	t6,240(sp)
    800065c0:	cd1ff0ef          	jal	ra,80006290 <kerneltrap>
    800065c4:	00013083          	ld	ra,0(sp)
    800065c8:	00813103          	ld	sp,8(sp)
    800065cc:	01013183          	ld	gp,16(sp)
    800065d0:	02013283          	ld	t0,32(sp)
    800065d4:	02813303          	ld	t1,40(sp)
    800065d8:	03013383          	ld	t2,48(sp)
    800065dc:	03813403          	ld	s0,56(sp)
    800065e0:	04013483          	ld	s1,64(sp)
    800065e4:	04813503          	ld	a0,72(sp)
    800065e8:	05013583          	ld	a1,80(sp)
    800065ec:	05813603          	ld	a2,88(sp)
    800065f0:	06013683          	ld	a3,96(sp)
    800065f4:	06813703          	ld	a4,104(sp)
    800065f8:	07013783          	ld	a5,112(sp)
    800065fc:	07813803          	ld	a6,120(sp)
    80006600:	08013883          	ld	a7,128(sp)
    80006604:	08813903          	ld	s2,136(sp)
    80006608:	09013983          	ld	s3,144(sp)
    8000660c:	09813a03          	ld	s4,152(sp)
    80006610:	0a013a83          	ld	s5,160(sp)
    80006614:	0a813b03          	ld	s6,168(sp)
    80006618:	0b013b83          	ld	s7,176(sp)
    8000661c:	0b813c03          	ld	s8,184(sp)
    80006620:	0c013c83          	ld	s9,192(sp)
    80006624:	0c813d03          	ld	s10,200(sp)
    80006628:	0d013d83          	ld	s11,208(sp)
    8000662c:	0d813e03          	ld	t3,216(sp)
    80006630:	0e013e83          	ld	t4,224(sp)
    80006634:	0e813f03          	ld	t5,232(sp)
    80006638:	0f013f83          	ld	t6,240(sp)
    8000663c:	10010113          	addi	sp,sp,256
    80006640:	10200073          	sret
    80006644:	00000013          	nop
    80006648:	00000013          	nop
    8000664c:	00000013          	nop

0000000080006650 <timervec>:
    80006650:	34051573          	csrrw	a0,mscratch,a0
    80006654:	00b53023          	sd	a1,0(a0)
    80006658:	00c53423          	sd	a2,8(a0)
    8000665c:	00d53823          	sd	a3,16(a0)
    80006660:	01853583          	ld	a1,24(a0)
    80006664:	02053603          	ld	a2,32(a0)
    80006668:	0005b683          	ld	a3,0(a1)
    8000666c:	00c686b3          	add	a3,a3,a2
    80006670:	00d5b023          	sd	a3,0(a1)
    80006674:	00200593          	li	a1,2
    80006678:	14459073          	csrw	sip,a1
    8000667c:	01053683          	ld	a3,16(a0)
    80006680:	00853603          	ld	a2,8(a0)
    80006684:	00053583          	ld	a1,0(a0)
    80006688:	34051573          	csrrw	a0,mscratch,a0
    8000668c:	30200073          	mret

0000000080006690 <plicinit>:
    80006690:	ff010113          	addi	sp,sp,-16
    80006694:	00813423          	sd	s0,8(sp)
    80006698:	01010413          	addi	s0,sp,16
    8000669c:	00813403          	ld	s0,8(sp)
    800066a0:	0c0007b7          	lui	a5,0xc000
    800066a4:	00100713          	li	a4,1
    800066a8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800066ac:	00e7a223          	sw	a4,4(a5)
    800066b0:	01010113          	addi	sp,sp,16
    800066b4:	00008067          	ret

00000000800066b8 <plicinithart>:
    800066b8:	ff010113          	addi	sp,sp,-16
    800066bc:	00813023          	sd	s0,0(sp)
    800066c0:	00113423          	sd	ra,8(sp)
    800066c4:	01010413          	addi	s0,sp,16
    800066c8:	00000097          	auipc	ra,0x0
    800066cc:	a48080e7          	jalr	-1464(ra) # 80006110 <cpuid>
    800066d0:	0085171b          	slliw	a4,a0,0x8
    800066d4:	0c0027b7          	lui	a5,0xc002
    800066d8:	00e787b3          	add	a5,a5,a4
    800066dc:	40200713          	li	a4,1026
    800066e0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800066e4:	00813083          	ld	ra,8(sp)
    800066e8:	00013403          	ld	s0,0(sp)
    800066ec:	00d5151b          	slliw	a0,a0,0xd
    800066f0:	0c2017b7          	lui	a5,0xc201
    800066f4:	00a78533          	add	a0,a5,a0
    800066f8:	00052023          	sw	zero,0(a0)
    800066fc:	01010113          	addi	sp,sp,16
    80006700:	00008067          	ret

0000000080006704 <plic_claim>:
    80006704:	ff010113          	addi	sp,sp,-16
    80006708:	00813023          	sd	s0,0(sp)
    8000670c:	00113423          	sd	ra,8(sp)
    80006710:	01010413          	addi	s0,sp,16
    80006714:	00000097          	auipc	ra,0x0
    80006718:	9fc080e7          	jalr	-1540(ra) # 80006110 <cpuid>
    8000671c:	00813083          	ld	ra,8(sp)
    80006720:	00013403          	ld	s0,0(sp)
    80006724:	00d5151b          	slliw	a0,a0,0xd
    80006728:	0c2017b7          	lui	a5,0xc201
    8000672c:	00a78533          	add	a0,a5,a0
    80006730:	00452503          	lw	a0,4(a0)
    80006734:	01010113          	addi	sp,sp,16
    80006738:	00008067          	ret

000000008000673c <plic_complete>:
    8000673c:	fe010113          	addi	sp,sp,-32
    80006740:	00813823          	sd	s0,16(sp)
    80006744:	00913423          	sd	s1,8(sp)
    80006748:	00113c23          	sd	ra,24(sp)
    8000674c:	02010413          	addi	s0,sp,32
    80006750:	00050493          	mv	s1,a0
    80006754:	00000097          	auipc	ra,0x0
    80006758:	9bc080e7          	jalr	-1604(ra) # 80006110 <cpuid>
    8000675c:	01813083          	ld	ra,24(sp)
    80006760:	01013403          	ld	s0,16(sp)
    80006764:	00d5179b          	slliw	a5,a0,0xd
    80006768:	0c201737          	lui	a4,0xc201
    8000676c:	00f707b3          	add	a5,a4,a5
    80006770:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80006774:	00813483          	ld	s1,8(sp)
    80006778:	02010113          	addi	sp,sp,32
    8000677c:	00008067          	ret

0000000080006780 <consolewrite>:
    80006780:	fb010113          	addi	sp,sp,-80
    80006784:	04813023          	sd	s0,64(sp)
    80006788:	04113423          	sd	ra,72(sp)
    8000678c:	02913c23          	sd	s1,56(sp)
    80006790:	03213823          	sd	s2,48(sp)
    80006794:	03313423          	sd	s3,40(sp)
    80006798:	03413023          	sd	s4,32(sp)
    8000679c:	01513c23          	sd	s5,24(sp)
    800067a0:	05010413          	addi	s0,sp,80
    800067a4:	06c05c63          	blez	a2,8000681c <consolewrite+0x9c>
    800067a8:	00060993          	mv	s3,a2
    800067ac:	00050a13          	mv	s4,a0
    800067b0:	00058493          	mv	s1,a1
    800067b4:	00000913          	li	s2,0
    800067b8:	fff00a93          	li	s5,-1
    800067bc:	01c0006f          	j	800067d8 <consolewrite+0x58>
    800067c0:	fbf44503          	lbu	a0,-65(s0)
    800067c4:	0019091b          	addiw	s2,s2,1
    800067c8:	00148493          	addi	s1,s1,1
    800067cc:	00001097          	auipc	ra,0x1
    800067d0:	a9c080e7          	jalr	-1380(ra) # 80007268 <uartputc>
    800067d4:	03298063          	beq	s3,s2,800067f4 <consolewrite+0x74>
    800067d8:	00048613          	mv	a2,s1
    800067dc:	00100693          	li	a3,1
    800067e0:	000a0593          	mv	a1,s4
    800067e4:	fbf40513          	addi	a0,s0,-65
    800067e8:	00000097          	auipc	ra,0x0
    800067ec:	9e0080e7          	jalr	-1568(ra) # 800061c8 <either_copyin>
    800067f0:	fd5518e3          	bne	a0,s5,800067c0 <consolewrite+0x40>
    800067f4:	04813083          	ld	ra,72(sp)
    800067f8:	04013403          	ld	s0,64(sp)
    800067fc:	03813483          	ld	s1,56(sp)
    80006800:	02813983          	ld	s3,40(sp)
    80006804:	02013a03          	ld	s4,32(sp)
    80006808:	01813a83          	ld	s5,24(sp)
    8000680c:	00090513          	mv	a0,s2
    80006810:	03013903          	ld	s2,48(sp)
    80006814:	05010113          	addi	sp,sp,80
    80006818:	00008067          	ret
    8000681c:	00000913          	li	s2,0
    80006820:	fd5ff06f          	j	800067f4 <consolewrite+0x74>

0000000080006824 <consoleread>:
    80006824:	f9010113          	addi	sp,sp,-112
    80006828:	06813023          	sd	s0,96(sp)
    8000682c:	04913c23          	sd	s1,88(sp)
    80006830:	05213823          	sd	s2,80(sp)
    80006834:	05313423          	sd	s3,72(sp)
    80006838:	05413023          	sd	s4,64(sp)
    8000683c:	03513c23          	sd	s5,56(sp)
    80006840:	03613823          	sd	s6,48(sp)
    80006844:	03713423          	sd	s7,40(sp)
    80006848:	03813023          	sd	s8,32(sp)
    8000684c:	06113423          	sd	ra,104(sp)
    80006850:	01913c23          	sd	s9,24(sp)
    80006854:	07010413          	addi	s0,sp,112
    80006858:	00060b93          	mv	s7,a2
    8000685c:	00050913          	mv	s2,a0
    80006860:	00058c13          	mv	s8,a1
    80006864:	00060b1b          	sext.w	s6,a2
    80006868:	00006497          	auipc	s1,0x6
    8000686c:	fd048493          	addi	s1,s1,-48 # 8000c838 <cons>
    80006870:	00400993          	li	s3,4
    80006874:	fff00a13          	li	s4,-1
    80006878:	00a00a93          	li	s5,10
    8000687c:	05705e63          	blez	s7,800068d8 <consoleread+0xb4>
    80006880:	09c4a703          	lw	a4,156(s1)
    80006884:	0984a783          	lw	a5,152(s1)
    80006888:	0007071b          	sext.w	a4,a4
    8000688c:	08e78463          	beq	a5,a4,80006914 <consoleread+0xf0>
    80006890:	07f7f713          	andi	a4,a5,127
    80006894:	00e48733          	add	a4,s1,a4
    80006898:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000689c:	0017869b          	addiw	a3,a5,1
    800068a0:	08d4ac23          	sw	a3,152(s1)
    800068a4:	00070c9b          	sext.w	s9,a4
    800068a8:	0b370663          	beq	a4,s3,80006954 <consoleread+0x130>
    800068ac:	00100693          	li	a3,1
    800068b0:	f9f40613          	addi	a2,s0,-97
    800068b4:	000c0593          	mv	a1,s8
    800068b8:	00090513          	mv	a0,s2
    800068bc:	f8e40fa3          	sb	a4,-97(s0)
    800068c0:	00000097          	auipc	ra,0x0
    800068c4:	8bc080e7          	jalr	-1860(ra) # 8000617c <either_copyout>
    800068c8:	01450863          	beq	a0,s4,800068d8 <consoleread+0xb4>
    800068cc:	001c0c13          	addi	s8,s8,1
    800068d0:	fffb8b9b          	addiw	s7,s7,-1
    800068d4:	fb5c94e3          	bne	s9,s5,8000687c <consoleread+0x58>
    800068d8:	000b851b          	sext.w	a0,s7
    800068dc:	06813083          	ld	ra,104(sp)
    800068e0:	06013403          	ld	s0,96(sp)
    800068e4:	05813483          	ld	s1,88(sp)
    800068e8:	05013903          	ld	s2,80(sp)
    800068ec:	04813983          	ld	s3,72(sp)
    800068f0:	04013a03          	ld	s4,64(sp)
    800068f4:	03813a83          	ld	s5,56(sp)
    800068f8:	02813b83          	ld	s7,40(sp)
    800068fc:	02013c03          	ld	s8,32(sp)
    80006900:	01813c83          	ld	s9,24(sp)
    80006904:	40ab053b          	subw	a0,s6,a0
    80006908:	03013b03          	ld	s6,48(sp)
    8000690c:	07010113          	addi	sp,sp,112
    80006910:	00008067          	ret
    80006914:	00001097          	auipc	ra,0x1
    80006918:	1d8080e7          	jalr	472(ra) # 80007aec <push_on>
    8000691c:	0984a703          	lw	a4,152(s1)
    80006920:	09c4a783          	lw	a5,156(s1)
    80006924:	0007879b          	sext.w	a5,a5
    80006928:	fef70ce3          	beq	a4,a5,80006920 <consoleread+0xfc>
    8000692c:	00001097          	auipc	ra,0x1
    80006930:	234080e7          	jalr	564(ra) # 80007b60 <pop_on>
    80006934:	0984a783          	lw	a5,152(s1)
    80006938:	07f7f713          	andi	a4,a5,127
    8000693c:	00e48733          	add	a4,s1,a4
    80006940:	01874703          	lbu	a4,24(a4)
    80006944:	0017869b          	addiw	a3,a5,1
    80006948:	08d4ac23          	sw	a3,152(s1)
    8000694c:	00070c9b          	sext.w	s9,a4
    80006950:	f5371ee3          	bne	a4,s3,800068ac <consoleread+0x88>
    80006954:	000b851b          	sext.w	a0,s7
    80006958:	f96bf2e3          	bgeu	s7,s6,800068dc <consoleread+0xb8>
    8000695c:	08f4ac23          	sw	a5,152(s1)
    80006960:	f7dff06f          	j	800068dc <consoleread+0xb8>

0000000080006964 <consputc>:
    80006964:	10000793          	li	a5,256
    80006968:	00f50663          	beq	a0,a5,80006974 <consputc+0x10>
    8000696c:	00001317          	auipc	t1,0x1
    80006970:	9f430067          	jr	-1548(t1) # 80007360 <uartputc_sync>
    80006974:	ff010113          	addi	sp,sp,-16
    80006978:	00113423          	sd	ra,8(sp)
    8000697c:	00813023          	sd	s0,0(sp)
    80006980:	01010413          	addi	s0,sp,16
    80006984:	00800513          	li	a0,8
    80006988:	00001097          	auipc	ra,0x1
    8000698c:	9d8080e7          	jalr	-1576(ra) # 80007360 <uartputc_sync>
    80006990:	02000513          	li	a0,32
    80006994:	00001097          	auipc	ra,0x1
    80006998:	9cc080e7          	jalr	-1588(ra) # 80007360 <uartputc_sync>
    8000699c:	00013403          	ld	s0,0(sp)
    800069a0:	00813083          	ld	ra,8(sp)
    800069a4:	00800513          	li	a0,8
    800069a8:	01010113          	addi	sp,sp,16
    800069ac:	00001317          	auipc	t1,0x1
    800069b0:	9b430067          	jr	-1612(t1) # 80007360 <uartputc_sync>

00000000800069b4 <consoleintr>:
    800069b4:	fe010113          	addi	sp,sp,-32
    800069b8:	00813823          	sd	s0,16(sp)
    800069bc:	00913423          	sd	s1,8(sp)
    800069c0:	01213023          	sd	s2,0(sp)
    800069c4:	00113c23          	sd	ra,24(sp)
    800069c8:	02010413          	addi	s0,sp,32
    800069cc:	00006917          	auipc	s2,0x6
    800069d0:	e6c90913          	addi	s2,s2,-404 # 8000c838 <cons>
    800069d4:	00050493          	mv	s1,a0
    800069d8:	00090513          	mv	a0,s2
    800069dc:	00001097          	auipc	ra,0x1
    800069e0:	e40080e7          	jalr	-448(ra) # 8000781c <acquire>
    800069e4:	02048c63          	beqz	s1,80006a1c <consoleintr+0x68>
    800069e8:	0a092783          	lw	a5,160(s2)
    800069ec:	09892703          	lw	a4,152(s2)
    800069f0:	07f00693          	li	a3,127
    800069f4:	40e7873b          	subw	a4,a5,a4
    800069f8:	02e6e263          	bltu	a3,a4,80006a1c <consoleintr+0x68>
    800069fc:	00d00713          	li	a4,13
    80006a00:	04e48063          	beq	s1,a4,80006a40 <consoleintr+0x8c>
    80006a04:	07f7f713          	andi	a4,a5,127
    80006a08:	00e90733          	add	a4,s2,a4
    80006a0c:	0017879b          	addiw	a5,a5,1
    80006a10:	0af92023          	sw	a5,160(s2)
    80006a14:	00970c23          	sb	s1,24(a4)
    80006a18:	08f92e23          	sw	a5,156(s2)
    80006a1c:	01013403          	ld	s0,16(sp)
    80006a20:	01813083          	ld	ra,24(sp)
    80006a24:	00813483          	ld	s1,8(sp)
    80006a28:	00013903          	ld	s2,0(sp)
    80006a2c:	00006517          	auipc	a0,0x6
    80006a30:	e0c50513          	addi	a0,a0,-500 # 8000c838 <cons>
    80006a34:	02010113          	addi	sp,sp,32
    80006a38:	00001317          	auipc	t1,0x1
    80006a3c:	eb030067          	jr	-336(t1) # 800078e8 <release>
    80006a40:	00a00493          	li	s1,10
    80006a44:	fc1ff06f          	j	80006a04 <consoleintr+0x50>

0000000080006a48 <consoleinit>:
    80006a48:	fe010113          	addi	sp,sp,-32
    80006a4c:	00113c23          	sd	ra,24(sp)
    80006a50:	00813823          	sd	s0,16(sp)
    80006a54:	00913423          	sd	s1,8(sp)
    80006a58:	02010413          	addi	s0,sp,32
    80006a5c:	00006497          	auipc	s1,0x6
    80006a60:	ddc48493          	addi	s1,s1,-548 # 8000c838 <cons>
    80006a64:	00048513          	mv	a0,s1
    80006a68:	00003597          	auipc	a1,0x3
    80006a6c:	cf858593          	addi	a1,a1,-776 # 80009760 <CONSOLE_STATUS+0x750>
    80006a70:	00001097          	auipc	ra,0x1
    80006a74:	d88080e7          	jalr	-632(ra) # 800077f8 <initlock>
    80006a78:	00000097          	auipc	ra,0x0
    80006a7c:	7ac080e7          	jalr	1964(ra) # 80007224 <uartinit>
    80006a80:	01813083          	ld	ra,24(sp)
    80006a84:	01013403          	ld	s0,16(sp)
    80006a88:	00000797          	auipc	a5,0x0
    80006a8c:	d9c78793          	addi	a5,a5,-612 # 80006824 <consoleread>
    80006a90:	0af4bc23          	sd	a5,184(s1)
    80006a94:	00000797          	auipc	a5,0x0
    80006a98:	cec78793          	addi	a5,a5,-788 # 80006780 <consolewrite>
    80006a9c:	0cf4b023          	sd	a5,192(s1)
    80006aa0:	00813483          	ld	s1,8(sp)
    80006aa4:	02010113          	addi	sp,sp,32
    80006aa8:	00008067          	ret

0000000080006aac <console_read>:
    80006aac:	ff010113          	addi	sp,sp,-16
    80006ab0:	00813423          	sd	s0,8(sp)
    80006ab4:	01010413          	addi	s0,sp,16
    80006ab8:	00813403          	ld	s0,8(sp)
    80006abc:	00006317          	auipc	t1,0x6
    80006ac0:	e3433303          	ld	t1,-460(t1) # 8000c8f0 <devsw+0x10>
    80006ac4:	01010113          	addi	sp,sp,16
    80006ac8:	00030067          	jr	t1

0000000080006acc <console_write>:
    80006acc:	ff010113          	addi	sp,sp,-16
    80006ad0:	00813423          	sd	s0,8(sp)
    80006ad4:	01010413          	addi	s0,sp,16
    80006ad8:	00813403          	ld	s0,8(sp)
    80006adc:	00006317          	auipc	t1,0x6
    80006ae0:	e1c33303          	ld	t1,-484(t1) # 8000c8f8 <devsw+0x18>
    80006ae4:	01010113          	addi	sp,sp,16
    80006ae8:	00030067          	jr	t1

0000000080006aec <panic>:
    80006aec:	fe010113          	addi	sp,sp,-32
    80006af0:	00113c23          	sd	ra,24(sp)
    80006af4:	00813823          	sd	s0,16(sp)
    80006af8:	00913423          	sd	s1,8(sp)
    80006afc:	02010413          	addi	s0,sp,32
    80006b00:	00050493          	mv	s1,a0
    80006b04:	00003517          	auipc	a0,0x3
    80006b08:	c6450513          	addi	a0,a0,-924 # 80009768 <CONSOLE_STATUS+0x758>
    80006b0c:	00006797          	auipc	a5,0x6
    80006b10:	e807a623          	sw	zero,-372(a5) # 8000c998 <pr+0x18>
    80006b14:	00000097          	auipc	ra,0x0
    80006b18:	034080e7          	jalr	52(ra) # 80006b48 <__printf>
    80006b1c:	00048513          	mv	a0,s1
    80006b20:	00000097          	auipc	ra,0x0
    80006b24:	028080e7          	jalr	40(ra) # 80006b48 <__printf>
    80006b28:	00002517          	auipc	a0,0x2
    80006b2c:	6e850513          	addi	a0,a0,1768 # 80009210 <CONSOLE_STATUS+0x200>
    80006b30:	00000097          	auipc	ra,0x0
    80006b34:	018080e7          	jalr	24(ra) # 80006b48 <__printf>
    80006b38:	00100793          	li	a5,1
    80006b3c:	00005717          	auipc	a4,0x5
    80006b40:	b6f72e23          	sw	a5,-1156(a4) # 8000b6b8 <panicked>
    80006b44:	0000006f          	j	80006b44 <panic+0x58>

0000000080006b48 <__printf>:
    80006b48:	f3010113          	addi	sp,sp,-208
    80006b4c:	08813023          	sd	s0,128(sp)
    80006b50:	07313423          	sd	s3,104(sp)
    80006b54:	09010413          	addi	s0,sp,144
    80006b58:	05813023          	sd	s8,64(sp)
    80006b5c:	08113423          	sd	ra,136(sp)
    80006b60:	06913c23          	sd	s1,120(sp)
    80006b64:	07213823          	sd	s2,112(sp)
    80006b68:	07413023          	sd	s4,96(sp)
    80006b6c:	05513c23          	sd	s5,88(sp)
    80006b70:	05613823          	sd	s6,80(sp)
    80006b74:	05713423          	sd	s7,72(sp)
    80006b78:	03913c23          	sd	s9,56(sp)
    80006b7c:	03a13823          	sd	s10,48(sp)
    80006b80:	03b13423          	sd	s11,40(sp)
    80006b84:	00006317          	auipc	t1,0x6
    80006b88:	dfc30313          	addi	t1,t1,-516 # 8000c980 <pr>
    80006b8c:	01832c03          	lw	s8,24(t1)
    80006b90:	00b43423          	sd	a1,8(s0)
    80006b94:	00c43823          	sd	a2,16(s0)
    80006b98:	00d43c23          	sd	a3,24(s0)
    80006b9c:	02e43023          	sd	a4,32(s0)
    80006ba0:	02f43423          	sd	a5,40(s0)
    80006ba4:	03043823          	sd	a6,48(s0)
    80006ba8:	03143c23          	sd	a7,56(s0)
    80006bac:	00050993          	mv	s3,a0
    80006bb0:	4a0c1663          	bnez	s8,8000705c <__printf+0x514>
    80006bb4:	60098c63          	beqz	s3,800071cc <__printf+0x684>
    80006bb8:	0009c503          	lbu	a0,0(s3)
    80006bbc:	00840793          	addi	a5,s0,8
    80006bc0:	f6f43c23          	sd	a5,-136(s0)
    80006bc4:	00000493          	li	s1,0
    80006bc8:	22050063          	beqz	a0,80006de8 <__printf+0x2a0>
    80006bcc:	00002a37          	lui	s4,0x2
    80006bd0:	00018ab7          	lui	s5,0x18
    80006bd4:	000f4b37          	lui	s6,0xf4
    80006bd8:	00989bb7          	lui	s7,0x989
    80006bdc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006be0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006be4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006be8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80006bec:	00148c9b          	addiw	s9,s1,1
    80006bf0:	02500793          	li	a5,37
    80006bf4:	01998933          	add	s2,s3,s9
    80006bf8:	38f51263          	bne	a0,a5,80006f7c <__printf+0x434>
    80006bfc:	00094783          	lbu	a5,0(s2)
    80006c00:	00078c9b          	sext.w	s9,a5
    80006c04:	1e078263          	beqz	a5,80006de8 <__printf+0x2a0>
    80006c08:	0024849b          	addiw	s1,s1,2
    80006c0c:	07000713          	li	a4,112
    80006c10:	00998933          	add	s2,s3,s1
    80006c14:	38e78a63          	beq	a5,a4,80006fa8 <__printf+0x460>
    80006c18:	20f76863          	bltu	a4,a5,80006e28 <__printf+0x2e0>
    80006c1c:	42a78863          	beq	a5,a0,8000704c <__printf+0x504>
    80006c20:	06400713          	li	a4,100
    80006c24:	40e79663          	bne	a5,a4,80007030 <__printf+0x4e8>
    80006c28:	f7843783          	ld	a5,-136(s0)
    80006c2c:	0007a603          	lw	a2,0(a5)
    80006c30:	00878793          	addi	a5,a5,8
    80006c34:	f6f43c23          	sd	a5,-136(s0)
    80006c38:	42064a63          	bltz	a2,8000706c <__printf+0x524>
    80006c3c:	00a00713          	li	a4,10
    80006c40:	02e677bb          	remuw	a5,a2,a4
    80006c44:	00003d97          	auipc	s11,0x3
    80006c48:	b4cd8d93          	addi	s11,s11,-1204 # 80009790 <digits>
    80006c4c:	00900593          	li	a1,9
    80006c50:	0006051b          	sext.w	a0,a2
    80006c54:	00000c93          	li	s9,0
    80006c58:	02079793          	slli	a5,a5,0x20
    80006c5c:	0207d793          	srli	a5,a5,0x20
    80006c60:	00fd87b3          	add	a5,s11,a5
    80006c64:	0007c783          	lbu	a5,0(a5)
    80006c68:	02e656bb          	divuw	a3,a2,a4
    80006c6c:	f8f40023          	sb	a5,-128(s0)
    80006c70:	14c5d863          	bge	a1,a2,80006dc0 <__printf+0x278>
    80006c74:	06300593          	li	a1,99
    80006c78:	00100c93          	li	s9,1
    80006c7c:	02e6f7bb          	remuw	a5,a3,a4
    80006c80:	02079793          	slli	a5,a5,0x20
    80006c84:	0207d793          	srli	a5,a5,0x20
    80006c88:	00fd87b3          	add	a5,s11,a5
    80006c8c:	0007c783          	lbu	a5,0(a5)
    80006c90:	02e6d73b          	divuw	a4,a3,a4
    80006c94:	f8f400a3          	sb	a5,-127(s0)
    80006c98:	12a5f463          	bgeu	a1,a0,80006dc0 <__printf+0x278>
    80006c9c:	00a00693          	li	a3,10
    80006ca0:	00900593          	li	a1,9
    80006ca4:	02d777bb          	remuw	a5,a4,a3
    80006ca8:	02079793          	slli	a5,a5,0x20
    80006cac:	0207d793          	srli	a5,a5,0x20
    80006cb0:	00fd87b3          	add	a5,s11,a5
    80006cb4:	0007c503          	lbu	a0,0(a5)
    80006cb8:	02d757bb          	divuw	a5,a4,a3
    80006cbc:	f8a40123          	sb	a0,-126(s0)
    80006cc0:	48e5f263          	bgeu	a1,a4,80007144 <__printf+0x5fc>
    80006cc4:	06300513          	li	a0,99
    80006cc8:	02d7f5bb          	remuw	a1,a5,a3
    80006ccc:	02059593          	slli	a1,a1,0x20
    80006cd0:	0205d593          	srli	a1,a1,0x20
    80006cd4:	00bd85b3          	add	a1,s11,a1
    80006cd8:	0005c583          	lbu	a1,0(a1)
    80006cdc:	02d7d7bb          	divuw	a5,a5,a3
    80006ce0:	f8b401a3          	sb	a1,-125(s0)
    80006ce4:	48e57263          	bgeu	a0,a4,80007168 <__printf+0x620>
    80006ce8:	3e700513          	li	a0,999
    80006cec:	02d7f5bb          	remuw	a1,a5,a3
    80006cf0:	02059593          	slli	a1,a1,0x20
    80006cf4:	0205d593          	srli	a1,a1,0x20
    80006cf8:	00bd85b3          	add	a1,s11,a1
    80006cfc:	0005c583          	lbu	a1,0(a1)
    80006d00:	02d7d7bb          	divuw	a5,a5,a3
    80006d04:	f8b40223          	sb	a1,-124(s0)
    80006d08:	46e57663          	bgeu	a0,a4,80007174 <__printf+0x62c>
    80006d0c:	02d7f5bb          	remuw	a1,a5,a3
    80006d10:	02059593          	slli	a1,a1,0x20
    80006d14:	0205d593          	srli	a1,a1,0x20
    80006d18:	00bd85b3          	add	a1,s11,a1
    80006d1c:	0005c583          	lbu	a1,0(a1)
    80006d20:	02d7d7bb          	divuw	a5,a5,a3
    80006d24:	f8b402a3          	sb	a1,-123(s0)
    80006d28:	46ea7863          	bgeu	s4,a4,80007198 <__printf+0x650>
    80006d2c:	02d7f5bb          	remuw	a1,a5,a3
    80006d30:	02059593          	slli	a1,a1,0x20
    80006d34:	0205d593          	srli	a1,a1,0x20
    80006d38:	00bd85b3          	add	a1,s11,a1
    80006d3c:	0005c583          	lbu	a1,0(a1)
    80006d40:	02d7d7bb          	divuw	a5,a5,a3
    80006d44:	f8b40323          	sb	a1,-122(s0)
    80006d48:	3eeaf863          	bgeu	s5,a4,80007138 <__printf+0x5f0>
    80006d4c:	02d7f5bb          	remuw	a1,a5,a3
    80006d50:	02059593          	slli	a1,a1,0x20
    80006d54:	0205d593          	srli	a1,a1,0x20
    80006d58:	00bd85b3          	add	a1,s11,a1
    80006d5c:	0005c583          	lbu	a1,0(a1)
    80006d60:	02d7d7bb          	divuw	a5,a5,a3
    80006d64:	f8b403a3          	sb	a1,-121(s0)
    80006d68:	42eb7e63          	bgeu	s6,a4,800071a4 <__printf+0x65c>
    80006d6c:	02d7f5bb          	remuw	a1,a5,a3
    80006d70:	02059593          	slli	a1,a1,0x20
    80006d74:	0205d593          	srli	a1,a1,0x20
    80006d78:	00bd85b3          	add	a1,s11,a1
    80006d7c:	0005c583          	lbu	a1,0(a1)
    80006d80:	02d7d7bb          	divuw	a5,a5,a3
    80006d84:	f8b40423          	sb	a1,-120(s0)
    80006d88:	42ebfc63          	bgeu	s7,a4,800071c0 <__printf+0x678>
    80006d8c:	02079793          	slli	a5,a5,0x20
    80006d90:	0207d793          	srli	a5,a5,0x20
    80006d94:	00fd8db3          	add	s11,s11,a5
    80006d98:	000dc703          	lbu	a4,0(s11)
    80006d9c:	00a00793          	li	a5,10
    80006da0:	00900c93          	li	s9,9
    80006da4:	f8e404a3          	sb	a4,-119(s0)
    80006da8:	00065c63          	bgez	a2,80006dc0 <__printf+0x278>
    80006dac:	f9040713          	addi	a4,s0,-112
    80006db0:	00f70733          	add	a4,a4,a5
    80006db4:	02d00693          	li	a3,45
    80006db8:	fed70823          	sb	a3,-16(a4)
    80006dbc:	00078c93          	mv	s9,a5
    80006dc0:	f8040793          	addi	a5,s0,-128
    80006dc4:	01978cb3          	add	s9,a5,s9
    80006dc8:	f7f40d13          	addi	s10,s0,-129
    80006dcc:	000cc503          	lbu	a0,0(s9)
    80006dd0:	fffc8c93          	addi	s9,s9,-1
    80006dd4:	00000097          	auipc	ra,0x0
    80006dd8:	b90080e7          	jalr	-1136(ra) # 80006964 <consputc>
    80006ddc:	ffac98e3          	bne	s9,s10,80006dcc <__printf+0x284>
    80006de0:	00094503          	lbu	a0,0(s2)
    80006de4:	e00514e3          	bnez	a0,80006bec <__printf+0xa4>
    80006de8:	1a0c1663          	bnez	s8,80006f94 <__printf+0x44c>
    80006dec:	08813083          	ld	ra,136(sp)
    80006df0:	08013403          	ld	s0,128(sp)
    80006df4:	07813483          	ld	s1,120(sp)
    80006df8:	07013903          	ld	s2,112(sp)
    80006dfc:	06813983          	ld	s3,104(sp)
    80006e00:	06013a03          	ld	s4,96(sp)
    80006e04:	05813a83          	ld	s5,88(sp)
    80006e08:	05013b03          	ld	s6,80(sp)
    80006e0c:	04813b83          	ld	s7,72(sp)
    80006e10:	04013c03          	ld	s8,64(sp)
    80006e14:	03813c83          	ld	s9,56(sp)
    80006e18:	03013d03          	ld	s10,48(sp)
    80006e1c:	02813d83          	ld	s11,40(sp)
    80006e20:	0d010113          	addi	sp,sp,208
    80006e24:	00008067          	ret
    80006e28:	07300713          	li	a4,115
    80006e2c:	1ce78a63          	beq	a5,a4,80007000 <__printf+0x4b8>
    80006e30:	07800713          	li	a4,120
    80006e34:	1ee79e63          	bne	a5,a4,80007030 <__printf+0x4e8>
    80006e38:	f7843783          	ld	a5,-136(s0)
    80006e3c:	0007a703          	lw	a4,0(a5)
    80006e40:	00878793          	addi	a5,a5,8
    80006e44:	f6f43c23          	sd	a5,-136(s0)
    80006e48:	28074263          	bltz	a4,800070cc <__printf+0x584>
    80006e4c:	00003d97          	auipc	s11,0x3
    80006e50:	944d8d93          	addi	s11,s11,-1724 # 80009790 <digits>
    80006e54:	00f77793          	andi	a5,a4,15
    80006e58:	00fd87b3          	add	a5,s11,a5
    80006e5c:	0007c683          	lbu	a3,0(a5)
    80006e60:	00f00613          	li	a2,15
    80006e64:	0007079b          	sext.w	a5,a4
    80006e68:	f8d40023          	sb	a3,-128(s0)
    80006e6c:	0047559b          	srliw	a1,a4,0x4
    80006e70:	0047569b          	srliw	a3,a4,0x4
    80006e74:	00000c93          	li	s9,0
    80006e78:	0ee65063          	bge	a2,a4,80006f58 <__printf+0x410>
    80006e7c:	00f6f693          	andi	a3,a3,15
    80006e80:	00dd86b3          	add	a3,s11,a3
    80006e84:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006e88:	0087d79b          	srliw	a5,a5,0x8
    80006e8c:	00100c93          	li	s9,1
    80006e90:	f8d400a3          	sb	a3,-127(s0)
    80006e94:	0cb67263          	bgeu	a2,a1,80006f58 <__printf+0x410>
    80006e98:	00f7f693          	andi	a3,a5,15
    80006e9c:	00dd86b3          	add	a3,s11,a3
    80006ea0:	0006c583          	lbu	a1,0(a3)
    80006ea4:	00f00613          	li	a2,15
    80006ea8:	0047d69b          	srliw	a3,a5,0x4
    80006eac:	f8b40123          	sb	a1,-126(s0)
    80006eb0:	0047d593          	srli	a1,a5,0x4
    80006eb4:	28f67e63          	bgeu	a2,a5,80007150 <__printf+0x608>
    80006eb8:	00f6f693          	andi	a3,a3,15
    80006ebc:	00dd86b3          	add	a3,s11,a3
    80006ec0:	0006c503          	lbu	a0,0(a3)
    80006ec4:	0087d813          	srli	a6,a5,0x8
    80006ec8:	0087d69b          	srliw	a3,a5,0x8
    80006ecc:	f8a401a3          	sb	a0,-125(s0)
    80006ed0:	28b67663          	bgeu	a2,a1,8000715c <__printf+0x614>
    80006ed4:	00f6f693          	andi	a3,a3,15
    80006ed8:	00dd86b3          	add	a3,s11,a3
    80006edc:	0006c583          	lbu	a1,0(a3)
    80006ee0:	00c7d513          	srli	a0,a5,0xc
    80006ee4:	00c7d69b          	srliw	a3,a5,0xc
    80006ee8:	f8b40223          	sb	a1,-124(s0)
    80006eec:	29067a63          	bgeu	a2,a6,80007180 <__printf+0x638>
    80006ef0:	00f6f693          	andi	a3,a3,15
    80006ef4:	00dd86b3          	add	a3,s11,a3
    80006ef8:	0006c583          	lbu	a1,0(a3)
    80006efc:	0107d813          	srli	a6,a5,0x10
    80006f00:	0107d69b          	srliw	a3,a5,0x10
    80006f04:	f8b402a3          	sb	a1,-123(s0)
    80006f08:	28a67263          	bgeu	a2,a0,8000718c <__printf+0x644>
    80006f0c:	00f6f693          	andi	a3,a3,15
    80006f10:	00dd86b3          	add	a3,s11,a3
    80006f14:	0006c683          	lbu	a3,0(a3)
    80006f18:	0147d79b          	srliw	a5,a5,0x14
    80006f1c:	f8d40323          	sb	a3,-122(s0)
    80006f20:	21067663          	bgeu	a2,a6,8000712c <__printf+0x5e4>
    80006f24:	02079793          	slli	a5,a5,0x20
    80006f28:	0207d793          	srli	a5,a5,0x20
    80006f2c:	00fd8db3          	add	s11,s11,a5
    80006f30:	000dc683          	lbu	a3,0(s11)
    80006f34:	00800793          	li	a5,8
    80006f38:	00700c93          	li	s9,7
    80006f3c:	f8d403a3          	sb	a3,-121(s0)
    80006f40:	00075c63          	bgez	a4,80006f58 <__printf+0x410>
    80006f44:	f9040713          	addi	a4,s0,-112
    80006f48:	00f70733          	add	a4,a4,a5
    80006f4c:	02d00693          	li	a3,45
    80006f50:	fed70823          	sb	a3,-16(a4)
    80006f54:	00078c93          	mv	s9,a5
    80006f58:	f8040793          	addi	a5,s0,-128
    80006f5c:	01978cb3          	add	s9,a5,s9
    80006f60:	f7f40d13          	addi	s10,s0,-129
    80006f64:	000cc503          	lbu	a0,0(s9)
    80006f68:	fffc8c93          	addi	s9,s9,-1
    80006f6c:	00000097          	auipc	ra,0x0
    80006f70:	9f8080e7          	jalr	-1544(ra) # 80006964 <consputc>
    80006f74:	ff9d18e3          	bne	s10,s9,80006f64 <__printf+0x41c>
    80006f78:	0100006f          	j	80006f88 <__printf+0x440>
    80006f7c:	00000097          	auipc	ra,0x0
    80006f80:	9e8080e7          	jalr	-1560(ra) # 80006964 <consputc>
    80006f84:	000c8493          	mv	s1,s9
    80006f88:	00094503          	lbu	a0,0(s2)
    80006f8c:	c60510e3          	bnez	a0,80006bec <__printf+0xa4>
    80006f90:	e40c0ee3          	beqz	s8,80006dec <__printf+0x2a4>
    80006f94:	00006517          	auipc	a0,0x6
    80006f98:	9ec50513          	addi	a0,a0,-1556 # 8000c980 <pr>
    80006f9c:	00001097          	auipc	ra,0x1
    80006fa0:	94c080e7          	jalr	-1716(ra) # 800078e8 <release>
    80006fa4:	e49ff06f          	j	80006dec <__printf+0x2a4>
    80006fa8:	f7843783          	ld	a5,-136(s0)
    80006fac:	03000513          	li	a0,48
    80006fb0:	01000d13          	li	s10,16
    80006fb4:	00878713          	addi	a4,a5,8
    80006fb8:	0007bc83          	ld	s9,0(a5)
    80006fbc:	f6e43c23          	sd	a4,-136(s0)
    80006fc0:	00000097          	auipc	ra,0x0
    80006fc4:	9a4080e7          	jalr	-1628(ra) # 80006964 <consputc>
    80006fc8:	07800513          	li	a0,120
    80006fcc:	00000097          	auipc	ra,0x0
    80006fd0:	998080e7          	jalr	-1640(ra) # 80006964 <consputc>
    80006fd4:	00002d97          	auipc	s11,0x2
    80006fd8:	7bcd8d93          	addi	s11,s11,1980 # 80009790 <digits>
    80006fdc:	03ccd793          	srli	a5,s9,0x3c
    80006fe0:	00fd87b3          	add	a5,s11,a5
    80006fe4:	0007c503          	lbu	a0,0(a5)
    80006fe8:	fffd0d1b          	addiw	s10,s10,-1
    80006fec:	004c9c93          	slli	s9,s9,0x4
    80006ff0:	00000097          	auipc	ra,0x0
    80006ff4:	974080e7          	jalr	-1676(ra) # 80006964 <consputc>
    80006ff8:	fe0d12e3          	bnez	s10,80006fdc <__printf+0x494>
    80006ffc:	f8dff06f          	j	80006f88 <__printf+0x440>
    80007000:	f7843783          	ld	a5,-136(s0)
    80007004:	0007bc83          	ld	s9,0(a5)
    80007008:	00878793          	addi	a5,a5,8
    8000700c:	f6f43c23          	sd	a5,-136(s0)
    80007010:	000c9a63          	bnez	s9,80007024 <__printf+0x4dc>
    80007014:	1080006f          	j	8000711c <__printf+0x5d4>
    80007018:	001c8c93          	addi	s9,s9,1
    8000701c:	00000097          	auipc	ra,0x0
    80007020:	948080e7          	jalr	-1720(ra) # 80006964 <consputc>
    80007024:	000cc503          	lbu	a0,0(s9)
    80007028:	fe0518e3          	bnez	a0,80007018 <__printf+0x4d0>
    8000702c:	f5dff06f          	j	80006f88 <__printf+0x440>
    80007030:	02500513          	li	a0,37
    80007034:	00000097          	auipc	ra,0x0
    80007038:	930080e7          	jalr	-1744(ra) # 80006964 <consputc>
    8000703c:	000c8513          	mv	a0,s9
    80007040:	00000097          	auipc	ra,0x0
    80007044:	924080e7          	jalr	-1756(ra) # 80006964 <consputc>
    80007048:	f41ff06f          	j	80006f88 <__printf+0x440>
    8000704c:	02500513          	li	a0,37
    80007050:	00000097          	auipc	ra,0x0
    80007054:	914080e7          	jalr	-1772(ra) # 80006964 <consputc>
    80007058:	f31ff06f          	j	80006f88 <__printf+0x440>
    8000705c:	00030513          	mv	a0,t1
    80007060:	00000097          	auipc	ra,0x0
    80007064:	7bc080e7          	jalr	1980(ra) # 8000781c <acquire>
    80007068:	b4dff06f          	j	80006bb4 <__printf+0x6c>
    8000706c:	40c0053b          	negw	a0,a2
    80007070:	00a00713          	li	a4,10
    80007074:	02e576bb          	remuw	a3,a0,a4
    80007078:	00002d97          	auipc	s11,0x2
    8000707c:	718d8d93          	addi	s11,s11,1816 # 80009790 <digits>
    80007080:	ff700593          	li	a1,-9
    80007084:	02069693          	slli	a3,a3,0x20
    80007088:	0206d693          	srli	a3,a3,0x20
    8000708c:	00dd86b3          	add	a3,s11,a3
    80007090:	0006c683          	lbu	a3,0(a3)
    80007094:	02e557bb          	divuw	a5,a0,a4
    80007098:	f8d40023          	sb	a3,-128(s0)
    8000709c:	10b65e63          	bge	a2,a1,800071b8 <__printf+0x670>
    800070a0:	06300593          	li	a1,99
    800070a4:	02e7f6bb          	remuw	a3,a5,a4
    800070a8:	02069693          	slli	a3,a3,0x20
    800070ac:	0206d693          	srli	a3,a3,0x20
    800070b0:	00dd86b3          	add	a3,s11,a3
    800070b4:	0006c683          	lbu	a3,0(a3)
    800070b8:	02e7d73b          	divuw	a4,a5,a4
    800070bc:	00200793          	li	a5,2
    800070c0:	f8d400a3          	sb	a3,-127(s0)
    800070c4:	bca5ece3          	bltu	a1,a0,80006c9c <__printf+0x154>
    800070c8:	ce5ff06f          	j	80006dac <__printf+0x264>
    800070cc:	40e007bb          	negw	a5,a4
    800070d0:	00002d97          	auipc	s11,0x2
    800070d4:	6c0d8d93          	addi	s11,s11,1728 # 80009790 <digits>
    800070d8:	00f7f693          	andi	a3,a5,15
    800070dc:	00dd86b3          	add	a3,s11,a3
    800070e0:	0006c583          	lbu	a1,0(a3)
    800070e4:	ff100613          	li	a2,-15
    800070e8:	0047d69b          	srliw	a3,a5,0x4
    800070ec:	f8b40023          	sb	a1,-128(s0)
    800070f0:	0047d59b          	srliw	a1,a5,0x4
    800070f4:	0ac75e63          	bge	a4,a2,800071b0 <__printf+0x668>
    800070f8:	00f6f693          	andi	a3,a3,15
    800070fc:	00dd86b3          	add	a3,s11,a3
    80007100:	0006c603          	lbu	a2,0(a3)
    80007104:	00f00693          	li	a3,15
    80007108:	0087d79b          	srliw	a5,a5,0x8
    8000710c:	f8c400a3          	sb	a2,-127(s0)
    80007110:	d8b6e4e3          	bltu	a3,a1,80006e98 <__printf+0x350>
    80007114:	00200793          	li	a5,2
    80007118:	e2dff06f          	j	80006f44 <__printf+0x3fc>
    8000711c:	00002c97          	auipc	s9,0x2
    80007120:	654c8c93          	addi	s9,s9,1620 # 80009770 <CONSOLE_STATUS+0x760>
    80007124:	02800513          	li	a0,40
    80007128:	ef1ff06f          	j	80007018 <__printf+0x4d0>
    8000712c:	00700793          	li	a5,7
    80007130:	00600c93          	li	s9,6
    80007134:	e0dff06f          	j	80006f40 <__printf+0x3f8>
    80007138:	00700793          	li	a5,7
    8000713c:	00600c93          	li	s9,6
    80007140:	c69ff06f          	j	80006da8 <__printf+0x260>
    80007144:	00300793          	li	a5,3
    80007148:	00200c93          	li	s9,2
    8000714c:	c5dff06f          	j	80006da8 <__printf+0x260>
    80007150:	00300793          	li	a5,3
    80007154:	00200c93          	li	s9,2
    80007158:	de9ff06f          	j	80006f40 <__printf+0x3f8>
    8000715c:	00400793          	li	a5,4
    80007160:	00300c93          	li	s9,3
    80007164:	dddff06f          	j	80006f40 <__printf+0x3f8>
    80007168:	00400793          	li	a5,4
    8000716c:	00300c93          	li	s9,3
    80007170:	c39ff06f          	j	80006da8 <__printf+0x260>
    80007174:	00500793          	li	a5,5
    80007178:	00400c93          	li	s9,4
    8000717c:	c2dff06f          	j	80006da8 <__printf+0x260>
    80007180:	00500793          	li	a5,5
    80007184:	00400c93          	li	s9,4
    80007188:	db9ff06f          	j	80006f40 <__printf+0x3f8>
    8000718c:	00600793          	li	a5,6
    80007190:	00500c93          	li	s9,5
    80007194:	dadff06f          	j	80006f40 <__printf+0x3f8>
    80007198:	00600793          	li	a5,6
    8000719c:	00500c93          	li	s9,5
    800071a0:	c09ff06f          	j	80006da8 <__printf+0x260>
    800071a4:	00800793          	li	a5,8
    800071a8:	00700c93          	li	s9,7
    800071ac:	bfdff06f          	j	80006da8 <__printf+0x260>
    800071b0:	00100793          	li	a5,1
    800071b4:	d91ff06f          	j	80006f44 <__printf+0x3fc>
    800071b8:	00100793          	li	a5,1
    800071bc:	bf1ff06f          	j	80006dac <__printf+0x264>
    800071c0:	00900793          	li	a5,9
    800071c4:	00800c93          	li	s9,8
    800071c8:	be1ff06f          	j	80006da8 <__printf+0x260>
    800071cc:	00002517          	auipc	a0,0x2
    800071d0:	5ac50513          	addi	a0,a0,1452 # 80009778 <CONSOLE_STATUS+0x768>
    800071d4:	00000097          	auipc	ra,0x0
    800071d8:	918080e7          	jalr	-1768(ra) # 80006aec <panic>

00000000800071dc <printfinit>:
    800071dc:	fe010113          	addi	sp,sp,-32
    800071e0:	00813823          	sd	s0,16(sp)
    800071e4:	00913423          	sd	s1,8(sp)
    800071e8:	00113c23          	sd	ra,24(sp)
    800071ec:	02010413          	addi	s0,sp,32
    800071f0:	00005497          	auipc	s1,0x5
    800071f4:	79048493          	addi	s1,s1,1936 # 8000c980 <pr>
    800071f8:	00048513          	mv	a0,s1
    800071fc:	00002597          	auipc	a1,0x2
    80007200:	58c58593          	addi	a1,a1,1420 # 80009788 <CONSOLE_STATUS+0x778>
    80007204:	00000097          	auipc	ra,0x0
    80007208:	5f4080e7          	jalr	1524(ra) # 800077f8 <initlock>
    8000720c:	01813083          	ld	ra,24(sp)
    80007210:	01013403          	ld	s0,16(sp)
    80007214:	0004ac23          	sw	zero,24(s1)
    80007218:	00813483          	ld	s1,8(sp)
    8000721c:	02010113          	addi	sp,sp,32
    80007220:	00008067          	ret

0000000080007224 <uartinit>:
    80007224:	ff010113          	addi	sp,sp,-16
    80007228:	00813423          	sd	s0,8(sp)
    8000722c:	01010413          	addi	s0,sp,16
    80007230:	100007b7          	lui	a5,0x10000
    80007234:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007238:	f8000713          	li	a4,-128
    8000723c:	00e781a3          	sb	a4,3(a5)
    80007240:	00300713          	li	a4,3
    80007244:	00e78023          	sb	a4,0(a5)
    80007248:	000780a3          	sb	zero,1(a5)
    8000724c:	00e781a3          	sb	a4,3(a5)
    80007250:	00700693          	li	a3,7
    80007254:	00d78123          	sb	a3,2(a5)
    80007258:	00e780a3          	sb	a4,1(a5)
    8000725c:	00813403          	ld	s0,8(sp)
    80007260:	01010113          	addi	sp,sp,16
    80007264:	00008067          	ret

0000000080007268 <uartputc>:
    80007268:	00004797          	auipc	a5,0x4
    8000726c:	4507a783          	lw	a5,1104(a5) # 8000b6b8 <panicked>
    80007270:	00078463          	beqz	a5,80007278 <uartputc+0x10>
    80007274:	0000006f          	j	80007274 <uartputc+0xc>
    80007278:	fd010113          	addi	sp,sp,-48
    8000727c:	02813023          	sd	s0,32(sp)
    80007280:	00913c23          	sd	s1,24(sp)
    80007284:	01213823          	sd	s2,16(sp)
    80007288:	01313423          	sd	s3,8(sp)
    8000728c:	02113423          	sd	ra,40(sp)
    80007290:	03010413          	addi	s0,sp,48
    80007294:	00004917          	auipc	s2,0x4
    80007298:	42c90913          	addi	s2,s2,1068 # 8000b6c0 <uart_tx_r>
    8000729c:	00093783          	ld	a5,0(s2)
    800072a0:	00004497          	auipc	s1,0x4
    800072a4:	42848493          	addi	s1,s1,1064 # 8000b6c8 <uart_tx_w>
    800072a8:	0004b703          	ld	a4,0(s1)
    800072ac:	02078693          	addi	a3,a5,32
    800072b0:	00050993          	mv	s3,a0
    800072b4:	02e69c63          	bne	a3,a4,800072ec <uartputc+0x84>
    800072b8:	00001097          	auipc	ra,0x1
    800072bc:	834080e7          	jalr	-1996(ra) # 80007aec <push_on>
    800072c0:	00093783          	ld	a5,0(s2)
    800072c4:	0004b703          	ld	a4,0(s1)
    800072c8:	02078793          	addi	a5,a5,32
    800072cc:	00e79463          	bne	a5,a4,800072d4 <uartputc+0x6c>
    800072d0:	0000006f          	j	800072d0 <uartputc+0x68>
    800072d4:	00001097          	auipc	ra,0x1
    800072d8:	88c080e7          	jalr	-1908(ra) # 80007b60 <pop_on>
    800072dc:	00093783          	ld	a5,0(s2)
    800072e0:	0004b703          	ld	a4,0(s1)
    800072e4:	02078693          	addi	a3,a5,32
    800072e8:	fce688e3          	beq	a3,a4,800072b8 <uartputc+0x50>
    800072ec:	01f77693          	andi	a3,a4,31
    800072f0:	00005597          	auipc	a1,0x5
    800072f4:	6b058593          	addi	a1,a1,1712 # 8000c9a0 <uart_tx_buf>
    800072f8:	00d586b3          	add	a3,a1,a3
    800072fc:	00170713          	addi	a4,a4,1
    80007300:	01368023          	sb	s3,0(a3)
    80007304:	00e4b023          	sd	a4,0(s1)
    80007308:	10000637          	lui	a2,0x10000
    8000730c:	02f71063          	bne	a4,a5,8000732c <uartputc+0xc4>
    80007310:	0340006f          	j	80007344 <uartputc+0xdc>
    80007314:	00074703          	lbu	a4,0(a4)
    80007318:	00f93023          	sd	a5,0(s2)
    8000731c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007320:	00093783          	ld	a5,0(s2)
    80007324:	0004b703          	ld	a4,0(s1)
    80007328:	00f70e63          	beq	a4,a5,80007344 <uartputc+0xdc>
    8000732c:	00564683          	lbu	a3,5(a2)
    80007330:	01f7f713          	andi	a4,a5,31
    80007334:	00e58733          	add	a4,a1,a4
    80007338:	0206f693          	andi	a3,a3,32
    8000733c:	00178793          	addi	a5,a5,1
    80007340:	fc069ae3          	bnez	a3,80007314 <uartputc+0xac>
    80007344:	02813083          	ld	ra,40(sp)
    80007348:	02013403          	ld	s0,32(sp)
    8000734c:	01813483          	ld	s1,24(sp)
    80007350:	01013903          	ld	s2,16(sp)
    80007354:	00813983          	ld	s3,8(sp)
    80007358:	03010113          	addi	sp,sp,48
    8000735c:	00008067          	ret

0000000080007360 <uartputc_sync>:
    80007360:	ff010113          	addi	sp,sp,-16
    80007364:	00813423          	sd	s0,8(sp)
    80007368:	01010413          	addi	s0,sp,16
    8000736c:	00004717          	auipc	a4,0x4
    80007370:	34c72703          	lw	a4,844(a4) # 8000b6b8 <panicked>
    80007374:	02071663          	bnez	a4,800073a0 <uartputc_sync+0x40>
    80007378:	00050793          	mv	a5,a0
    8000737c:	100006b7          	lui	a3,0x10000
    80007380:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007384:	02077713          	andi	a4,a4,32
    80007388:	fe070ce3          	beqz	a4,80007380 <uartputc_sync+0x20>
    8000738c:	0ff7f793          	andi	a5,a5,255
    80007390:	00f68023          	sb	a5,0(a3)
    80007394:	00813403          	ld	s0,8(sp)
    80007398:	01010113          	addi	sp,sp,16
    8000739c:	00008067          	ret
    800073a0:	0000006f          	j	800073a0 <uartputc_sync+0x40>

00000000800073a4 <uartstart>:
    800073a4:	ff010113          	addi	sp,sp,-16
    800073a8:	00813423          	sd	s0,8(sp)
    800073ac:	01010413          	addi	s0,sp,16
    800073b0:	00004617          	auipc	a2,0x4
    800073b4:	31060613          	addi	a2,a2,784 # 8000b6c0 <uart_tx_r>
    800073b8:	00004517          	auipc	a0,0x4
    800073bc:	31050513          	addi	a0,a0,784 # 8000b6c8 <uart_tx_w>
    800073c0:	00063783          	ld	a5,0(a2)
    800073c4:	00053703          	ld	a4,0(a0)
    800073c8:	04f70263          	beq	a4,a5,8000740c <uartstart+0x68>
    800073cc:	100005b7          	lui	a1,0x10000
    800073d0:	00005817          	auipc	a6,0x5
    800073d4:	5d080813          	addi	a6,a6,1488 # 8000c9a0 <uart_tx_buf>
    800073d8:	01c0006f          	j	800073f4 <uartstart+0x50>
    800073dc:	0006c703          	lbu	a4,0(a3)
    800073e0:	00f63023          	sd	a5,0(a2)
    800073e4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800073e8:	00063783          	ld	a5,0(a2)
    800073ec:	00053703          	ld	a4,0(a0)
    800073f0:	00f70e63          	beq	a4,a5,8000740c <uartstart+0x68>
    800073f4:	01f7f713          	andi	a4,a5,31
    800073f8:	00e806b3          	add	a3,a6,a4
    800073fc:	0055c703          	lbu	a4,5(a1)
    80007400:	00178793          	addi	a5,a5,1
    80007404:	02077713          	andi	a4,a4,32
    80007408:	fc071ae3          	bnez	a4,800073dc <uartstart+0x38>
    8000740c:	00813403          	ld	s0,8(sp)
    80007410:	01010113          	addi	sp,sp,16
    80007414:	00008067          	ret

0000000080007418 <uartgetc>:
    80007418:	ff010113          	addi	sp,sp,-16
    8000741c:	00813423          	sd	s0,8(sp)
    80007420:	01010413          	addi	s0,sp,16
    80007424:	10000737          	lui	a4,0x10000
    80007428:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000742c:	0017f793          	andi	a5,a5,1
    80007430:	00078c63          	beqz	a5,80007448 <uartgetc+0x30>
    80007434:	00074503          	lbu	a0,0(a4)
    80007438:	0ff57513          	andi	a0,a0,255
    8000743c:	00813403          	ld	s0,8(sp)
    80007440:	01010113          	addi	sp,sp,16
    80007444:	00008067          	ret
    80007448:	fff00513          	li	a0,-1
    8000744c:	ff1ff06f          	j	8000743c <uartgetc+0x24>

0000000080007450 <uartintr>:
    80007450:	100007b7          	lui	a5,0x10000
    80007454:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007458:	0017f793          	andi	a5,a5,1
    8000745c:	0a078463          	beqz	a5,80007504 <uartintr+0xb4>
    80007460:	fe010113          	addi	sp,sp,-32
    80007464:	00813823          	sd	s0,16(sp)
    80007468:	00913423          	sd	s1,8(sp)
    8000746c:	00113c23          	sd	ra,24(sp)
    80007470:	02010413          	addi	s0,sp,32
    80007474:	100004b7          	lui	s1,0x10000
    80007478:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000747c:	0ff57513          	andi	a0,a0,255
    80007480:	fffff097          	auipc	ra,0xfffff
    80007484:	534080e7          	jalr	1332(ra) # 800069b4 <consoleintr>
    80007488:	0054c783          	lbu	a5,5(s1)
    8000748c:	0017f793          	andi	a5,a5,1
    80007490:	fe0794e3          	bnez	a5,80007478 <uartintr+0x28>
    80007494:	00004617          	auipc	a2,0x4
    80007498:	22c60613          	addi	a2,a2,556 # 8000b6c0 <uart_tx_r>
    8000749c:	00004517          	auipc	a0,0x4
    800074a0:	22c50513          	addi	a0,a0,556 # 8000b6c8 <uart_tx_w>
    800074a4:	00063783          	ld	a5,0(a2)
    800074a8:	00053703          	ld	a4,0(a0)
    800074ac:	04f70263          	beq	a4,a5,800074f0 <uartintr+0xa0>
    800074b0:	100005b7          	lui	a1,0x10000
    800074b4:	00005817          	auipc	a6,0x5
    800074b8:	4ec80813          	addi	a6,a6,1260 # 8000c9a0 <uart_tx_buf>
    800074bc:	01c0006f          	j	800074d8 <uartintr+0x88>
    800074c0:	0006c703          	lbu	a4,0(a3)
    800074c4:	00f63023          	sd	a5,0(a2)
    800074c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800074cc:	00063783          	ld	a5,0(a2)
    800074d0:	00053703          	ld	a4,0(a0)
    800074d4:	00f70e63          	beq	a4,a5,800074f0 <uartintr+0xa0>
    800074d8:	01f7f713          	andi	a4,a5,31
    800074dc:	00e806b3          	add	a3,a6,a4
    800074e0:	0055c703          	lbu	a4,5(a1)
    800074e4:	00178793          	addi	a5,a5,1
    800074e8:	02077713          	andi	a4,a4,32
    800074ec:	fc071ae3          	bnez	a4,800074c0 <uartintr+0x70>
    800074f0:	01813083          	ld	ra,24(sp)
    800074f4:	01013403          	ld	s0,16(sp)
    800074f8:	00813483          	ld	s1,8(sp)
    800074fc:	02010113          	addi	sp,sp,32
    80007500:	00008067          	ret
    80007504:	00004617          	auipc	a2,0x4
    80007508:	1bc60613          	addi	a2,a2,444 # 8000b6c0 <uart_tx_r>
    8000750c:	00004517          	auipc	a0,0x4
    80007510:	1bc50513          	addi	a0,a0,444 # 8000b6c8 <uart_tx_w>
    80007514:	00063783          	ld	a5,0(a2)
    80007518:	00053703          	ld	a4,0(a0)
    8000751c:	04f70263          	beq	a4,a5,80007560 <uartintr+0x110>
    80007520:	100005b7          	lui	a1,0x10000
    80007524:	00005817          	auipc	a6,0x5
    80007528:	47c80813          	addi	a6,a6,1148 # 8000c9a0 <uart_tx_buf>
    8000752c:	01c0006f          	j	80007548 <uartintr+0xf8>
    80007530:	0006c703          	lbu	a4,0(a3)
    80007534:	00f63023          	sd	a5,0(a2)
    80007538:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000753c:	00063783          	ld	a5,0(a2)
    80007540:	00053703          	ld	a4,0(a0)
    80007544:	02f70063          	beq	a4,a5,80007564 <uartintr+0x114>
    80007548:	01f7f713          	andi	a4,a5,31
    8000754c:	00e806b3          	add	a3,a6,a4
    80007550:	0055c703          	lbu	a4,5(a1)
    80007554:	00178793          	addi	a5,a5,1
    80007558:	02077713          	andi	a4,a4,32
    8000755c:	fc071ae3          	bnez	a4,80007530 <uartintr+0xe0>
    80007560:	00008067          	ret
    80007564:	00008067          	ret

0000000080007568 <kinit>:
    80007568:	fc010113          	addi	sp,sp,-64
    8000756c:	02913423          	sd	s1,40(sp)
    80007570:	fffff7b7          	lui	a5,0xfffff
    80007574:	00006497          	auipc	s1,0x6
    80007578:	44b48493          	addi	s1,s1,1099 # 8000d9bf <end+0xfff>
    8000757c:	02813823          	sd	s0,48(sp)
    80007580:	01313c23          	sd	s3,24(sp)
    80007584:	00f4f4b3          	and	s1,s1,a5
    80007588:	02113c23          	sd	ra,56(sp)
    8000758c:	03213023          	sd	s2,32(sp)
    80007590:	01413823          	sd	s4,16(sp)
    80007594:	01513423          	sd	s5,8(sp)
    80007598:	04010413          	addi	s0,sp,64
    8000759c:	000017b7          	lui	a5,0x1
    800075a0:	01100993          	li	s3,17
    800075a4:	00f487b3          	add	a5,s1,a5
    800075a8:	01b99993          	slli	s3,s3,0x1b
    800075ac:	06f9e063          	bltu	s3,a5,8000760c <kinit+0xa4>
    800075b0:	00005a97          	auipc	s5,0x5
    800075b4:	410a8a93          	addi	s5,s5,1040 # 8000c9c0 <end>
    800075b8:	0754ec63          	bltu	s1,s5,80007630 <kinit+0xc8>
    800075bc:	0734fa63          	bgeu	s1,s3,80007630 <kinit+0xc8>
    800075c0:	00088a37          	lui	s4,0x88
    800075c4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800075c8:	00004917          	auipc	s2,0x4
    800075cc:	10890913          	addi	s2,s2,264 # 8000b6d0 <kmem>
    800075d0:	00ca1a13          	slli	s4,s4,0xc
    800075d4:	0140006f          	j	800075e8 <kinit+0x80>
    800075d8:	000017b7          	lui	a5,0x1
    800075dc:	00f484b3          	add	s1,s1,a5
    800075e0:	0554e863          	bltu	s1,s5,80007630 <kinit+0xc8>
    800075e4:	0534f663          	bgeu	s1,s3,80007630 <kinit+0xc8>
    800075e8:	00001637          	lui	a2,0x1
    800075ec:	00100593          	li	a1,1
    800075f0:	00048513          	mv	a0,s1
    800075f4:	00000097          	auipc	ra,0x0
    800075f8:	5e4080e7          	jalr	1508(ra) # 80007bd8 <__memset>
    800075fc:	00093783          	ld	a5,0(s2)
    80007600:	00f4b023          	sd	a5,0(s1)
    80007604:	00993023          	sd	s1,0(s2)
    80007608:	fd4498e3          	bne	s1,s4,800075d8 <kinit+0x70>
    8000760c:	03813083          	ld	ra,56(sp)
    80007610:	03013403          	ld	s0,48(sp)
    80007614:	02813483          	ld	s1,40(sp)
    80007618:	02013903          	ld	s2,32(sp)
    8000761c:	01813983          	ld	s3,24(sp)
    80007620:	01013a03          	ld	s4,16(sp)
    80007624:	00813a83          	ld	s5,8(sp)
    80007628:	04010113          	addi	sp,sp,64
    8000762c:	00008067          	ret
    80007630:	00002517          	auipc	a0,0x2
    80007634:	17850513          	addi	a0,a0,376 # 800097a8 <digits+0x18>
    80007638:	fffff097          	auipc	ra,0xfffff
    8000763c:	4b4080e7          	jalr	1204(ra) # 80006aec <panic>

0000000080007640 <freerange>:
    80007640:	fc010113          	addi	sp,sp,-64
    80007644:	000017b7          	lui	a5,0x1
    80007648:	02913423          	sd	s1,40(sp)
    8000764c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007650:	009504b3          	add	s1,a0,s1
    80007654:	fffff537          	lui	a0,0xfffff
    80007658:	02813823          	sd	s0,48(sp)
    8000765c:	02113c23          	sd	ra,56(sp)
    80007660:	03213023          	sd	s2,32(sp)
    80007664:	01313c23          	sd	s3,24(sp)
    80007668:	01413823          	sd	s4,16(sp)
    8000766c:	01513423          	sd	s5,8(sp)
    80007670:	01613023          	sd	s6,0(sp)
    80007674:	04010413          	addi	s0,sp,64
    80007678:	00a4f4b3          	and	s1,s1,a0
    8000767c:	00f487b3          	add	a5,s1,a5
    80007680:	06f5e463          	bltu	a1,a5,800076e8 <freerange+0xa8>
    80007684:	00005a97          	auipc	s5,0x5
    80007688:	33ca8a93          	addi	s5,s5,828 # 8000c9c0 <end>
    8000768c:	0954e263          	bltu	s1,s5,80007710 <freerange+0xd0>
    80007690:	01100993          	li	s3,17
    80007694:	01b99993          	slli	s3,s3,0x1b
    80007698:	0734fc63          	bgeu	s1,s3,80007710 <freerange+0xd0>
    8000769c:	00058a13          	mv	s4,a1
    800076a0:	00004917          	auipc	s2,0x4
    800076a4:	03090913          	addi	s2,s2,48 # 8000b6d0 <kmem>
    800076a8:	00002b37          	lui	s6,0x2
    800076ac:	0140006f          	j	800076c0 <freerange+0x80>
    800076b0:	000017b7          	lui	a5,0x1
    800076b4:	00f484b3          	add	s1,s1,a5
    800076b8:	0554ec63          	bltu	s1,s5,80007710 <freerange+0xd0>
    800076bc:	0534fa63          	bgeu	s1,s3,80007710 <freerange+0xd0>
    800076c0:	00001637          	lui	a2,0x1
    800076c4:	00100593          	li	a1,1
    800076c8:	00048513          	mv	a0,s1
    800076cc:	00000097          	auipc	ra,0x0
    800076d0:	50c080e7          	jalr	1292(ra) # 80007bd8 <__memset>
    800076d4:	00093703          	ld	a4,0(s2)
    800076d8:	016487b3          	add	a5,s1,s6
    800076dc:	00e4b023          	sd	a4,0(s1)
    800076e0:	00993023          	sd	s1,0(s2)
    800076e4:	fcfa76e3          	bgeu	s4,a5,800076b0 <freerange+0x70>
    800076e8:	03813083          	ld	ra,56(sp)
    800076ec:	03013403          	ld	s0,48(sp)
    800076f0:	02813483          	ld	s1,40(sp)
    800076f4:	02013903          	ld	s2,32(sp)
    800076f8:	01813983          	ld	s3,24(sp)
    800076fc:	01013a03          	ld	s4,16(sp)
    80007700:	00813a83          	ld	s5,8(sp)
    80007704:	00013b03          	ld	s6,0(sp)
    80007708:	04010113          	addi	sp,sp,64
    8000770c:	00008067          	ret
    80007710:	00002517          	auipc	a0,0x2
    80007714:	09850513          	addi	a0,a0,152 # 800097a8 <digits+0x18>
    80007718:	fffff097          	auipc	ra,0xfffff
    8000771c:	3d4080e7          	jalr	980(ra) # 80006aec <panic>

0000000080007720 <kfree>:
    80007720:	fe010113          	addi	sp,sp,-32
    80007724:	00813823          	sd	s0,16(sp)
    80007728:	00113c23          	sd	ra,24(sp)
    8000772c:	00913423          	sd	s1,8(sp)
    80007730:	02010413          	addi	s0,sp,32
    80007734:	03451793          	slli	a5,a0,0x34
    80007738:	04079c63          	bnez	a5,80007790 <kfree+0x70>
    8000773c:	00005797          	auipc	a5,0x5
    80007740:	28478793          	addi	a5,a5,644 # 8000c9c0 <end>
    80007744:	00050493          	mv	s1,a0
    80007748:	04f56463          	bltu	a0,a5,80007790 <kfree+0x70>
    8000774c:	01100793          	li	a5,17
    80007750:	01b79793          	slli	a5,a5,0x1b
    80007754:	02f57e63          	bgeu	a0,a5,80007790 <kfree+0x70>
    80007758:	00001637          	lui	a2,0x1
    8000775c:	00100593          	li	a1,1
    80007760:	00000097          	auipc	ra,0x0
    80007764:	478080e7          	jalr	1144(ra) # 80007bd8 <__memset>
    80007768:	00004797          	auipc	a5,0x4
    8000776c:	f6878793          	addi	a5,a5,-152 # 8000b6d0 <kmem>
    80007770:	0007b703          	ld	a4,0(a5)
    80007774:	01813083          	ld	ra,24(sp)
    80007778:	01013403          	ld	s0,16(sp)
    8000777c:	00e4b023          	sd	a4,0(s1)
    80007780:	0097b023          	sd	s1,0(a5)
    80007784:	00813483          	ld	s1,8(sp)
    80007788:	02010113          	addi	sp,sp,32
    8000778c:	00008067          	ret
    80007790:	00002517          	auipc	a0,0x2
    80007794:	01850513          	addi	a0,a0,24 # 800097a8 <digits+0x18>
    80007798:	fffff097          	auipc	ra,0xfffff
    8000779c:	354080e7          	jalr	852(ra) # 80006aec <panic>

00000000800077a0 <kalloc>:
    800077a0:	fe010113          	addi	sp,sp,-32
    800077a4:	00813823          	sd	s0,16(sp)
    800077a8:	00913423          	sd	s1,8(sp)
    800077ac:	00113c23          	sd	ra,24(sp)
    800077b0:	02010413          	addi	s0,sp,32
    800077b4:	00004797          	auipc	a5,0x4
    800077b8:	f1c78793          	addi	a5,a5,-228 # 8000b6d0 <kmem>
    800077bc:	0007b483          	ld	s1,0(a5)
    800077c0:	02048063          	beqz	s1,800077e0 <kalloc+0x40>
    800077c4:	0004b703          	ld	a4,0(s1)
    800077c8:	00001637          	lui	a2,0x1
    800077cc:	00500593          	li	a1,5
    800077d0:	00048513          	mv	a0,s1
    800077d4:	00e7b023          	sd	a4,0(a5)
    800077d8:	00000097          	auipc	ra,0x0
    800077dc:	400080e7          	jalr	1024(ra) # 80007bd8 <__memset>
    800077e0:	01813083          	ld	ra,24(sp)
    800077e4:	01013403          	ld	s0,16(sp)
    800077e8:	00048513          	mv	a0,s1
    800077ec:	00813483          	ld	s1,8(sp)
    800077f0:	02010113          	addi	sp,sp,32
    800077f4:	00008067          	ret

00000000800077f8 <initlock>:
    800077f8:	ff010113          	addi	sp,sp,-16
    800077fc:	00813423          	sd	s0,8(sp)
    80007800:	01010413          	addi	s0,sp,16
    80007804:	00813403          	ld	s0,8(sp)
    80007808:	00b53423          	sd	a1,8(a0)
    8000780c:	00052023          	sw	zero,0(a0)
    80007810:	00053823          	sd	zero,16(a0)
    80007814:	01010113          	addi	sp,sp,16
    80007818:	00008067          	ret

000000008000781c <acquire>:
    8000781c:	fe010113          	addi	sp,sp,-32
    80007820:	00813823          	sd	s0,16(sp)
    80007824:	00913423          	sd	s1,8(sp)
    80007828:	00113c23          	sd	ra,24(sp)
    8000782c:	01213023          	sd	s2,0(sp)
    80007830:	02010413          	addi	s0,sp,32
    80007834:	00050493          	mv	s1,a0
    80007838:	10002973          	csrr	s2,sstatus
    8000783c:	100027f3          	csrr	a5,sstatus
    80007840:	ffd7f793          	andi	a5,a5,-3
    80007844:	10079073          	csrw	sstatus,a5
    80007848:	fffff097          	auipc	ra,0xfffff
    8000784c:	8e8080e7          	jalr	-1816(ra) # 80006130 <mycpu>
    80007850:	07852783          	lw	a5,120(a0)
    80007854:	06078e63          	beqz	a5,800078d0 <acquire+0xb4>
    80007858:	fffff097          	auipc	ra,0xfffff
    8000785c:	8d8080e7          	jalr	-1832(ra) # 80006130 <mycpu>
    80007860:	07852783          	lw	a5,120(a0)
    80007864:	0004a703          	lw	a4,0(s1)
    80007868:	0017879b          	addiw	a5,a5,1
    8000786c:	06f52c23          	sw	a5,120(a0)
    80007870:	04071063          	bnez	a4,800078b0 <acquire+0x94>
    80007874:	00100713          	li	a4,1
    80007878:	00070793          	mv	a5,a4
    8000787c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80007880:	0007879b          	sext.w	a5,a5
    80007884:	fe079ae3          	bnez	a5,80007878 <acquire+0x5c>
    80007888:	0ff0000f          	fence
    8000788c:	fffff097          	auipc	ra,0xfffff
    80007890:	8a4080e7          	jalr	-1884(ra) # 80006130 <mycpu>
    80007894:	01813083          	ld	ra,24(sp)
    80007898:	01013403          	ld	s0,16(sp)
    8000789c:	00a4b823          	sd	a0,16(s1)
    800078a0:	00013903          	ld	s2,0(sp)
    800078a4:	00813483          	ld	s1,8(sp)
    800078a8:	02010113          	addi	sp,sp,32
    800078ac:	00008067          	ret
    800078b0:	0104b903          	ld	s2,16(s1)
    800078b4:	fffff097          	auipc	ra,0xfffff
    800078b8:	87c080e7          	jalr	-1924(ra) # 80006130 <mycpu>
    800078bc:	faa91ce3          	bne	s2,a0,80007874 <acquire+0x58>
    800078c0:	00002517          	auipc	a0,0x2
    800078c4:	ef050513          	addi	a0,a0,-272 # 800097b0 <digits+0x20>
    800078c8:	fffff097          	auipc	ra,0xfffff
    800078cc:	224080e7          	jalr	548(ra) # 80006aec <panic>
    800078d0:	00195913          	srli	s2,s2,0x1
    800078d4:	fffff097          	auipc	ra,0xfffff
    800078d8:	85c080e7          	jalr	-1956(ra) # 80006130 <mycpu>
    800078dc:	00197913          	andi	s2,s2,1
    800078e0:	07252e23          	sw	s2,124(a0)
    800078e4:	f75ff06f          	j	80007858 <acquire+0x3c>

00000000800078e8 <release>:
    800078e8:	fe010113          	addi	sp,sp,-32
    800078ec:	00813823          	sd	s0,16(sp)
    800078f0:	00113c23          	sd	ra,24(sp)
    800078f4:	00913423          	sd	s1,8(sp)
    800078f8:	01213023          	sd	s2,0(sp)
    800078fc:	02010413          	addi	s0,sp,32
    80007900:	00052783          	lw	a5,0(a0)
    80007904:	00079a63          	bnez	a5,80007918 <release+0x30>
    80007908:	00002517          	auipc	a0,0x2
    8000790c:	eb050513          	addi	a0,a0,-336 # 800097b8 <digits+0x28>
    80007910:	fffff097          	auipc	ra,0xfffff
    80007914:	1dc080e7          	jalr	476(ra) # 80006aec <panic>
    80007918:	01053903          	ld	s2,16(a0)
    8000791c:	00050493          	mv	s1,a0
    80007920:	fffff097          	auipc	ra,0xfffff
    80007924:	810080e7          	jalr	-2032(ra) # 80006130 <mycpu>
    80007928:	fea910e3          	bne	s2,a0,80007908 <release+0x20>
    8000792c:	0004b823          	sd	zero,16(s1)
    80007930:	0ff0000f          	fence
    80007934:	0f50000f          	fence	iorw,ow
    80007938:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000793c:	ffffe097          	auipc	ra,0xffffe
    80007940:	7f4080e7          	jalr	2036(ra) # 80006130 <mycpu>
    80007944:	100027f3          	csrr	a5,sstatus
    80007948:	0027f793          	andi	a5,a5,2
    8000794c:	04079a63          	bnez	a5,800079a0 <release+0xb8>
    80007950:	07852783          	lw	a5,120(a0)
    80007954:	02f05e63          	blez	a5,80007990 <release+0xa8>
    80007958:	fff7871b          	addiw	a4,a5,-1
    8000795c:	06e52c23          	sw	a4,120(a0)
    80007960:	00071c63          	bnez	a4,80007978 <release+0x90>
    80007964:	07c52783          	lw	a5,124(a0)
    80007968:	00078863          	beqz	a5,80007978 <release+0x90>
    8000796c:	100027f3          	csrr	a5,sstatus
    80007970:	0027e793          	ori	a5,a5,2
    80007974:	10079073          	csrw	sstatus,a5
    80007978:	01813083          	ld	ra,24(sp)
    8000797c:	01013403          	ld	s0,16(sp)
    80007980:	00813483          	ld	s1,8(sp)
    80007984:	00013903          	ld	s2,0(sp)
    80007988:	02010113          	addi	sp,sp,32
    8000798c:	00008067          	ret
    80007990:	00002517          	auipc	a0,0x2
    80007994:	e4850513          	addi	a0,a0,-440 # 800097d8 <digits+0x48>
    80007998:	fffff097          	auipc	ra,0xfffff
    8000799c:	154080e7          	jalr	340(ra) # 80006aec <panic>
    800079a0:	00002517          	auipc	a0,0x2
    800079a4:	e2050513          	addi	a0,a0,-480 # 800097c0 <digits+0x30>
    800079a8:	fffff097          	auipc	ra,0xfffff
    800079ac:	144080e7          	jalr	324(ra) # 80006aec <panic>

00000000800079b0 <holding>:
    800079b0:	00052783          	lw	a5,0(a0)
    800079b4:	00079663          	bnez	a5,800079c0 <holding+0x10>
    800079b8:	00000513          	li	a0,0
    800079bc:	00008067          	ret
    800079c0:	fe010113          	addi	sp,sp,-32
    800079c4:	00813823          	sd	s0,16(sp)
    800079c8:	00913423          	sd	s1,8(sp)
    800079cc:	00113c23          	sd	ra,24(sp)
    800079d0:	02010413          	addi	s0,sp,32
    800079d4:	01053483          	ld	s1,16(a0)
    800079d8:	ffffe097          	auipc	ra,0xffffe
    800079dc:	758080e7          	jalr	1880(ra) # 80006130 <mycpu>
    800079e0:	01813083          	ld	ra,24(sp)
    800079e4:	01013403          	ld	s0,16(sp)
    800079e8:	40a48533          	sub	a0,s1,a0
    800079ec:	00153513          	seqz	a0,a0
    800079f0:	00813483          	ld	s1,8(sp)
    800079f4:	02010113          	addi	sp,sp,32
    800079f8:	00008067          	ret

00000000800079fc <push_off>:
    800079fc:	fe010113          	addi	sp,sp,-32
    80007a00:	00813823          	sd	s0,16(sp)
    80007a04:	00113c23          	sd	ra,24(sp)
    80007a08:	00913423          	sd	s1,8(sp)
    80007a0c:	02010413          	addi	s0,sp,32
    80007a10:	100024f3          	csrr	s1,sstatus
    80007a14:	100027f3          	csrr	a5,sstatus
    80007a18:	ffd7f793          	andi	a5,a5,-3
    80007a1c:	10079073          	csrw	sstatus,a5
    80007a20:	ffffe097          	auipc	ra,0xffffe
    80007a24:	710080e7          	jalr	1808(ra) # 80006130 <mycpu>
    80007a28:	07852783          	lw	a5,120(a0)
    80007a2c:	02078663          	beqz	a5,80007a58 <push_off+0x5c>
    80007a30:	ffffe097          	auipc	ra,0xffffe
    80007a34:	700080e7          	jalr	1792(ra) # 80006130 <mycpu>
    80007a38:	07852783          	lw	a5,120(a0)
    80007a3c:	01813083          	ld	ra,24(sp)
    80007a40:	01013403          	ld	s0,16(sp)
    80007a44:	0017879b          	addiw	a5,a5,1
    80007a48:	06f52c23          	sw	a5,120(a0)
    80007a4c:	00813483          	ld	s1,8(sp)
    80007a50:	02010113          	addi	sp,sp,32
    80007a54:	00008067          	ret
    80007a58:	0014d493          	srli	s1,s1,0x1
    80007a5c:	ffffe097          	auipc	ra,0xffffe
    80007a60:	6d4080e7          	jalr	1748(ra) # 80006130 <mycpu>
    80007a64:	0014f493          	andi	s1,s1,1
    80007a68:	06952e23          	sw	s1,124(a0)
    80007a6c:	fc5ff06f          	j	80007a30 <push_off+0x34>

0000000080007a70 <pop_off>:
    80007a70:	ff010113          	addi	sp,sp,-16
    80007a74:	00813023          	sd	s0,0(sp)
    80007a78:	00113423          	sd	ra,8(sp)
    80007a7c:	01010413          	addi	s0,sp,16
    80007a80:	ffffe097          	auipc	ra,0xffffe
    80007a84:	6b0080e7          	jalr	1712(ra) # 80006130 <mycpu>
    80007a88:	100027f3          	csrr	a5,sstatus
    80007a8c:	0027f793          	andi	a5,a5,2
    80007a90:	04079663          	bnez	a5,80007adc <pop_off+0x6c>
    80007a94:	07852783          	lw	a5,120(a0)
    80007a98:	02f05a63          	blez	a5,80007acc <pop_off+0x5c>
    80007a9c:	fff7871b          	addiw	a4,a5,-1
    80007aa0:	06e52c23          	sw	a4,120(a0)
    80007aa4:	00071c63          	bnez	a4,80007abc <pop_off+0x4c>
    80007aa8:	07c52783          	lw	a5,124(a0)
    80007aac:	00078863          	beqz	a5,80007abc <pop_off+0x4c>
    80007ab0:	100027f3          	csrr	a5,sstatus
    80007ab4:	0027e793          	ori	a5,a5,2
    80007ab8:	10079073          	csrw	sstatus,a5
    80007abc:	00813083          	ld	ra,8(sp)
    80007ac0:	00013403          	ld	s0,0(sp)
    80007ac4:	01010113          	addi	sp,sp,16
    80007ac8:	00008067          	ret
    80007acc:	00002517          	auipc	a0,0x2
    80007ad0:	d0c50513          	addi	a0,a0,-756 # 800097d8 <digits+0x48>
    80007ad4:	fffff097          	auipc	ra,0xfffff
    80007ad8:	018080e7          	jalr	24(ra) # 80006aec <panic>
    80007adc:	00002517          	auipc	a0,0x2
    80007ae0:	ce450513          	addi	a0,a0,-796 # 800097c0 <digits+0x30>
    80007ae4:	fffff097          	auipc	ra,0xfffff
    80007ae8:	008080e7          	jalr	8(ra) # 80006aec <panic>

0000000080007aec <push_on>:
    80007aec:	fe010113          	addi	sp,sp,-32
    80007af0:	00813823          	sd	s0,16(sp)
    80007af4:	00113c23          	sd	ra,24(sp)
    80007af8:	00913423          	sd	s1,8(sp)
    80007afc:	02010413          	addi	s0,sp,32
    80007b00:	100024f3          	csrr	s1,sstatus
    80007b04:	100027f3          	csrr	a5,sstatus
    80007b08:	0027e793          	ori	a5,a5,2
    80007b0c:	10079073          	csrw	sstatus,a5
    80007b10:	ffffe097          	auipc	ra,0xffffe
    80007b14:	620080e7          	jalr	1568(ra) # 80006130 <mycpu>
    80007b18:	07852783          	lw	a5,120(a0)
    80007b1c:	02078663          	beqz	a5,80007b48 <push_on+0x5c>
    80007b20:	ffffe097          	auipc	ra,0xffffe
    80007b24:	610080e7          	jalr	1552(ra) # 80006130 <mycpu>
    80007b28:	07852783          	lw	a5,120(a0)
    80007b2c:	01813083          	ld	ra,24(sp)
    80007b30:	01013403          	ld	s0,16(sp)
    80007b34:	0017879b          	addiw	a5,a5,1
    80007b38:	06f52c23          	sw	a5,120(a0)
    80007b3c:	00813483          	ld	s1,8(sp)
    80007b40:	02010113          	addi	sp,sp,32
    80007b44:	00008067          	ret
    80007b48:	0014d493          	srli	s1,s1,0x1
    80007b4c:	ffffe097          	auipc	ra,0xffffe
    80007b50:	5e4080e7          	jalr	1508(ra) # 80006130 <mycpu>
    80007b54:	0014f493          	andi	s1,s1,1
    80007b58:	06952e23          	sw	s1,124(a0)
    80007b5c:	fc5ff06f          	j	80007b20 <push_on+0x34>

0000000080007b60 <pop_on>:
    80007b60:	ff010113          	addi	sp,sp,-16
    80007b64:	00813023          	sd	s0,0(sp)
    80007b68:	00113423          	sd	ra,8(sp)
    80007b6c:	01010413          	addi	s0,sp,16
    80007b70:	ffffe097          	auipc	ra,0xffffe
    80007b74:	5c0080e7          	jalr	1472(ra) # 80006130 <mycpu>
    80007b78:	100027f3          	csrr	a5,sstatus
    80007b7c:	0027f793          	andi	a5,a5,2
    80007b80:	04078463          	beqz	a5,80007bc8 <pop_on+0x68>
    80007b84:	07852783          	lw	a5,120(a0)
    80007b88:	02f05863          	blez	a5,80007bb8 <pop_on+0x58>
    80007b8c:	fff7879b          	addiw	a5,a5,-1
    80007b90:	06f52c23          	sw	a5,120(a0)
    80007b94:	07853783          	ld	a5,120(a0)
    80007b98:	00079863          	bnez	a5,80007ba8 <pop_on+0x48>
    80007b9c:	100027f3          	csrr	a5,sstatus
    80007ba0:	ffd7f793          	andi	a5,a5,-3
    80007ba4:	10079073          	csrw	sstatus,a5
    80007ba8:	00813083          	ld	ra,8(sp)
    80007bac:	00013403          	ld	s0,0(sp)
    80007bb0:	01010113          	addi	sp,sp,16
    80007bb4:	00008067          	ret
    80007bb8:	00002517          	auipc	a0,0x2
    80007bbc:	c4850513          	addi	a0,a0,-952 # 80009800 <digits+0x70>
    80007bc0:	fffff097          	auipc	ra,0xfffff
    80007bc4:	f2c080e7          	jalr	-212(ra) # 80006aec <panic>
    80007bc8:	00002517          	auipc	a0,0x2
    80007bcc:	c1850513          	addi	a0,a0,-1000 # 800097e0 <digits+0x50>
    80007bd0:	fffff097          	auipc	ra,0xfffff
    80007bd4:	f1c080e7          	jalr	-228(ra) # 80006aec <panic>

0000000080007bd8 <__memset>:
    80007bd8:	ff010113          	addi	sp,sp,-16
    80007bdc:	00813423          	sd	s0,8(sp)
    80007be0:	01010413          	addi	s0,sp,16
    80007be4:	1a060e63          	beqz	a2,80007da0 <__memset+0x1c8>
    80007be8:	40a007b3          	neg	a5,a0
    80007bec:	0077f793          	andi	a5,a5,7
    80007bf0:	00778693          	addi	a3,a5,7
    80007bf4:	00b00813          	li	a6,11
    80007bf8:	0ff5f593          	andi	a1,a1,255
    80007bfc:	fff6071b          	addiw	a4,a2,-1
    80007c00:	1b06e663          	bltu	a3,a6,80007dac <__memset+0x1d4>
    80007c04:	1cd76463          	bltu	a4,a3,80007dcc <__memset+0x1f4>
    80007c08:	1a078e63          	beqz	a5,80007dc4 <__memset+0x1ec>
    80007c0c:	00b50023          	sb	a1,0(a0)
    80007c10:	00100713          	li	a4,1
    80007c14:	1ae78463          	beq	a5,a4,80007dbc <__memset+0x1e4>
    80007c18:	00b500a3          	sb	a1,1(a0)
    80007c1c:	00200713          	li	a4,2
    80007c20:	1ae78a63          	beq	a5,a4,80007dd4 <__memset+0x1fc>
    80007c24:	00b50123          	sb	a1,2(a0)
    80007c28:	00300713          	li	a4,3
    80007c2c:	18e78463          	beq	a5,a4,80007db4 <__memset+0x1dc>
    80007c30:	00b501a3          	sb	a1,3(a0)
    80007c34:	00400713          	li	a4,4
    80007c38:	1ae78263          	beq	a5,a4,80007ddc <__memset+0x204>
    80007c3c:	00b50223          	sb	a1,4(a0)
    80007c40:	00500713          	li	a4,5
    80007c44:	1ae78063          	beq	a5,a4,80007de4 <__memset+0x20c>
    80007c48:	00b502a3          	sb	a1,5(a0)
    80007c4c:	00700713          	li	a4,7
    80007c50:	18e79e63          	bne	a5,a4,80007dec <__memset+0x214>
    80007c54:	00b50323          	sb	a1,6(a0)
    80007c58:	00700e93          	li	t4,7
    80007c5c:	00859713          	slli	a4,a1,0x8
    80007c60:	00e5e733          	or	a4,a1,a4
    80007c64:	01059e13          	slli	t3,a1,0x10
    80007c68:	01c76e33          	or	t3,a4,t3
    80007c6c:	01859313          	slli	t1,a1,0x18
    80007c70:	006e6333          	or	t1,t3,t1
    80007c74:	02059893          	slli	a7,a1,0x20
    80007c78:	40f60e3b          	subw	t3,a2,a5
    80007c7c:	011368b3          	or	a7,t1,a7
    80007c80:	02859813          	slli	a6,a1,0x28
    80007c84:	0108e833          	or	a6,a7,a6
    80007c88:	03059693          	slli	a3,a1,0x30
    80007c8c:	003e589b          	srliw	a7,t3,0x3
    80007c90:	00d866b3          	or	a3,a6,a3
    80007c94:	03859713          	slli	a4,a1,0x38
    80007c98:	00389813          	slli	a6,a7,0x3
    80007c9c:	00f507b3          	add	a5,a0,a5
    80007ca0:	00e6e733          	or	a4,a3,a4
    80007ca4:	000e089b          	sext.w	a7,t3
    80007ca8:	00f806b3          	add	a3,a6,a5
    80007cac:	00e7b023          	sd	a4,0(a5)
    80007cb0:	00878793          	addi	a5,a5,8
    80007cb4:	fed79ce3          	bne	a5,a3,80007cac <__memset+0xd4>
    80007cb8:	ff8e7793          	andi	a5,t3,-8
    80007cbc:	0007871b          	sext.w	a4,a5
    80007cc0:	01d787bb          	addw	a5,a5,t4
    80007cc4:	0ce88e63          	beq	a7,a4,80007da0 <__memset+0x1c8>
    80007cc8:	00f50733          	add	a4,a0,a5
    80007ccc:	00b70023          	sb	a1,0(a4)
    80007cd0:	0017871b          	addiw	a4,a5,1
    80007cd4:	0cc77663          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007cd8:	00e50733          	add	a4,a0,a4
    80007cdc:	00b70023          	sb	a1,0(a4)
    80007ce0:	0027871b          	addiw	a4,a5,2
    80007ce4:	0ac77e63          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007ce8:	00e50733          	add	a4,a0,a4
    80007cec:	00b70023          	sb	a1,0(a4)
    80007cf0:	0037871b          	addiw	a4,a5,3
    80007cf4:	0ac77663          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007cf8:	00e50733          	add	a4,a0,a4
    80007cfc:	00b70023          	sb	a1,0(a4)
    80007d00:	0047871b          	addiw	a4,a5,4
    80007d04:	08c77e63          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007d08:	00e50733          	add	a4,a0,a4
    80007d0c:	00b70023          	sb	a1,0(a4)
    80007d10:	0057871b          	addiw	a4,a5,5
    80007d14:	08c77663          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007d18:	00e50733          	add	a4,a0,a4
    80007d1c:	00b70023          	sb	a1,0(a4)
    80007d20:	0067871b          	addiw	a4,a5,6
    80007d24:	06c77e63          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007d28:	00e50733          	add	a4,a0,a4
    80007d2c:	00b70023          	sb	a1,0(a4)
    80007d30:	0077871b          	addiw	a4,a5,7
    80007d34:	06c77663          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007d38:	00e50733          	add	a4,a0,a4
    80007d3c:	00b70023          	sb	a1,0(a4)
    80007d40:	0087871b          	addiw	a4,a5,8
    80007d44:	04c77e63          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007d48:	00e50733          	add	a4,a0,a4
    80007d4c:	00b70023          	sb	a1,0(a4)
    80007d50:	0097871b          	addiw	a4,a5,9
    80007d54:	04c77663          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007d58:	00e50733          	add	a4,a0,a4
    80007d5c:	00b70023          	sb	a1,0(a4)
    80007d60:	00a7871b          	addiw	a4,a5,10
    80007d64:	02c77e63          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007d68:	00e50733          	add	a4,a0,a4
    80007d6c:	00b70023          	sb	a1,0(a4)
    80007d70:	00b7871b          	addiw	a4,a5,11
    80007d74:	02c77663          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007d78:	00e50733          	add	a4,a0,a4
    80007d7c:	00b70023          	sb	a1,0(a4)
    80007d80:	00c7871b          	addiw	a4,a5,12
    80007d84:	00c77e63          	bgeu	a4,a2,80007da0 <__memset+0x1c8>
    80007d88:	00e50733          	add	a4,a0,a4
    80007d8c:	00b70023          	sb	a1,0(a4)
    80007d90:	00d7879b          	addiw	a5,a5,13
    80007d94:	00c7f663          	bgeu	a5,a2,80007da0 <__memset+0x1c8>
    80007d98:	00f507b3          	add	a5,a0,a5
    80007d9c:	00b78023          	sb	a1,0(a5)
    80007da0:	00813403          	ld	s0,8(sp)
    80007da4:	01010113          	addi	sp,sp,16
    80007da8:	00008067          	ret
    80007dac:	00b00693          	li	a3,11
    80007db0:	e55ff06f          	j	80007c04 <__memset+0x2c>
    80007db4:	00300e93          	li	t4,3
    80007db8:	ea5ff06f          	j	80007c5c <__memset+0x84>
    80007dbc:	00100e93          	li	t4,1
    80007dc0:	e9dff06f          	j	80007c5c <__memset+0x84>
    80007dc4:	00000e93          	li	t4,0
    80007dc8:	e95ff06f          	j	80007c5c <__memset+0x84>
    80007dcc:	00000793          	li	a5,0
    80007dd0:	ef9ff06f          	j	80007cc8 <__memset+0xf0>
    80007dd4:	00200e93          	li	t4,2
    80007dd8:	e85ff06f          	j	80007c5c <__memset+0x84>
    80007ddc:	00400e93          	li	t4,4
    80007de0:	e7dff06f          	j	80007c5c <__memset+0x84>
    80007de4:	00500e93          	li	t4,5
    80007de8:	e75ff06f          	j	80007c5c <__memset+0x84>
    80007dec:	00600e93          	li	t4,6
    80007df0:	e6dff06f          	j	80007c5c <__memset+0x84>

0000000080007df4 <__memmove>:
    80007df4:	ff010113          	addi	sp,sp,-16
    80007df8:	00813423          	sd	s0,8(sp)
    80007dfc:	01010413          	addi	s0,sp,16
    80007e00:	0e060863          	beqz	a2,80007ef0 <__memmove+0xfc>
    80007e04:	fff6069b          	addiw	a3,a2,-1
    80007e08:	0006881b          	sext.w	a6,a3
    80007e0c:	0ea5e863          	bltu	a1,a0,80007efc <__memmove+0x108>
    80007e10:	00758713          	addi	a4,a1,7
    80007e14:	00a5e7b3          	or	a5,a1,a0
    80007e18:	40a70733          	sub	a4,a4,a0
    80007e1c:	0077f793          	andi	a5,a5,7
    80007e20:	00f73713          	sltiu	a4,a4,15
    80007e24:	00174713          	xori	a4,a4,1
    80007e28:	0017b793          	seqz	a5,a5
    80007e2c:	00e7f7b3          	and	a5,a5,a4
    80007e30:	10078863          	beqz	a5,80007f40 <__memmove+0x14c>
    80007e34:	00900793          	li	a5,9
    80007e38:	1107f463          	bgeu	a5,a6,80007f40 <__memmove+0x14c>
    80007e3c:	0036581b          	srliw	a6,a2,0x3
    80007e40:	fff8081b          	addiw	a6,a6,-1
    80007e44:	02081813          	slli	a6,a6,0x20
    80007e48:	01d85893          	srli	a7,a6,0x1d
    80007e4c:	00858813          	addi	a6,a1,8
    80007e50:	00058793          	mv	a5,a1
    80007e54:	00050713          	mv	a4,a0
    80007e58:	01088833          	add	a6,a7,a6
    80007e5c:	0007b883          	ld	a7,0(a5)
    80007e60:	00878793          	addi	a5,a5,8
    80007e64:	00870713          	addi	a4,a4,8
    80007e68:	ff173c23          	sd	a7,-8(a4)
    80007e6c:	ff0798e3          	bne	a5,a6,80007e5c <__memmove+0x68>
    80007e70:	ff867713          	andi	a4,a2,-8
    80007e74:	02071793          	slli	a5,a4,0x20
    80007e78:	0207d793          	srli	a5,a5,0x20
    80007e7c:	00f585b3          	add	a1,a1,a5
    80007e80:	40e686bb          	subw	a3,a3,a4
    80007e84:	00f507b3          	add	a5,a0,a5
    80007e88:	06e60463          	beq	a2,a4,80007ef0 <__memmove+0xfc>
    80007e8c:	0005c703          	lbu	a4,0(a1)
    80007e90:	00e78023          	sb	a4,0(a5)
    80007e94:	04068e63          	beqz	a3,80007ef0 <__memmove+0xfc>
    80007e98:	0015c603          	lbu	a2,1(a1)
    80007e9c:	00100713          	li	a4,1
    80007ea0:	00c780a3          	sb	a2,1(a5)
    80007ea4:	04e68663          	beq	a3,a4,80007ef0 <__memmove+0xfc>
    80007ea8:	0025c603          	lbu	a2,2(a1)
    80007eac:	00200713          	li	a4,2
    80007eb0:	00c78123          	sb	a2,2(a5)
    80007eb4:	02e68e63          	beq	a3,a4,80007ef0 <__memmove+0xfc>
    80007eb8:	0035c603          	lbu	a2,3(a1)
    80007ebc:	00300713          	li	a4,3
    80007ec0:	00c781a3          	sb	a2,3(a5)
    80007ec4:	02e68663          	beq	a3,a4,80007ef0 <__memmove+0xfc>
    80007ec8:	0045c603          	lbu	a2,4(a1)
    80007ecc:	00400713          	li	a4,4
    80007ed0:	00c78223          	sb	a2,4(a5)
    80007ed4:	00e68e63          	beq	a3,a4,80007ef0 <__memmove+0xfc>
    80007ed8:	0055c603          	lbu	a2,5(a1)
    80007edc:	00500713          	li	a4,5
    80007ee0:	00c782a3          	sb	a2,5(a5)
    80007ee4:	00e68663          	beq	a3,a4,80007ef0 <__memmove+0xfc>
    80007ee8:	0065c703          	lbu	a4,6(a1)
    80007eec:	00e78323          	sb	a4,6(a5)
    80007ef0:	00813403          	ld	s0,8(sp)
    80007ef4:	01010113          	addi	sp,sp,16
    80007ef8:	00008067          	ret
    80007efc:	02061713          	slli	a4,a2,0x20
    80007f00:	02075713          	srli	a4,a4,0x20
    80007f04:	00e587b3          	add	a5,a1,a4
    80007f08:	f0f574e3          	bgeu	a0,a5,80007e10 <__memmove+0x1c>
    80007f0c:	02069613          	slli	a2,a3,0x20
    80007f10:	02065613          	srli	a2,a2,0x20
    80007f14:	fff64613          	not	a2,a2
    80007f18:	00e50733          	add	a4,a0,a4
    80007f1c:	00c78633          	add	a2,a5,a2
    80007f20:	fff7c683          	lbu	a3,-1(a5)
    80007f24:	fff78793          	addi	a5,a5,-1
    80007f28:	fff70713          	addi	a4,a4,-1
    80007f2c:	00d70023          	sb	a3,0(a4)
    80007f30:	fec798e3          	bne	a5,a2,80007f20 <__memmove+0x12c>
    80007f34:	00813403          	ld	s0,8(sp)
    80007f38:	01010113          	addi	sp,sp,16
    80007f3c:	00008067          	ret
    80007f40:	02069713          	slli	a4,a3,0x20
    80007f44:	02075713          	srli	a4,a4,0x20
    80007f48:	00170713          	addi	a4,a4,1
    80007f4c:	00e50733          	add	a4,a0,a4
    80007f50:	00050793          	mv	a5,a0
    80007f54:	0005c683          	lbu	a3,0(a1)
    80007f58:	00178793          	addi	a5,a5,1
    80007f5c:	00158593          	addi	a1,a1,1
    80007f60:	fed78fa3          	sb	a3,-1(a5)
    80007f64:	fee798e3          	bne	a5,a4,80007f54 <__memmove+0x160>
    80007f68:	f89ff06f          	j	80007ef0 <__memmove+0xfc>

0000000080007f6c <__putc>:
    80007f6c:	fe010113          	addi	sp,sp,-32
    80007f70:	00813823          	sd	s0,16(sp)
    80007f74:	00113c23          	sd	ra,24(sp)
    80007f78:	02010413          	addi	s0,sp,32
    80007f7c:	00050793          	mv	a5,a0
    80007f80:	fef40593          	addi	a1,s0,-17
    80007f84:	00100613          	li	a2,1
    80007f88:	00000513          	li	a0,0
    80007f8c:	fef407a3          	sb	a5,-17(s0)
    80007f90:	fffff097          	auipc	ra,0xfffff
    80007f94:	b3c080e7          	jalr	-1220(ra) # 80006acc <console_write>
    80007f98:	01813083          	ld	ra,24(sp)
    80007f9c:	01013403          	ld	s0,16(sp)
    80007fa0:	02010113          	addi	sp,sp,32
    80007fa4:	00008067          	ret

0000000080007fa8 <__getc>:
    80007fa8:	fe010113          	addi	sp,sp,-32
    80007fac:	00813823          	sd	s0,16(sp)
    80007fb0:	00113c23          	sd	ra,24(sp)
    80007fb4:	02010413          	addi	s0,sp,32
    80007fb8:	fe840593          	addi	a1,s0,-24
    80007fbc:	00100613          	li	a2,1
    80007fc0:	00000513          	li	a0,0
    80007fc4:	fffff097          	auipc	ra,0xfffff
    80007fc8:	ae8080e7          	jalr	-1304(ra) # 80006aac <console_read>
    80007fcc:	fe844503          	lbu	a0,-24(s0)
    80007fd0:	01813083          	ld	ra,24(sp)
    80007fd4:	01013403          	ld	s0,16(sp)
    80007fd8:	02010113          	addi	sp,sp,32
    80007fdc:	00008067          	ret

0000000080007fe0 <console_handler>:
    80007fe0:	fe010113          	addi	sp,sp,-32
    80007fe4:	00813823          	sd	s0,16(sp)
    80007fe8:	00113c23          	sd	ra,24(sp)
    80007fec:	00913423          	sd	s1,8(sp)
    80007ff0:	02010413          	addi	s0,sp,32
    80007ff4:	14202773          	csrr	a4,scause
    80007ff8:	100027f3          	csrr	a5,sstatus
    80007ffc:	0027f793          	andi	a5,a5,2
    80008000:	06079e63          	bnez	a5,8000807c <console_handler+0x9c>
    80008004:	00074c63          	bltz	a4,8000801c <console_handler+0x3c>
    80008008:	01813083          	ld	ra,24(sp)
    8000800c:	01013403          	ld	s0,16(sp)
    80008010:	00813483          	ld	s1,8(sp)
    80008014:	02010113          	addi	sp,sp,32
    80008018:	00008067          	ret
    8000801c:	0ff77713          	andi	a4,a4,255
    80008020:	00900793          	li	a5,9
    80008024:	fef712e3          	bne	a4,a5,80008008 <console_handler+0x28>
    80008028:	ffffe097          	auipc	ra,0xffffe
    8000802c:	6dc080e7          	jalr	1756(ra) # 80006704 <plic_claim>
    80008030:	00a00793          	li	a5,10
    80008034:	00050493          	mv	s1,a0
    80008038:	02f50c63          	beq	a0,a5,80008070 <console_handler+0x90>
    8000803c:	fc0506e3          	beqz	a0,80008008 <console_handler+0x28>
    80008040:	00050593          	mv	a1,a0
    80008044:	00001517          	auipc	a0,0x1
    80008048:	6c450513          	addi	a0,a0,1732 # 80009708 <CONSOLE_STATUS+0x6f8>
    8000804c:	fffff097          	auipc	ra,0xfffff
    80008050:	afc080e7          	jalr	-1284(ra) # 80006b48 <__printf>
    80008054:	01013403          	ld	s0,16(sp)
    80008058:	01813083          	ld	ra,24(sp)
    8000805c:	00048513          	mv	a0,s1
    80008060:	00813483          	ld	s1,8(sp)
    80008064:	02010113          	addi	sp,sp,32
    80008068:	ffffe317          	auipc	t1,0xffffe
    8000806c:	6d430067          	jr	1748(t1) # 8000673c <plic_complete>
    80008070:	fffff097          	auipc	ra,0xfffff
    80008074:	3e0080e7          	jalr	992(ra) # 80007450 <uartintr>
    80008078:	fddff06f          	j	80008054 <console_handler+0x74>
    8000807c:	00001517          	auipc	a0,0x1
    80008080:	78c50513          	addi	a0,a0,1932 # 80009808 <digits+0x78>
    80008084:	fffff097          	auipc	ra,0xfffff
    80008088:	a68080e7          	jalr	-1432(ra) # 80006aec <panic>
	...
