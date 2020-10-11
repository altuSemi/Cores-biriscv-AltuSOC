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