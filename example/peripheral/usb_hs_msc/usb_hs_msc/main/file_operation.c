#include <stdio.h>
#include "log.h"
#include "core_802.h"
#include "mcu_phy_bumbee.h"
#include "misc.h"
#include "usb_hal_hcd.h"
#include "usbh_core.h"
#include "usbh_msc.h"
#include "ff.h"
#include "ff_gen_drv.h"
#include "usbh_diskio.h"

FATFS USBH_fatfs;
FIL MyFile;
FRESULT res = FR_OK;
uint32_t bytesWritten = 0;
uint8_t rtext[200] = {0};
uint8_t wtext[] = "USB Host Library : Mass Storage Example Test";

/**
  * @brief  Files operations: Read/Write and compare
  * @param  None
  * @retval None
  */
void MSC_File_Operations(void)
{
    uint16_t bytesread;

    LOG_INFO("INFO : FatFs Initialized \n");

    if (f_open(&MyFile, "0:USBHost.txt", FA_CREATE_ALWAYS | FA_WRITE) != FR_OK)
    {
        LOG_ERROR("Cannot Open 'USBHost.txt' file \n");
    }
    else
    {
        LOG_INFO("INFO : 'USBHost.txt' opened for write  \n");
        res = f_write(&MyFile, wtext, sizeof(wtext), (void *)&bytesWritten);
        f_close(&MyFile);

        if ((bytesWritten == 0) || (res != FR_OK)) /* EOF or Error */
        {
            LOG_ERROR("Cannot Write on the  'USBHost.txt' file \n");
        }
        else
        {
            if (f_open(&MyFile, "0:USBHost.txt", FA_READ) != FR_OK)
            {
                LOG_ERROR("Cannot Open 'USBHost.txt' file for read.\n");
            }
            else
            {
                LOG_INFO("INFO : Text written on the 'USBHost.txt' file \n");

                res = f_read(&MyFile, rtext, sizeof(rtext), (void *)&bytesread);

                if ((bytesread == 0) || (res != FR_OK)) /* EOF or Error */
                {
                    LOG_ERROR("Cannot Read from the  'USBHost.txt' file \n");
                }
                else
                {
                    LOG_DEBUG("Read Text : \n");
                    LOG_DEBUG((char *)rtext);
                    LOG_DEBUG("\n");
                }
                f_close(&MyFile);
            }
            /* Compare read data with the expected data */
            if ((bytesread == bytesWritten))
            {
                LOG_INFO("INFO : FatFs data compare SUCCES");
                LOG_INFO("\n");
            }
            else
            {
                LOG_ERROR("FatFs data compare ERROR");
                LOG_ERROR("\n");
            }
        }
    }
}