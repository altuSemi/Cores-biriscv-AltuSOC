/********************************************************************************
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
//********************************************************************************/
MEMORY
{
  rom : ORIGIN = 0x00000000, LENGTH = 16K
  ram : ORIGIN = 0x00004000, LENGTH = 48K
}

PROVIDE(_ram_start = ORIGIN(ram));
PROVIDE(_ram_end = ORIGIN(ram) + LENGTH(ram));
PROVIDE(__stack_top = ORIGIN(ram) + LENGTH(ram));

OUTPUT_ARCH( "riscv" )

ENTRY(_start)

SECTIONS
{
  .text :
  {
    KEEP(*(.text.start))
    *(.text .text.*)
    . = ALIGN(8);
    PROVIDE(_etext = ABSOLUTE(.));
  } >rom

  .rodata :
  {
    *(.rodata .rodata.*)
  } >rom

  .data :
  {
    *(.data .data.*)
    . = ALIGN(8);
    PROVIDE(_edata = ABSOLUTE(.));
  } >ram

  .bss :
  {
    PROVIDE(_bss = ABSOLUTE(.));
    *(.bss .bss.*)
    *(COMMON)
    . = ALIGN(8);
    PROVIDE(_ebss = ABSOLUTE(.));
  } >ram


  . = ALIGN(64);
  PROVIDE(_end = ABSOLUTE(.));

}