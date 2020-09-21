.section .text
.align 2
.global enableLED_OE

#include "memoryMap.inc"
#include "regValue.inc"

enableLED_OE:
    addi sp, sp, -16         // Allocate the stack pointer frame
    sw ra, 12(sp)            // Save the return address unto the stack
    
    li t0, GPIO_ADDRESS         // Load the base GPIO address
    li t1, LED_ENABLE           // Load LED output enable value
    sw t1, LED_OE_OFFSET(t0)    // Enable output of LEDs value
    
    lw ra, 12(sp)             // Reload the return address
    addi sp , sp, 16
    ret 

    
