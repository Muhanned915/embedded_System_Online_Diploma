#include <stdint.h>
#include "uart.h"

#define UART0DR *(((volatile uint32_t *) 0x101f1000))

void uart_send_string(uint8_t * str_ptr)
{
    while(*str_ptr != '\0'){
        UART0DR = (uint32_t)(*str_ptr);
        str_ptr++;
    }
}