.section .text
.align 2
.global readGPIO

#include "memoryMap.inc"
#include "regValue.inc"

readGPIO:
    addi sp, sp, -16         // Allocate the stack pointer frame
    sw ra, 12(sp)            // Save the return address unto the stack
    
    lw t1, 0(s1) # 
    
    li t0, GPIO_ADDRESS         // Load the GPIO Address
    add t2,a0, t0               // t0 = a0 + GPIO_ADDRESS
    lw   t1, 0(t2)              // Read the GPIO
    mv  a0, t1                  //a0 = t1

    lw ra, 12(sp)               // Reload the return address
    addi sp , sp, 16
    ret 