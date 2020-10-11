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

    
