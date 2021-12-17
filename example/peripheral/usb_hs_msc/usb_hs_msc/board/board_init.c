/*
 * Copyright (C) 2017 C-SKY Microsystems Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************************************************
 * @file     board_init.c
 * @brief    CSI Source File for board init
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include <stdio.h>
#include <stdint.h>
#include "core_802.h"
#include "uart.h"
;
void board_init(void)
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
