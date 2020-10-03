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

