/*learn in depth
    ENG. Muhanned Ahmed
*/
#include <stdint.h>

#define SYSCTL_RCGC2_R (*((volatile uint32_t *) 0x400FE108))
#define GPIO_PORTF_DIR (*((volatile uint32_t *) 0x40025400))
#define GPIO_PORTF_DEN (*((volatile uint32_t *) 0x4002551C))
#define GPIO_PORTF_DATA (*((volatile uint32_t *) 0x400253FC))

int main()
{
    SYSCTL_RCGC2_R = 0x20;
    volatile uint16_t delay_count;
    for(delay_count = 0;delay_count < 200;delay_count++);

    GPIO_PORTF_DIR |= 1 << 3;
    GPIO_PORTF_DEN |= 1 << 3;
    
    while(1){
        for(delay_count = 0;delay_count < 200000;delay_count++);
        GPIO_PORTF_DATA |= 1 << 3;
        for(delay_count = 0;delay_count < 200000;delay_count++);
        GPIO_PORTF_DATA &= ~(1 << 3);
    }
    return 0;
}