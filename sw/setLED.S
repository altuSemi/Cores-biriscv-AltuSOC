//********************************************************************************
// SPDX-License-Identifier: Apache-2.0
// Copyright 2020 altusemi
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// Modifications copyright (C) 2020 altusemi
// Comments:
//********************************************************************************
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
    sb t1, LED_OUT_OFFSET(t0)   // Write the new output value to the LED output--output OUTPUT.HEX
    li a0, NOERROR
    j exit

ledOff:
    xor a0, a0, 0xffffffff      // Invert everything so all bits are 1 beside the LED we will turn off
    and t1, t1, a0              // And a0 and t1 to get the LED we want to turn off
    sb t1, LED_OUT_OFFSET(t0)   // Write the new output value to the LED output
    li a0, NOERROR

exit:
    lw ra, 12(sp)               // Reload the return address
    addi sp , sp, 16
    ret 