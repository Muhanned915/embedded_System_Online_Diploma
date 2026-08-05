/*
  Learn-in-depth
    ENG.Muhanned Ahmed
*/

MEMORY
{
    FLASH (rx) : ORIGIN = 0x8000000, LENGTH = 128K
    SRAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 20K
}

SECTIONS
{
    .text :
    {
        _s_text = .;
        startup.o(.vectors)
        startup.o(.text)
        *(.text)
        *(.rodata)
        _e_text = .;
        . = ALIGN(4);
    } > FLASH

    .data :
    {
        _data_load = LOADADDR(.data);              /* lma */
        _s_data = .;                               /* vma */
        *(.data)
        _e_data = .;
        . = ALIGN(4);
    } > SRAM AT > FLASH

    .bss :
    {
        _s_bss = .;
        *(.bss)
        _e_bss = .;
       . = ALIGN(4);
    } > SRAM

}