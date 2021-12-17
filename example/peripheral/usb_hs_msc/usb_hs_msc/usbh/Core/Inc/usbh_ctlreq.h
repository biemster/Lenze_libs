#ifndef __USBH_CTLREQ_H
#define __USBH_CTLREQ_H

#ifdef __cplusplus
extern "C" {
#endif

#include "usbh_core.h"


/*Standard Feature Selector for clear feature command*/
#define FEATURE_SELECTOR_ENDPOINT         0x00U
#define FEATURE_SELECTOR_DEVICE           0x01U
#define FEATURE_SELECTOR_REMOTEWAKEUP     0X01U


#define INTERFACE_DESC_TYPE               0x04U
#define ENDPOINT_DESC_TYPE                0x05U
#define INTERFACE_DESC_SIZE               0x09U


extern uint8_t USBH_CfgDesc[512];

USBH_StatusTypeDef USBH_CtlReq(USBH_HandleTypeDef *phost, uint8_t *buff,
                               uint16_t length);

USBH_StatusTypeDef USBH_GetDescriptor(USBH_HandleTypeDef *phost,
                                      uint8_t  req_type, uint16_t value_idx,
                                      uint8_t *buff, uint16_t length);

USBH_StatusTypeDef USBH_Get_DevDesc(USBH_HandleTypeDef *phost, uint8_t length);

USBH_StatusTypeDef USBH_Get_StringDesc(USBH_HandleTypeDef *phost,
                                       uint8_t string_index, uint8_t *buff,
                                       uint16_t length);

USBH_StatusTypeDef USBH_SetCfg(USBH_HandleTypeDef *phost, uint16_t cfg_idx);

USBH_StatusTypeDef USBH_Get_CfgDesc(USBH_HandleTypeDef *phost, uint16_t length);

USBH_StatusTypeDef USBH_SetAddress(USBH_HandleTypeDef *phost,
                                   uint8_t DeviceAddress);

USBH_StatusTypeDef USBH_SetInterface(USBH_HandleTypeDef *phost, uint8_t ep_idx,
                                     uint8_t altSetting);

USBH_StatusTypeDef USBH_SetFeature(USBH_HandleTypeDef *phost, uint8_t wValue);

USBH_StatusTypeDef USBH_ClrFeature(USBH_HandleTypeDef *phost, uint8_t ep_idx);

USBH_DescHeader_t *USBH_GetNextDesc(uint8_t *pbuf, uint16_t *ptr);


#ifdef __cplusplus
}
#endif

#endif /* __USBH_CTLREQ_H */
