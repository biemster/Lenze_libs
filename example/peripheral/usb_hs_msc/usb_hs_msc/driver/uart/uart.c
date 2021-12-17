/**************************************************************************************************
 
  Phyplus Microelectronics Limited confidential and proprietary. 
  All rights reserved.

  IMPORTANT: All rights of this software belong to Phyplus Microelectronics 
  Limited ("Phyplus"). Your use of this Software is limited to those 
  specific rights granted under  the terms of the business contract, the 
  confidential agreement, the non-disclosure agreement and any other forms 
  of agreements as a customer or a partner of Phyplus. You may not use this 
  Software unless you agree to abide by the terms of these agreements. 
  You acknowledge that the Software may not be modified, copied, 
  distributed or disclosed unless embedded on a Phyplus Bluetooth Low Energy 
  (BLE) integrated circuit, either as a product or is integrated into your 
  products.  Other than for the aforementioned purposes, you may not use, 
  reproduce, copy, prepare derivative works of, modify, distribute, perform, 
  display or sell this Software and/or its documentation for any purposes.

  YOU FURTHER ACKNOWLEDGE AND AGREE THAT THE SOFTWARE AND DOCUMENTATION ARE
  PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED,
  INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF MERCHANTABILITY, TITLE,
  NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL
  PHYPLUS OR ITS SUBSIDIARIES BE LIABLE OR OBLIGATED UNDER CONTRACT,
  NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR OTHER
  LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
  INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE
  OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT
  OF SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
  (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
  
**************************************************************************************************/

/*******************************************************************************
* @file		uart.c
* @brief	Contains all functions support for uart driver
* @version	0.0
* @date		19. Oct. 2017
* @author	qing.han
* 
* Copyright(C) 2016, PhyPlus Semiconductor
* All rights reserved.
*
*******************************************************************************/
#include <string.h>
#include "bus_dev.h"
#include "mcu.h"
#include "clock.h"
#include "uart.h"
#include "error.h"

typedef struct _uart_Context
{
    bool          enable;
    
    uint8_t       tx_state;
    uart_Tx_Buf_t tx_buf;
    uart_Cfg_t    cfg;
}uart_Ctx_t;

static uart_Ctx_t m_uartCtx[2] = 
{
    {.enable = FALSE,},
    {.enable = FALSE,},    
};

static int txmit_buf_use_tx_buf(UART_INDEX_e uart_index,uint8_t *buf,uint16_t len)
{
    uart_Tx_Buf_t* p_txbuf = &(m_uartCtx[uart_index].tx_buf);
    uint8_t* p_data;
    AP_UART_TypeDef * cur_uart = (AP_UART_TypeDef *) AP_UART0_BASE;
  
    if(len == 0 || buf == NULL)
        return PPlus_ERR_INVALID_PARAM;
   
    if(p_txbuf->tx_state == TX_STATE_UNINIT)
        return PPlus_ERR_NO_MEM;
    
    if(p_txbuf->tx_state != TX_STATE_IDLE)
        return PPlus_ERR_BUSY;
    
    if(p_txbuf->tx_buf_size < len)
        return PPlus_ERR_NO_MEM;

    memcpy(p_txbuf->tx_buf, buf, len);
    p_txbuf->tx_data_size = len;
    p_txbuf->tx_data_offset = 0;
    p_txbuf->tx_state = TX_STATE_TX;

    p_data = p_txbuf->tx_buf;
    len = p_txbuf->tx_data_size - p_txbuf->tx_data_offset;
    len = len > UART_TX_FIFO_SIZE ? UART_TX_FIFO_SIZE : len;

    if(uart_index == UART1)    
        cur_uart =   (AP_UART_TypeDef *) AP_UART1_BASE;    
    cur_uart->IER &= ~(IER_ETBEI);  

    while(len--)    
        cur_uart->THR = p_data[p_txbuf->tx_data_offset++];    
    cur_uart->IER |= IER_ETBEI;
    //hal_pwrmgr_lock(MOD_UART);//todo

    return PPlus_SUCCESS;
}

static int txmit_buf_polling(UART_INDEX_e uart_index,uint8_t *buf,uint16_t len)
{
    //volatile int timeout = 0;     
    AP_UART_TypeDef * cur_uart = (AP_UART_TypeDef *) AP_UART0_BASE;

    if(uart_index == UART1)    
        cur_uart = (AP_UART_TypeDef *) AP_UART1_BASE;    

    HAL_WAIT_CONDITION_TIMEOUT(!(cur_uart->USR & USR_BUSY), 100000);
    while(len--)
    {  
        HAL_WAIT_CONDITION_TIMEOUT((cur_uart->LSR & LSR_THRE), 100000);
        cur_uart->THR = *buf++;
        //timeout=0;
    }
    //wait shift register empty
    HAL_WAIT_CONDITION_TIMEOUT((cur_uart->LSR & LSR_TEMT), 100000);
    
    return PPlus_SUCCESS;;
}

static void irq_rx_handler(UART_INDEX_e uart_index,uint8_t flg)
{
    int i;
    uint8_t data[UART_RX_FIFO_SIZE];
    uint8_t len;
    AP_UART_TypeDef *cur_uart = (AP_UART_TypeDef *)AP_UART0_BASE;
	    
    if(uart_index == UART1)    
        cur_uart = (AP_UART_TypeDef *) AP_UART1_BASE;    
				
    if(m_uartCtx[uart_index].cfg.use_fifo)
    {
        len = cur_uart->RFL;
        for(i = 0; i< len; i++)        
            data[i] = (uint8_t)(cur_uart->RBR & 0xff);        
    }
    else
    {
        len = 1;
        cur_uart->LSR;  //clear interrupt
        data[0] = (uint8_t)(cur_uart->RBR & 0xff);
    }

    if(m_uartCtx[uart_index].cfg.evt_handler)
    {
        uart_Evt_t evt;
        evt.type = flg;
        evt.data = data;
        evt.len = len;
        m_uartCtx[uart_index].cfg.evt_handler(&evt);
    }
}

static void irq_tx_empty_handler(UART_INDEX_e uart_index)
{
    uart_Tx_Buf_t* p_txbuf = &(m_uartCtx[uart_index].tx_buf);
    uint8_t* p_data;
    uint16_t len;
    AP_UART_TypeDef *cur_uart = (AP_UART_TypeDef *)AP_UART0_BASE;

    if(m_uartCtx[uart_index].cfg.use_fifo == FALSE)
        return;
    if(m_uartCtx[uart_index].cfg.use_tx_buf == FALSE)
        return;
    if(p_txbuf->tx_state != TX_STATE_TX)
        return;

    p_data = p_txbuf->tx_buf;
    len = p_txbuf->tx_data_size - p_txbuf->tx_data_offset;
    len = len > UART_TX_FIFO_SIZE ? UART_TX_FIFO_SIZE : len;
    
    if(len == 0)
    {
        p_txbuf->tx_state = TX_STATE_IDLE;
        p_txbuf->tx_data_offset = 0;
        p_txbuf->tx_data_size = 0;

        if(m_uartCtx[uart_index].cfg.evt_handler)
        {
            uart_Evt_t evt = 
            {
                .type = UART_EVT_TYPE_TX_COMPLETED,
                .data = NULL,
                .len = 0,
            };
            m_uartCtx[uart_index].cfg.evt_handler(&evt);
        }
        //hal_pwrmgr_unlock(MOD_UART);//todo
        return;
    }

    if(uart_index == UART1)    
        cur_uart =   (AP_UART_TypeDef *) AP_UART1_BASE;    
		
    while(len--)    
        cur_uart->THR = p_data[p_txbuf->tx_data_offset++];    
}

static int uart_hw_init(UART_INDEX_e uart_index)
{
    uart_Cfg_t* pcfg;
    int pclk = hal_clk_get_value(PCLK);
    uint32_t dll;
    
    AP_UART_TypeDef * cur_uart = AP_UART0;
    MODULE_e mod        = MOD_UART0;
    IRQn_Type irq_type  = UART0_IRQn;
    //gpio_fmux_e fmux_tx    = FMUX_UART0_TX;
	//gpio_fmux_e fmux_rx = FMUX_UART0_RX;

    if(uart_index== UART1){
        cur_uart    = AP_UART1;
        mod         = MOD_UART1;
        irq_type    = UART1_IRQn;
        //fmux_tx     = FMUX_UART1_TX;
        //fmux_rx     = FMUX_UART1_RX;
    }
    
    if((m_uartCtx[uart_index].cfg.tx_pin == GPIO_DUMMY) && (m_uartCtx[uart_index].cfg.rx_pin == GPIO_DUMMY))
        return PPlus_ERR_INVALID_PARAM;

    pcfg = &(m_uartCtx[uart_index].cfg);

    hal_clk_gate_enable(mod);
    //hal_clk_reset(mod);
    
    hal_gpio_pull_set(pcfg->tx_pin, GPIO_PULL_UP);
    hal_gpio_pull_set(pcfg->rx_pin, GPIO_PULL_UP);
    
//    hal_gpio_pin_init(pcfg->tx_pin,GPIO_OUTPUT);
//    hal_gpio_pin_init(pcfg->rx_pin,GPIO_INPUT);
//    
    //hal_gpio_fmux_set(pcfg->tx_pin, fmux_tx);
    //hal_gpio_fmux_set(pcfg->rx_pin, fmux_rx);

    cur_uart->LCR =0;  
    dll = ((pclk>>4)+(pcfg->baudrate>>1))/pcfg->baudrate;
    cur_uart->MCR=0x0;
    cur_uart->LCR=0x80; 
    cur_uart->DLM=(dll & 0xFF00) >> 8;   
    cur_uart->DLL=(dll & 0xFF);   

    if(pcfg->parity)    
        cur_uart->LCR = 0x1b; //8bit, 1 stop even parity    
    else    
        cur_uart->LCR = 0x3;  //8bit, 1 stop no parity    
    
    if(pcfg->use_fifo)//set fifo, enable tx FIFO mode(empty trigger), rx FIFO mode(1/2 trigger)
        cur_uart->FCR= FCR_TX_FIFO_RESET|FCR_RX_FIFO_RESET|FCR_FIFO_ENABLE|UART_FIFO_RX_TRIGGER|UART_FIFO_TX_TRIGGER;    
    else     
        cur_uart->FCR=0;
        
    //enable Received Data Available Interrupt
    cur_uart->IER = IER_ERBFI;

    if(pcfg->use_tx_buf)    
        cur_uart->IER |= IER_ETBEI;    
    
    NVIC_SetPriority(irq_type, IRQ_PRIO_HAL);
    NVIC_EnableIRQ(irq_type);
    
    return PPlus_SUCCESS;
}

static int uart_hw_deinit(UART_INDEX_e uart_index)
{
    MODULE_e mod = MOD_UART0;
    IRQn_Type irq_type = UART0_IRQn;
    if(uart_index== UART1){
        mod         = MOD_UART1;
       irq_type    = UART1_IRQn;
    }
    
    NVIC_DisableIRQ(irq_type);
    hal_gpio_fmux_default(m_uartCtx[uart_index].cfg.tx_pin);
    hal_gpio_fmux_default(m_uartCtx[uart_index].cfg.rx_pin);
    
    hal_clk_gate_enable(mod);
    hal_clk_reset(mod);
    hal_clk_gate_disable(mod);
    return PPlus_SUCCESS;
}
/**************************************************************************************
 * @fn          hal_UART0_IRQHandler
 *
 * @brief       This function process for uart interrupt 
 *
 * input parameters
 *
 * @param       None.      
 *
 * output parameters
 *
 * @param       None.
 *
 * @return      None.
 **************************************************************************************/
void __attribute__((used)) hal_UART0_IRQHandler(void)
{
    uint8_t IRQ_ID= (AP_UART0->IIR & 0x0f);
    
    if(m_uartCtx[UART0].enable == FALSE)
        return;
    
    switch(IRQ_ID)
    {
        case TIMEOUT_IRQ:
            irq_rx_handler(UART0,UART_EVT_TYPE_RX_DATA_TO);
            break;
        case RDA_IRQ:
            irq_rx_handler(UART0,UART_EVT_TYPE_RX_DATA);
            break;
        case THR_EMPTY:
            irq_tx_empty_handler(UART0);
            break;
        case RLS_IRQ:
            break;  
        case BUSY_IRQ:
            (void)AP_UART0->USR;
            break;	
        default:
            break; 	
    }
}

void __attribute__((used)) hal_UART1_IRQHandler(void)
{
    uint8_t IRQ_ID= (AP_UART1->IIR & 0x0f);

    if(m_uartCtx[UART1].enable == FALSE)
        return;
        
    switch(IRQ_ID)
    {
        case TIMEOUT_IRQ:
            irq_rx_handler(UART1,UART_EVT_TYPE_RX_DATA_TO);
            break;
        case RDA_IRQ:
            irq_rx_handler(UART1,UART_EVT_TYPE_RX_DATA);
            break;
        case THR_EMPTY:
            irq_tx_empty_handler(UART1);
            break;
        case RLS_IRQ:
            break;  
        case BUSY_IRQ:
            (void)AP_UART1->USR;
            break;
        default:
            break;            
    }
}

#if 0
static void uart_wakeup_process_0(void)
{
    uart_hw_init(UART0);
}

static void uart_wakeup_process_1(void)
{
    uart_hw_init(UART1);
}
#endif

int hal_uart_init(uart_Cfg_t cfg,UART_INDEX_e uart_index)
{
    if(m_uartCtx[uart_index].enable)
        return PPlus_ERR_BUSY;
    
    if(cfg.hw_fwctrl)
        return PPlus_ERR_NOT_SUPPORTED;
    
    memset(&(m_uartCtx[uart_index]), 0, sizeof(m_uartCtx));    
    memcpy(&(m_uartCtx[uart_index].cfg), &cfg, sizeof(uart_Cfg_t));
    uart_hw_init(uart_index);
    m_uartCtx[uart_index].enable = TRUE;

//    if(uart_index == UART0)
//        hal_pwrmgr_register(MOD_UART0, NULL,  uart_wakeup_process_0);
//    else
//        hal_pwrmgr_register(MOD_UART1, NULL,  uart_wakeup_process_1);
    return PPlus_SUCCESS;
}

int hal_uart_deinit(UART_INDEX_e uart_index)
{
    uart_hw_deinit(uart_index);
     
    memset(&(m_uartCtx[uart_index]), 0, sizeof(m_uartCtx)); 
    m_uartCtx[uart_index].enable = FALSE;
//    if(uart_index == UART0)
//        hal_pwrmgr_unregister(MOD_UART0);
//    else
//        hal_pwrmgr_unregister(MOD_UART1);
    return PPlus_SUCCESS;
}

int hal_uart_set_tx_buf(UART_INDEX_e uart_index,uint8_t* buf, uint16_t size)
{
    uart_Tx_Buf_t* p_txbuf = &(m_uartCtx[uart_index].tx_buf);
    
    if(m_uartCtx[uart_index].enable == FALSE)
        return PPlus_ERR_INVALID_STATE;

    if(m_uartCtx[uart_index].cfg.use_tx_buf == FALSE)
        return PPlus_ERR_NOT_SUPPORTED;

    if(p_txbuf->tx_state != TX_STATE_UNINIT)
        return PPlus_ERR_INVALID_STATE;

    HAL_ENTER_CRITICAL_SECTION();
    p_txbuf->tx_buf = buf;
    p_txbuf->tx_buf_size = size;
    p_txbuf->tx_data_offset = 0;
    p_txbuf->tx_data_size= 0;
    p_txbuf->tx_state = TX_STATE_IDLE;
    HAL_EXIT_CRITICAL_SECTION();

    return PPlus_SUCCESS;
}

int hal_uart_get_tx_ready(UART_INDEX_e uart_index)
{
    if(m_uartCtx[uart_index].cfg.use_tx_buf == FALSE)
        return PPlus_SUCCESS;
    
    if(m_uartCtx[uart_index].tx_buf.tx_state == TX_STATE_IDLE)
        return PPlus_SUCCESS;
    
    return PPlus_ERR_BUSY;
}

int hal_uart_send_buff(UART_INDEX_e uart_index,uint8_t *buff,uint16_t len)
{
    if(m_uartCtx[uart_index].cfg.use_tx_buf)        
        return txmit_buf_use_tx_buf(uart_index,buff,len);
    return txmit_buf_polling(uart_index,buff,len);
}

int hal_uart_send_byte(UART_INDEX_e uart_index,unsigned char data)
{
    AP_UART_TypeDef * cur_uart = (AP_UART_TypeDef *) AP_UART0_BASE;

    if(uart_index == UART1)    
        cur_uart =   (AP_UART_TypeDef *) AP_UART1_BASE;    
    
    HAL_WAIT_CONDITION_TIMEOUT((cur_uart->LSR & LSR_THRE), 10000);
    cur_uart->THR=data;
    HAL_WAIT_CONDITION_TIMEOUT((cur_uart->LSR & LSR_TEMT), 10000);
    
    return PPlus_SUCCESS;
}	

int hal_uart_send_byte_time(UART_INDEX_e uart_index,unsigned char data)
{
    AP_UART_TypeDef * cur_uart = (AP_UART_TypeDef *) AP_UART0_BASE;
    int one_byte_time= 0;

    if(uart_index == UART1)    
        cur_uart =   (AP_UART_TypeDef *) AP_UART1_BASE;    
    
    HAL_WAIT_CONDITION_TIMEOUT((cur_uart->LSR & LSR_THRE), 10000);
    cur_uart->THR=data;
    do{
        one_byte_time++;
    }while((cur_uart->LSR & LSR_TEMT) == 0);

    return one_byte_time;
}	