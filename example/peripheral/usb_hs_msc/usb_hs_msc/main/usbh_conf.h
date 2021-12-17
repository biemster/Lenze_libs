#ifndef __USBH_CONF_H
#define __USBH_CONF_H


#define USBH_MAX_NUM_ENDPOINTS                2
#define USBH_MAX_NUM_INTERFACES               2
#define USBH_MAX_NUM_CONFIGURATION            1
#define USBH_MAX_NUM_SUPPORTED_CLASS          1
#define USBH_KEEP_CFG_DESCRIPTOR              0
#define USBH_MAX_SIZE_CONFIGURATION           0x200
#define USBH_MAX_DATA_BUFFER                  0x200
#define USBH_DEBUG_LEVEL                      2


#define USBH_malloc                           malloc
#define USBH_free                             free
#define USBH_memset                           memset
#define USBH_memcpy                           memcpy

#endif