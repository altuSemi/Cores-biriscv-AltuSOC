#********************************************************************************
# SPDX-License-Identifier: Apache-2.0
# Copyright 2020 altusemi
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Modifications copyright (C) 2020 altusemi
# Comments:
#********************************************************************************
# the compiler: gcc for C program, define as g++ for C++
CC=/opt/riscv32/bin/riscv32-unknown-elf-gcc
  
ELF2HEX=~/elf2hex/elf2hex
LD=../superBlink.rev0.ld
OBJDUMP=/opt/riscv32/bin/riscv32-unknown-elf-objdump
# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -O0  -ffreestanding -Wl,--gc-sections       -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,$(LD)
OFLAGS  = --disassemble-all --disassemble-zeroes 
  
# the build target executable:
TARGET = superBlink
DEP = ../crt0.S  ../enableLED_OE.S ../setLED.S ../writeByte.S ../readGPIO.S

all: $(TARGET)

$(TARGET): ../$(TARGET).c $(DEP)
	$(CC) $(CFLAGS) -o $(TARGET) $(DEP) ../$(TARGET).c
	$(ELF2HEX) --bit-width 8 --input superBlink --output OUTPUT.HEX
	$(ELF2HEX) --bit-width 64 --input superBlink --output OUTPUT_DW.HEX
	./make_vh.sh
	$(OBJDUMP) $(OFLAGS) $(TARGET) > $(TARGET).assembly
  
clean:
	rm $(TARGET) *.HEX

