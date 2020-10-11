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
.equ GPIO_ADDRESS,       0x10001000
.equ EXCSR_ADDRESS,      0x10002000
.equ DCCM_ADDRESS,       0x00004000

.equ SIMPRINT,           0x0008
.equ LED_OE_OFFSET,      0x0010 //Only use 4 lsbits
.equ LED_OUT_OFFSET,     0x0014 //Only use 4 lsbits
