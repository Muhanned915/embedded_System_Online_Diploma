#include <stdint.h>


extern int main();
void reset_handler();
void default_handler();
void NMI_handler() __attribute__((weak,alias("default_handler")));
void hardfault_handler() __attribute__((weak, alias("default_handler")));




uint32_t vectors[] __attribute__((section(".vectors"))) = {
    (uint32_t)0x20001000,                 // stack pointer
    (uint32_t)&reset_handler,
    (uint32_t)&NMI_handler,
    (uint32_t)&hardfault_handler
};


void reset_handler()
{
    extern uint32_t _data_load;
    extern uint32_t _s_data;
    extern uint32_t _e_data;
    extern uint32_t _s_bss;
    extern uint32_t _e_bss;

    uint32_t * data_src = &_data_load;
    uint32_t * data_dst = &_s_data;

    while(data_dst < (&_e_data)){
        *(data_dst++) = *(data_src++);
    }

    
    uint32_t * bss_ptr = &_s_bss;
    while(bss_ptr < (&_e_bss)){
        *(bss_ptr++) = 0;
    }


    main();
}

void default_handler()
{
    reset_handler();
}
