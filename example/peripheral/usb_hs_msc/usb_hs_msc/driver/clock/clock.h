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
#ifndef _HAL_CLOCK_H
#define _HAL_CLOCK_H

#include "types.h"
#include "bus_dev.h"
//#include "common.h"

typedef enum{
    CLK_32K_XTAL        = 0,
    CLK_32K_RCOSC       = 1,
	
}CLK32K_e;

#if (PHY_MCU_TYPE == MCU_BUMBEE_M0 || PHY_MCU_TYPE == MCU_BUMBEE_CK802)

typedef enum{
    XTAL_16M  = 0,
    DBL_B_32M = 1,
    DBL_32    = 2,
    DLL_32M   = 3,
}ClkSrc_e;

typedef enum  _SYSCLK_SEL {
    SYS_CLK_RC_32M      = 0,
    SYS_CLK_DLL_32M     = 1,
    SYS_CLK_XTAL_16M    = 2,
    SYS_CLK_DLL_48M     = 3,
    SYS_CLK_DLL_64M     = 4,
    SYS_CLK_DLL_96M     = 5,
    SYS_CLK_8M          = 6,
    SYS_CLK_4M          = 7,
    SYS_CLK_NUM         = 8,
}sysclk_t;

typedef enum{
    NO_AP_NO_CP = 0,HCLK = 0,
    PCLK = 1,
} pclk_Type_t;

typedef enum{
    HCLK_CHANGE = 0,
    AP_CLK_CHANGE = 1,
    CP_CLK_CHANGE = 2,
} clk_update_Type_t;

typedef struct _clk_Evt_t{
    uint8_t   flag;
	
}clk_Evt_t;

typedef void (*clk_Hdl_t)(clk_Evt_t* pev);

typedef struct _clk_Contex_t{
    bool      enable;
    uint32_t  hclk;
    uint32_t  pclk;
    clk_Hdl_t evt_handler;
	
}clk_Ctx_t;

void hal_clk_gate_enable(MODULE_e module);
void hal_clk_gate_disable(MODULE_e module);
int hal_clk_gate_get(MODULE_e module);
void hal_clk_get_modules_state(uint32_t* buff);
void hal_clk_reset(MODULE_e module);
void hal_clk_rf_config(ClkSrc_e sel);
void hal_clk_rxadc_config(ClkSrc_e sel);
void hal_clk_set_hclk(sysclk_t hclk_sel);
bool hal_clk_set_pclk(uint32_t div);
int32_t hal_clk_get_value(pclk_Type_t sel);
int hal_clk_init(sysclk_t hclk_sel,clk_Hdl_t evt_handler);

#elif ((PHY_MCU_TYPE == MCU_PRIME_A1) ||(PHY_MCU_TYPE == MCU_PRIME_A2))

typedef enum  _SYSCLK_SEL {
  SYS_CLK_RC_32M      = 0,
  SYS_CLK_DLL_32M     = 1,
  SYS_CLK_XTAL_16M    = 2,
  SYS_CLK_DLL_48M     = 3,
	SYS_CLK_DLL_64M     = 4,
	SYS_CLK_DLL_96M     = 5,
	SYS_CLK_DBL_32M     = 6
}sysclk_t;

void hal_clk_gate_enable(MODULE_e module);
void hal_clk_gate_disable(MODULE_e module);
void hal_clk_reset(MODULE_e module);

uint32_t hal_systick(void);
uint32_t hal_ms_intv(uint32_t tick);
void hal_clk_rtc_config(CLK32K_e clk32Mode);

#endif

#endif

