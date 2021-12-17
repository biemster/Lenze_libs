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
#include "clock.h"
#include "global_config.h"
#include "error.h"

extern uint32_t hclk,pclk;//todo
 uint32_t osal_sys_tick;//todo

#if (PHY_MCU_TYPE == MCU_BUMBEE_M0 || PHY_MCU_TYPE == MCU_BUMBEE_CK802)
void hal_clk_gate_enable(MODULE_e module)
{	
	if(module < MOD_CP_CPU)
	{
		AP_PCR->SW_CLK |= BIT(module);	
	}
	else if(module < MOD_PCLK_CACHE)
	{
		AP_PCR->SW_CLK1 |= BIT(module-MOD_CP_CPU);
	}
	else if(module < MOD_USR0)
	{
		AP_PCR->CACHE_CLOCK_GATE |= BIT(module-MOD_PCLK_CACHE);
	}
}

void hal_clk_gate_disable(MODULE_e module)
{
	if(module < MOD_CP_CPU)
	{
		AP_PCR->SW_CLK &= ~(BIT(module));
	}
	else if(module < MOD_PCLK_CACHE)
	{
		AP_PCR->SW_CLK1 &= ~(BIT(module-MOD_CP_CPU));
	}
	else if(module < MOD_USR0)
	{
		AP_PCR->CACHE_CLOCK_GATE &= ~(BIT(module-MOD_PCLK_CACHE));
	}
}

int hal_clk_gate_get(MODULE_e module)
{
	if(module < MOD_CP_CPU)
	{
		return (AP_PCR->SW_CLK & BIT(module));
	}
	else if(module < MOD_PCLK_CACHE)
	{
		return (AP_PCR->SW_CLK1 & BIT(module-MOD_CP_CPU));
	}
	//else if(module < MOD_USR0)
	else
	{
		return (AP_PCR->CACHE_CLOCK_GATE & BIT(module-MOD_PCLK_CACHE));
	}
}

void hal_clk_get_modules_state(uint32_t* buff)
{
	*buff     = AP_PCR->SW_CLK;
	*(buff+1) = AP_PCR->SW_CLK1;
	*(buff+2) = AP_PCR->CACHE_CLOCK_GATE;
}
	
void hal_clk_reset(MODULE_e module)
{
	if(module < MOD_CP_CPU)
	{
		if((module >= MOD_TIMER5) &&(module <= MOD_TIMER6))
		{
			AP_PCR->SW_RESET0 &= ~BIT(5);
			AP_PCR->SW_RESET0 |= BIT(5);
		}
		else
		{
			AP_PCR->SW_RESET0 &= ~BIT(module);
			AP_PCR->SW_RESET0 |= BIT(module);
		}
	}
	else if(module < MOD_PCLK_CACHE)
	{		
		if((module >= MOD_TIMER1) &&(module <= MOD_TIMER4))
		{
			AP_PCR->SW_RESET2 &= ~BIT(4);
			AP_PCR->SW_RESET2 |= BIT(4);
		}
		else
		{
			AP_PCR->SW_RESET2 &= ~BIT(module-MOD_CP_CPU);
			AP_PCR->SW_RESET2 |= BIT(module-MOD_CP_CPU);
		}
	}
	else if(module < MOD_USR0)
	{
		AP_PCR->CACHE_RST &= ~BIT(1-(module-MOD_PCLK_CACHE));
		AP_PCR->CACHE_RST |= BIT(1-(module-MOD_PCLK_CACHE));
	}
}

//clock config and div
void hal_clk_rf_config(ClkSrc_e sel)
{
	AP_PCRM->CLKHF_CTL1 &= ~BIT(18);
	if(sel != XTAL_16M)
	{
		subWriteReg(&(AP_PCRM->CLKHF_CTL1),21,20 ,sel);
	}
	subWriteReg(&(AP_PCRM->CLKHF_CTL1),23,22 ,sel);
	AP_PCRM->CLKHF_CTL1 |= BIT(18);
}

void hal_clk_rxadc_config(ClkSrc_e sel)
{
	AP_PCRM->CLKHF_CTL1 &= ~BIT(19);
	if(sel != XTAL_16M)
	{
		subWriteReg(&(AP_PCRM->CLKHF_CTL1),21,20,sel);
	}
	subWriteReg(&(AP_PCRM->CLKHF_CTL1),25,24,sel);
	AP_PCRM->CLKHF_CTL1 |= BIT(19);
}

static clk_Ctx_t mClk_Ctx = 
{
    .enable = FALSE,
    .hclk = 32000000,
    .pclk = 32000000,
    .evt_handler = NULL,
};

void hal_clk_cb(clk_Evt_t* pev)
{
    switch(pev->flag)
    {
        case 0x07:
        //LOG("hclk,apclk,cpclk change\n");
        break;
        case AP_CLK_CHANGE:
        //LOG("apclk change\n");
        break;
        case CP_CLK_CHANGE:
        //LOG("cpclk change\n");
        break;
        default:
        //LOG("unexpected\n");
        break;
    }
}

static void hal_clk_update(void)
{
	switch(AP_PCRM->CLKSEL & 0x07)
	{
		case SYS_CLK_RC_32M:
		case SYS_CLK_DLL_32M:
			mClk_Ctx.hclk = 32000000;
			break;
		case SYS_CLK_XTAL_16M:
			mClk_Ctx.hclk = 16000000;
			break;
		case SYS_CLK_4M:
			mClk_Ctx.hclk = 4000000;
			break;
		case SYS_CLK_8M:
			mClk_Ctx.hclk = 8000000;
			break;
		case SYS_CLK_DLL_48M:
			mClk_Ctx.hclk = 48000000;
			break;
		case SYS_CLK_DLL_64M:
			mClk_Ctx.hclk = 64000000;
			break;
		case SYS_CLK_DLL_96M:
			mClk_Ctx.hclk = 96000000;
			break;
		default:
			break;
	}
	mClk_Ctx.pclk = mClk_Ctx.hclk / (((AP_PCR->APB_CLK & 0xF0) >> 4) + 1);
}

void hal_clk_set_hclk(sysclk_t hclk_sel)
{
	uint8_t temp = 0;
	uint16_t delay=300;
	clk_Evt_t evt;

//	if((AP_PCRM->CLKSEL & 0x07) == hclk_sel)//todo
//		return;
	temp = AP_PCRM->CLKSEL & 0x07;
	
	switch(hclk_sel)
	{
		case SYS_CLK_RC_32M:
			break;
		case SYS_CLK_XTAL_16M:
			AP_PCRM->CLKHF_CTL0 |= BIT(18);//ENABLE_XTAL_TRIGGER;
			break;
		case SYS_CLK_4M:
		case SYS_CLK_8M:
			AP_PCRM->CLKHF_CTL0 |= BIT(18);//ENABLE_XTAL_TRIGGER;
			break;
		case SYS_CLK_DLL_32M:
			AP_PCRM->CLKHF_CTL0 |= BIT(18);//ENABLE_XTAL_TRIGGER;
			AP_PCRM->CLKHF_CTL1 &= ~BIT(21);//disable double 32M clock,we are now use 32M clock,should enable bit<13>
			AP_PCRM->CLKHF_CTL1 |= BIT(13);
			AP_PCRM->CLKHF_CTL1 |= BIT(7);
			break;
		case SYS_CLK_DLL_48M:
		case SYS_CLK_DLL_64M:
		case SYS_CLK_DLL_96M:
			AP_PCRM->CLKHF_CTL0 |= BIT(18);//ENABLE_XTAL_TRIGGER;
			AP_PCRM->CLKHF_CTL1 |= BIT(11+hclk_sel);
			AP_PCRM->CLKHF_CTL1 |= BIT(7);			
			break;
		default:
			break;
	}

	while (delay-- > 0);;//todo
	subWriteReg(&(AP_PCRM->CLKSEL),2,0,hclk_sel);
	hal_clk_update();
	
	if((mClk_Ctx.evt_handler != NULL) && ((hclk_sel + temp) != 1))
	{
		evt.flag = 0x07;//(BIT(HCLK_CHANGE) | BIT(AP_CLK_CHANGE) | BIT(CP_CLK_CHANGE));
		mClk_Ctx.evt_handler(&evt);
	}
}

bool hal_clk_set_pclk(uint32_t div)
{
    uint8_t divider;
    volatile int i = 100;
    clk_Evt_t evt;

    if((div == 0) || (div > 16))
        return FALSE;

    evt.flag = 0;
    divider = div -1;

    if(((AP_PCR->APB_CLK & 0xF0)>>4) != divider)
    {
        subWriteReg(&(AP_PCR->APB_CLK),7,4,divider);
        AP_PCR->APB_CLK_UPDATE = 3;
        while(i--);
    }
    evt.flag |= BIT(CP_CLK_CHANGE);	
    hal_clk_update();
    if(mClk_Ctx.evt_handler != NULL)
        mClk_Ctx.evt_handler(&evt);

    return TRUE;
}

int32_t hal_clk_get_value(pclk_Type_t sel)
{
    if(sel == HCLK)
        return mClk_Ctx.hclk;
    else
        return mClk_Ctx.pclk;
}

int hal_clk_init(sysclk_t hclk_sel,clk_Hdl_t evt_handler)
{	
	mClk_Ctx.enable = TRUE;
	mClk_Ctx.evt_handler = evt_handler;
	hal_clk_set_hclk(hclk_sel);
	return PPlus_SUCCESS;
}

#elif ((PHY_MCU_TYPE == MCU_PRIME_A1) ||(PHY_MCU_TYPE == MCU_PRIME_A2))


#endif

uint32_t hal_systick(void)
{
  return osal_sys_tick;
}

uint32_t hal_ms_intv(uint32_t tick)
{
  uint32_t diff = 0;
  if(osal_sys_tick < tick){
    diff = 0xffffffff- tick;
    diff = osal_sys_tick + diff;
  }
  else
  {
    diff = osal_sys_tick - tick;
  }
  return diff*625/1000;
}


const uint32_t g_hclk_table[SYS_CLK_NUM] = {
    32000000, //SYS_CLK_RC_32M      = 0,
    32000000, //SYS_CLK_DLL_32M     = 1,
    16000000, //SYS_CLK_XTAL_16M    = 2,
    48000000, //SYS_CLK_DLL_48M     = 3,
    64000000, //SYS_CLK_DLL_64M     = 4,
    96000000, //SYS_CLK_DLL_96M     = 5,
    8000000, //SYS_CLK_8M          = 6,
    4000000, //SYS_CLK_4M          = 7,
};

uint32_t clk_get_pclk(void)
{
    uint32_t pclk,hclk_sel;
    hclk_sel=(*(volatile int*)0x4000F03c)&0x07;    
    pclk = (g_hclk_table[hclk_sel] / (((AP_PCR->APB_CLK & 0xF0) >> 4) + 1));
    return pclk;
}
