ENTRY(reset)

MEMORY
{
    flash(rwx) : ORIGIN = 0X00000000 , LENGTH = 64M
}

SECTIONS
{

    . = 0x10000;

    .startup :
    {
        startup.o(.text)
    } > flash

    .text :
    {
        *(.text)
    } > flash

    .data :
    {
        *(.data)
    } > flash

    .bss :
    {
        *(.bss)
    } > flash 


    . = . + 0x1000;

    stack_top = .;
}