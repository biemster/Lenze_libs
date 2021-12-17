#include <stdio.h>
#include "log.h"
#include "core_802.h"
#include "mcu_phy_bumbee.h"
#include "misc.h"
#include "common.h"
#include "usb_hal_hcd.h"
#include "usbh_core.h"

HCD_HandleTypeDef hcd_handle;
extern USBH_HandleTypeDef hUSBHost;
/**
  * @brief  DeInitializes the HCD MSP.
  * @param  hhcd: HCD handle
  * @retval None
  */
void HAL_HCD_MspDeInit(HCD_HandleTypeDef *hhcd)
{


}

/**
  * @brief  SOF callback.
  * @param  hhcd: HCD handle
  * @retval None
  */
void HAL_HCD_SOF_Callback(HCD_HandleTypeDef *hhcd)
{
    USBH_LL_IncTimer(hhcd->pData);
}

/**
  * @brief  Connect callback.
  * @param  hhcd: HCD handle
  * @retval None
  */
void HAL_HCD_Connect_Callback(HCD_HandleTypeDef *hhcd)
{
    USBH_LL_Connect(hhcd->pData);
}

/**
  * @brief  Disconnect callback.
  * @param  hhcd: HCD handle
  * @retval None
  */
void HAL_HCD_Disconnect_Callback(HCD_HandleTypeDef *hhcd)
{
    USBH_LL_Disconnect(hhcd->pData);
}

/**
  * @brief  Port Port Enabled callback.
  * @param  hhcd: HCD handle
  * @retval None
  */
void HAL_HCD_PortEnabled_Callback(HCD_HandleTypeDef *hhcd)
{
    USBH_LL_PortEnabled(hhcd->pData);
}


/**
  * @brief  Port Port Disabled callback.
  * @param  hhcd: HCD handle
  * @retval None
  */
void HAL_HCD_PortDisabled_Callback(HCD_HandleTypeDef *hhcd)
{
    USBH_LL_PortDisabled(hhcd->pData);
}

/**
  * @brief  USBH_LL_Init
  *         Initialize the Low Level portion of the Host driver.
  * @param  phost: Host handle
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_LL_Init(USBH_HandleTypeDef *phost)
{
    hcd_handle.rx_fifo_sz = 16;
    hcd_handle.tx_fifo_sz = 16;
    hcd_handle.rx_thd = 8;
    hcd_handle.tx_thd = 8;

    /* Link the driver to the stack */
    hcd_handle.pData = phost;
    phost->pData = &hcd_handle;

    /* Initialize the LL Driver */
    HAL_HCD_Init(&hcd_handle);


    USBH_LL_SetTimer(phost, HAL_HCD_Get_Current_Frame(&hcd_handle));

    return USBH_OK;
}

/**
  * @brief  De-Initializes the Low Level portion of the Host driver.
  * @param  phost: Host handle
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_LL_DeInit(USBH_HandleTypeDef *phost)
{
    //HAL_HCD_DeInit(phost->pData);
    return USBH_OK;
}

/**
  * @brief  Starts the Low Level portion of the Host driver.
  * @param  phost: Host handle
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_LL_Start(USBH_HandleTypeDef *phost)
{
    HAL_HCD_VBUS_Enable(phost->pData);
    return USBH_OK;
}

/**
  * @brief  Stops the Low Level portion of the Host driver.
  * @param  phost: Host handle
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_LL_Stop(USBH_HandleTypeDef *phost)
{
    HAL_HCD_VBUS_Disable(phost->pData);
    return USBH_OK;
}

/**
  * @brief  Returns the USB Host Speed from the Low Level Driver.
  * @param  phost: Host handle
  * @retval USBH Speeds
  */
USBH_SpeedTypeDef USBH_LL_GetSpeed(USBH_HandleTypeDef *phost)
{
    USBH_SpeedTypeDef speed = USBH_SPEED_FULL;

    switch (HAL_HCD_Get_Device_Speed(phost->pData))
    {
    case 0:
        speed = USBH_SPEED_FULL;
        break;

    case 1:
        speed = USBH_SPEED_LOW;
        break;

    default:
        speed = USBH_SPEED_FULL;
        break;
    }
    return speed;
}

/**
  * @brief  Resets the Host Port of the Low Level Driver.
  * @param  phost: Host handle
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_LL_ResetPort(USBH_HandleTypeDef *phost)
{
    HAL_HCD_Reset_Device(phost->pData);
    return USBH_OK;
}


USBH_StatusTypeDef USBH_LL_Set_Device_Address(USBH_HandleTypeDef *phost, uint8_t address)
{
    HAL_HCD_Set_Device_Address(phost->pData, address);
    return USBH_OK;
}


USBH_StatusTypeDef USBH_LL_Set_EndPoint_MAX_PKT_SZ(USBH_HandleTypeDef *phost, uint8_t ep_idx, uint16_t max_pkt_sz)
{
    HAL_HCD_Set_EP_MAX_PKT_SZ(phost->pData, ep_idx, max_pkt_sz);
    return USBH_OK;
}

/**
  * @brief  Returns the last transferred packet size.
  * @param  phost: Host handle
  * @param  pipe: Pipe index
  * @retval Packet Size
  */
uint32_t USBH_LL_GetLastXferSize(USBH_HandleTypeDef *phost, uint8_t pipe)
{
    return HAL_HCD_Get_Xfer_Count(phost->pData, pipe);
}

/**
  * @brief  Submits a new URB to the low level driver.
  * @param  phost: Host handle
  * @param  pipe: Pipe index
  *          This parameter can be a value from 1 to 15
  * @param  direction: Channel number
  *          This parameter can be one of these values:
  *           0: Output
  *           1: Input
  * @param  ep_type: Endpoint Type
  *          This parameter can be one of these values:
  *            @arg EP_TYPE_CTRL: Control type
  *            @arg EP_TYPE_ISOC: Isochronous type
  *            @arg EP_TYPE_BULK: Bulk type
  *            @arg EP_TYPE_INTR: Interrupt type
  * @param  token: Endpoint Type
  *          This parameter can be one of these values:
  *            @arg 0: PID_SETUP
  *            @arg 1: PID_DATA
  * @param  pbuff: pointer to URB data
  * @param  length: length of URB data
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_LL_SubmitURB(USBH_HandleTypeDef *phost,
                                     uint8_t ep_idx,
                                     uint8_t direction,
                                     uint8_t ep_type,
                                     uint8_t token,
                                     uint8_t *pbuff,
                                     uint16_t length
                                    )
{
    HAL_HCD_SubmitRequest(phost->pData,
                          ep_idx,
                          direction, ep_type, token, pbuff, length);
    return USBH_OK;
}

/**
  * @brief  Gets a URB state from the low level driver.
  * @param  phost: Host handle
  * @param  pipe: Pipe index
  *          This parameter can be a value from 1 to 15
  * @retval URB state
  *          This parameter can be one of these values:
  *            @arg URB_IDLE
  *            @arg URB_DONE
  *            @arg URB_NOTREADY
  *            @arg URB_NYET
  *            @arg URB_ERROR
  *            @arg URB_STALL
  */
USBH_URBStateTypeDef USBH_LL_GetURBState(USBH_HandleTypeDef *phost,
        uint8_t pipe)
{
    return (USBH_URBStateTypeDef) HAL_HCD_GetURBState(phost->pData, pipe);
}

/**
  * @brief  Drives VBUS.
  * @param  phost: Host handle
  * @param  state: VBUS state
  *          This parameter can be one of these values:
  *           0: VBUS Active
  *           1: VBUS Inactive
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_LL_DriverVBUS(USBH_HandleTypeDef *phost, uint8_t state)
{
    if (state == 0)
    {

    }
    else
    {

    }
    USBH_Delay(200);

    return USBH_OK;
}

/**
  * @brief  Sets toggle for a pipe.
  * @param  phost: Host handle
  * @param  ep_idx: ep index
  * @param  toggle: toggle (0/1)
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_LL_SetToggle(USBH_HandleTypeDef *phost, uint8_t ep_idx,
                                     uint8_t toggle)
{
    if (hcd_handle.ep[ep_idx].ep_is_in)
    {
        hcd_handle.ep[ep_idx].toggle_in = toggle;
    }
    else
    {
        hcd_handle.ep[ep_idx].toggle_out = toggle;
    }
    return USBH_OK;
}

/**
  * @brief  Returns the current toggle of a pipe.
  * @param  phost: Host handle
  * @param  ep_idx: EndPoint index
  * @retval toggle (0/1)
  */
uint8_t USBH_LL_GetToggle(USBH_HandleTypeDef *phost, uint8_t ep_idx)
{
    uint8_t toggle = 0;

    if (hcd_handle.ep[ep_idx].ep_is_in)
    {
        toggle = hcd_handle.ep[ep_idx].toggle_in;
    }
    else
    {
        toggle = hcd_handle.ep[ep_idx].toggle_out;
    }
    return toggle;
}

/**
  * @brief  Delay routine for the USB Host Library
  * @param  Delay: Delay in ms
  * @retval None
  */
void USBH_Delay(uint32_t Delay)
{
    uint32_t  start = hUSBHost.Timer;
    uint32_t temp = 0;

    while (1)
    {
        if (hUSBHost.Timer >= start)
        {
            if (hUSBHost.Timer - start >= Delay)
            {
                return;
            }
        }
        else
        {
            temp = 0xffffffff - start;
            if ((hUSBHost.Timer + temp) > Delay)
            {
                return;
            }
        }
    }
}

