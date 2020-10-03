.section .text
.align 2
.global writeByte

#include "memoryMap.inc"
#include "regValue.inc"

writeByte:
    addi sp, sp, -16         // Allocate the stack pointer frame
    sw ra, 12(sp)            // Save the return address unto the stack
    
    sb a0, 0(a1)             // write a0 to address a1
    
    lw ra, 12(sp)             // Reload the return address
    addi sp , sp, 16
    ret 