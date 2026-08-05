TARGET = tiva_c_toggle_pin
MCU = cortex-m4
CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
CFLAGS = -g -c -mcpu=$(MCU)
LDFLAGS = -T linker_script.ld
SRC_C = $(wildcard *.c)
OBJ = $(SRC_C:.c=.o)

.PHONY: all



all: $(TARGET).hex
	@echo "============build is complete============"

$(TARGET).hex : $(TARGET).elf
	$(OBJCOPY) -O ihex $< $@

$(TARGET).elf : $(OBJ)
	$(LD) $(LDFLAGS) $^ -o $@ -Map=map_file.map 

%.o : %.c
	$(CC) $(CFLAGS) $<

clean:
	rm -f *.hex *.elf *.o *.map 

clean_bin:
	rm -f *.hex *.elf *.map