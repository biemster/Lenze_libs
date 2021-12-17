/*
this file is used for all extern interrupt routine, it need other project to fill the jump table 
tpo realize interrupt function defined by user
*/
#include "bus_dev.h"
//#include "timer.h"
#include "uart.h"
#include "gpio.h"
#include "log.h"

int   hardFault;
typedef void (*irq_function)(void);

// ====== extern function
extern int TIM0_IRQHandler(void);

extern void __attribute__((weak)) UART0_IRQHandler(void);
extern void __attribute__((weak)) UART1_IRQHandler(void);
// ==========================
void HardFault_IRQHandler(void)
{
	hardFault++;
	//gpio_write(1, 1);
	LOG("hard fault\n");
	hal_gpio_write(P1,1);
}

void HardFault_Handler()
{
	HardFault_IRQHandler();
}

ATTRIBUTE_ISR void UART0_IRQHandler(void)
{
	hal_UART0_IRQHandler();
}

ATTRIBUTE_ISR void UART1_IRQHandler(void)
{
	hal_UART1_IRQHandler();
}



