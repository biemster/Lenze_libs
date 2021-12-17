#include <stdio.h>
#include "log.h"
#include "uart.h"

void uart_init(void)
{
	uart_Cfg_t uart0_cfg;;
    uart0_cfg.evt_handler  = NULL;
    uart0_cfg.baudrate     = 115200;
    uart0_cfg.tx_pin       = FMUX_UART_TX;
    uart0_cfg.rx_pin       = FMUX_UART_RX;
    uart0_cfg.use_fifo     = TRUE;
	uart0_cfg.hw_fwctrl    = FALSE;
	uart0_cfg.use_tx_buf   = FALSE;
	uart0_cfg.parity       = FALSE;
	hal_uart_init(uart0_cfg,UART0);
	
	write_reg(0x40003818, 4);
	write_reg(0x4000380C, 1);
}

ATTRIBUTE_ISR void V0_IRQHandler(void)
{
	LOG("V0\n");
}
ATTRIBUTE_ISR void V1_IRQHandler(void)
{
	LOG("V1\n");
}
ATTRIBUTE_ISR void V9_IRQHandler(void)
{
	LOG("V9\n");
}
ATTRIBUTE_ISR void V13_IRQHandler(void)
{
	LOG("V13\n");
}
ATTRIBUTE_ISR void V19_IRQHandler(void)
{
	LOG("V19\n");
}
ATTRIBUTE_ISR void V24_IRQHandler(void)
{
	LOG("V24\n");
}
ATTRIBUTE_ISR void V25_IRQHandler(void)
{
	LOG("V25\n");
}

ATTRIBUTE_ISR void V27_IRQHandler(void)
{
	LOG("V25\n");
}

ATTRIBUTE_ISR void TIM0_IRQHandler(void)
{
	LOG("TIM0\n");
}
ATTRIBUTE_ISR void OTP_IRQHandler(void)
{
	LOG("OTP\n");
}
ATTRIBUTE_ISR void BB_IRQHandler(void)
{
	LOG("BB\n");
}

ATTRIBUTE_ISR void KSCAN_IRQHandler(void)
{
	LOG("KSCAN\n");
}

ATTRIBUTE_ISR void RTC_IRQHandler(void)
{
	LOG("RTC\n");
}

ATTRIBUTE_ISR void CPCOM_AP_IPC_IRQHandler(void)
{
	LOG("CPCOM_AP_IPC\n");
}

ATTRIBUTE_ISR void APCOM_AP_IPC_IRQHandler(void)
{
	LOG("APCOM_AP_IPC\n");
}
ATTRIBUTE_ISR void WDT_IRQHandler(void)
{
	LOG("WDT\n");
}

ATTRIBUTE_ISR void I2C0_IRQHandler(void)
{
	LOG("I2C0\n");
}

ATTRIBUTE_ISR void SPI0_IRQHandler(void)
{
	LOG("SPI0\n");
}
ATTRIBUTE_ISR void SPI1_IRQHandler(void)
{
	LOG("SPI0\n");
}

ATTRIBUTE_ISR void GPIO_IRQHandler(void)
{
	LOG("GPIO\n");
}
ATTRIBUTE_ISR void SPIF_IRQHandler(void)
{
	LOG("SPIF\n");
}

ATTRIBUTE_ISR void TIM1_IRQHandler(void)
{
	LOG("TIM1\n");
}
ATTRIBUTE_ISR void TIM2_IRQHandler(void)
{
	LOG("TIM2\n");
}
ATTRIBUTE_ISR void TIM3_IRQHandler(void)
{
	LOG("TIM3\n");
}
ATTRIBUTE_ISR void TIM4_IRQHandler(void)
{
	LOG("TIM4\n");
}

ATTRIBUTE_ISR void AES_IRQHandler(void)
{
	LOG("AES\n");
}

ATTRIBUTE_ISR void ADCC_IRQHandler(void)
{
	LOG("ADCC\n");
}

ATTRIBUTE_ISR void QDEC_IRQHandler(void)
{
	LOG("QDEC\n");
}

ATTRIBUTE_ISR void HCLK_MUX_IRQHandler(void)
{
	LOG("HCLK_MUX\n");
}