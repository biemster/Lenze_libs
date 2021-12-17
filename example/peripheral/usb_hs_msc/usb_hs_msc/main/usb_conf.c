#include <stdio.h>
#include "log.h"
#include "core_802.h"
#include "mcu_phy_bumbee.h"
#include "misc.h"
#include "usb_hal_hcd.h"
#include "usbh_core.h"

usb_hal_hcd_t hhcd;

USBH_StatusTypeDef USBH_HAL_Init(USBH_HandleTypeDef * phost)
{ 
  hhcd.rx_fifo_sz = 16;
  hhcd.tx_fifo_sz = 16;
  hhcd.rx_thd =8;
  hhcd.tx_thd =8;

  /* Link the driver to the stack */
  hhcd.pData = phost;
  phost->pData = &hhcd;

  /* Initialize the LL Driver */
  hal_hcd_init(&hhcd);
  
    
  USBH_LL_SetTimer(phost, hal_hcd_get_current_frame(&hhcd));

  return USBH_OK;
}