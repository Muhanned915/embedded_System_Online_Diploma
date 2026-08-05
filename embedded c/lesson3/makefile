CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
AS = arm-none-eabi-as
OBJCOPY = arm-none-eabi-objcopy
MCU = cortex-m3
CFLAGS = -gdwarf-2 -c -mcpu=$(MCU)
ASFLAGS = -gdwarf-2 -c -mcpu=$(MCU)
LDFLAGS = -T linker_script.ld

SRC = $(wildcard *.c) $(wildcard *.s)
OBJ := $(SRC:.c=.o) 
OBJ := $(OBJ:.s=.o)
TARGET = toggle_pin



all: $(TARGET).hex
	@echo build is complete

$(TARGET).hex: $(TARGET).elf
	$(OBJCOPY) -O ihex $< $@

$(TARGET).elf: $(OBJ) 
	$(LD) $(LDFLAGS) $^ -o $@ -Map=Map_file.map

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS)  $< -o $@ 

clean:
	rm -f *.elf *.bin *.hex *.o *.map

clean_bin:
	rm -f *.elf *.bin *.hex *.map