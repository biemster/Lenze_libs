/*********************************************************************\
|*                                                                  *|
|*    Copyright (C) 2006--2014 by SimpLight Nanoelectronics, Ltd.   *|
|*    All rights reserved.                                          *|
|*                                                                  *|
|* This material constitutes the trade secrets and confidential,    *|
|* proprietary information of SimpLight.  This material is not to   *|
|* be disclosed, reproduced, copied, or used in any manner  not     *|
|* permitted under license from SimpLight Nanoelectronics Ltd.      *|
|*                                                                  *|
\*********************************************************************/

#include "stdio.h"
#include "uart.h"
#include "log.h"

extern int vsprintf_local(char *buf, const char *fmt, va_list args);
extern int vsnprintf_local(char *buf, size_t size, const char *fmt, va_list args);

volatile uint32_t s_rom_debug_level = LOG_LEVEL_INFO;

#define CFG_PBSIZE 0x100

void serial_puts(const char *s)
{
    while (*s) {
        hal_uart_send_byte(UART0, *s++);
    }
}

int printk(const char *fmt, ...)
{
    va_list args;
    int len;
    char printbuffer[CFG_PBSIZE];

    va_start (args, fmt);
    len = vsnprintf_local (printbuffer, CFG_PBSIZE, fmt, args);
    va_end (args);

    serial_puts(&printbuffer[0]);

    return len;
}

void dump1x16(unsigned int nAddr, unsigned int nLen)
{
    unsigned int i;
    unsigned char * ptr = (unsigned char *)nAddr;
    for(i = 0; i < nLen; i += 4)
    {
        if(!(i & 0x0f))printk("\n0x%08x:", ptr);

        printk(" %02x %02x %02x %02x", *ptr, *(ptr + 1), *(ptr + 2), *(ptr + 3));
        ptr += 4;
    }

    printk("\n");
}

void dump2x8(unsigned int nAddr, unsigned int nLen)
{
    unsigned int i;
    unsigned short * ptr = (unsigned short *)nAddr;
    for(i = 0; i < nLen; i += 4)
    {
        if(!(i & 0x0f))printk("\n0x%08x:", ptr);

        printk(" %04x %04x", *ptr, *(ptr + 1));
        ptr += 2;
    }

    printk("\n");
}

void dump4x4(unsigned int nAddr, unsigned int nLen)
{
    unsigned int i;
    unsigned int * ptr = (unsigned int *)nAddr;
    for(i = 0; i < nLen; i += 4)
    {
        if(!(i & 0x0f))printk("\n0x%08x:", ptr);

        printk(" %08x", *ptr++);
    }

    printk("\n");
}

