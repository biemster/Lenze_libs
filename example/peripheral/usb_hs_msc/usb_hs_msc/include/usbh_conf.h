#ifndef __USBH_CONF_H
#define __USBH_CONF_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mcu.h"
#include "core_802.h"
#include "usb_def.h"
#include "usb_hal_hcd.h"
#include "log.h"


#define USBH_MAX_NUM_ENDPOINTS                2
#define USBH_MAX_NUM_INTERFACES               2
#define USBH_MAX_NUM_CONFIGURATION            1
#define USBH_MAX_NUM_SUPPORTED_CLASS          1
#define USBH_KEEP_CFG_DESCRIPTOR              0
#define USBH_MAX_SIZE_CONFIGURATION           0x200
#define USBH_MAX_DATA_BUFFER                  0x200
#define USBH_DEBUG_LEVEL                      2
#define USBH_USE_OS                           0


#define USBH_malloc               malloc
#define USBH_free                 free
#define USBH_memset               memset
#define USBH_memcpy               memcpy


#if (USBH_DEBUG_LEVEL > 0)
#define USBH_UsrLog(...)   printk(__VA_ARGS__);\
                           printk("\n");
#else
#define USBH_UsrLog(...)
#endif


#if (USBH_DEBUG_LEVEL > 1)

#define USBH_ErrLog(...)   printk("ERROR: ") ;\
                           printk(__VA_ARGS__);\
                           printk("\n");
#else
#define USBH_ErrLog(...)
#endif

#if (USBH_DEBUG_LEVEL > 2)
#define USBH_DbgLog(...)   printk("DEBUG : ") ;\
                           printk(__VA_ARGS__);\
                           printk("\n");
#else
#define USBH_DbgLog(...)
#endif

#endif                          /* __USBH_CONF_H */


