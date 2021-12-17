#ifndef __USBH_CORE_H
#define __USBH_CORE_H

#ifdef __cplusplus
extern "C" {
#endif

#include "usbh_conf.h"
#include "usbh_def.h"
#include "usbh_ioreq.h"
#include "usbh_ctlreq.h"

#define HOST_USER_SELECT_CONFIGURATION          0x01U
#define HOST_USER_CLASS_ACTIVE                  0x02U
#define HOST_USER_CLASS_SELECTED                0x03U
#define HOST_USER_CONNECTION                    0x04U
#define HOST_USER_DISCONNECTION                 0x05U
#define HOST_USER_UNRECOVERED_ERROR             0x06U


USBH_StatusTypeDef  USBH_Init(USBH_HandleTypeDef *phost, void (*pUsrFunc)(USBH_HandleTypeDef *phost, uint8_t id), uint8_t id);
USBH_StatusTypeDef  USBH_DeInit(USBH_HandleTypeDef *phost);
USBH_StatusTypeDef  USBH_RegisterClass(USBH_HandleTypeDef *phost, USBH_ClassTypeDef *pclass);
USBH_StatusTypeDef  USBH_SelectInterface(USBH_HandleTypeDef *phost, uint8_t interface);
uint8_t             USBH_FindInterface(USBH_HandleTypeDef *phost,
                                       uint8_t Class,
                                       uint8_t SubClass,
                                       uint8_t Protocol);
uint8_t             USBH_GetActiveClass(USBH_HandleTypeDef *phost);

uint8_t             USBH_FindInterfaceIndex(USBH_HandleTypeDef *phost,
                                            uint8_t interface_number,
                                            uint8_t alt_settings);

uint8_t              USBH_IsPortEnabled(USBH_HandleTypeDef *phost);

USBH_StatusTypeDef  USBH_Start(USBH_HandleTypeDef *phost);
USBH_StatusTypeDef  USBH_Stop(USBH_HandleTypeDef *phost);
USBH_StatusTypeDef  USBH_Process(USBH_HandleTypeDef *phost);
USBH_StatusTypeDef  USBH_ReEnumerate(USBH_HandleTypeDef *phost);

/* USBH Low Level Driver */
USBH_StatusTypeDef   USBH_LL_Init(USBH_HandleTypeDef *phost);
USBH_StatusTypeDef   USBH_LL_DeInit(USBH_HandleTypeDef *phost);
USBH_StatusTypeDef   USBH_LL_Start(USBH_HandleTypeDef *phost);
USBH_StatusTypeDef   USBH_LL_Stop(USBH_HandleTypeDef *phost);

USBH_StatusTypeDef   USBH_LL_Connect(USBH_HandleTypeDef *phost);
USBH_StatusTypeDef   USBH_LL_Disconnect(USBH_HandleTypeDef *phost);
USBH_SpeedTypeDef    USBH_LL_GetSpeed(USBH_HandleTypeDef *phost);
USBH_StatusTypeDef   USBH_LL_ResetPort(USBH_HandleTypeDef *phost);
USBH_StatusTypeDef   USBH_LL_Set_Device_Address(USBH_HandleTypeDef * phost, uint8_t address);
USBH_StatusTypeDef   USBH_LL_Set_EndPoint_MAX_PKT_SZ(USBH_HandleTypeDef * phost,uint8_t ep_idx, uint16_t max_pkt_sz);
uint32_t             USBH_LL_GetLastXferSize(USBH_HandleTypeDef *phost,
                                             uint8_t ep_idx);

USBH_StatusTypeDef   USBH_LL_DriverVBUS(USBH_HandleTypeDef *phost,
                                        uint8_t state);

USBH_StatusTypeDef   USBH_LL_SubmitURB(USBH_HandleTypeDef *phost,
                                       uint8_t pipe,
                                       uint8_t direction,
                                       uint8_t ep_type,
                                       uint8_t token,
                                       uint8_t *pbuff,
                                       uint16_t length
									   );

USBH_URBStateTypeDef USBH_LL_GetURBState(USBH_HandleTypeDef *phost,
                                         uint8_t ep_idx);

USBH_StatusTypeDef USBH_LL_SetToggle(USBH_HandleTypeDef *phost,
                                     uint8_t ep_idx, uint8_t toggle);

uint8_t USBH_LL_GetToggle(USBH_HandleTypeDef *phost, uint8_t ep_idx);

void                 USBH_LL_PortDisabled(USBH_HandleTypeDef *phost);
void                 USBH_LL_PortEnabled(USBH_HandleTypeDef *phost);

/* USBH Time base */
void USBH_LL_SetTimer(USBH_HandleTypeDef *phost, uint32_t time);
void USBH_LL_IncTimer(USBH_HandleTypeDef *phost);

void USBH_Delay(uint32_t Delay);


#ifdef __cplusplus
}
#endif

#endif

