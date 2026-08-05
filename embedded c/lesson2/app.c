#include <stdint.h>
#include "uart.h"

int x,y,z;

char str [32] = "learn-in-depth:Muhanned";
char * ptr = "hello world";

int main()
{
    uart_send_string(str);
    return 0;
}