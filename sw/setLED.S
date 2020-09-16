.section .text
.align 2
.global setLED

#include "memoryMap.inc"
#include "regValue.inc"


// Which LED to set comes into register a0
// Value of LED comes in register a1

setLED:
    addi sp, sp, -16            // Allocate the stack frame
    sw ra, 12(sp)               // Save our return address into thes stack

    li t0, GPIO_ADDRESS         // Load the GPIO Address
    lw t1, LED_OUT_OFFSET(t0)   // Get the current value of the LEDs

    beqz a1, ledOff             // Brnach off to turn off led if a1 requests it
    li t2, LEDON                // Load up On/1 into our temp registers 
    beq a1,t2, ledOn            // Brnach if off requested
    li a0, ERROR                // Send value back through a0 - got bad status request, return an error
    j exit

ledOn:
    xor t1, t1, a0              // Only change status of the requested pin
    sw t1, LED_OUT_OFFSET(t0)   // Write the new output value to the LED output--output OUTPUT.HEX
    li a0, NOERROR
    j exit

ledOff:
    xor a0, a0, 0xffffffff      // Invert everything so all bits are 1 beside the LED we will turn off
    and t1, t1, a0              // And a0 and t1 to get the LED we want to turn off
    sw t1, LED_OUT_OFFSET(t0)   // Write the new output value to the LED output
    li a0, NOERROR

exit:
    lw ra, 12(sp)               // Reload the return address
    addi sp , sp, 16
    ret 