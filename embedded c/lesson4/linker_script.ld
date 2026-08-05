


MEMORY
{
    FLASH(rx) : ORIGIN = 0x00000000, LENGTH = 256K
    SRAM(rwx) : ORIGIN = 0x20000000, LENGTH = 32K
}



SECTIONS
{
    .text :
    {
        _s_text = .;
        startup.o(.vectors*)
        startup.o(.text)
        *(.text)
        . = ALIGN(4);
        _e_text = .;
    } > FLASH

    .data :
    {
        _data_load = LOADADDR(.data);
        _s_data = .;
        *(.data)
        . = ALIGN(4);
        _e_data = .;

    } > SRAM AT > FLASH

    .bss :
    {
        _s_bss = .;
        *(.bss)
        _s_bottom = stack_top + 1024;
        _e_bss = .;
    } > SRAM
}