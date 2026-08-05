CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
AS = arm-none-eabi-as
OBJCOPY = arm-none-eabi-objcopy
MCU = arm926ej-s
CFLAGS = -c -g -mcpu=$(MCU)
ASFLAGS = -c -g -mcpu=$(MCU)
LDFLAGS = -T linker_script.ld

SRC = $(wildcard *.c) $(wildcard *.s)
OBJ := $(SRC:.c=.o) 
OBJ := $(OBJ:.s=.o)



all: app.bin
	echo build is complete

app.bin: app.elf
	$(OBJCOPY) -O binary $< $@

app.elf: $(OBJ) 
	$(LD) $(LDFLAGS) $^ -o $@ 

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS)  $< -o $@ 

clean:
	rm -f *.elf *.bin *.o 

clean_bin:
	rm -f *.elf *.bin