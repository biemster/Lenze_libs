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

#ifndef _SL_DEBUG_H_
#define _SL_DEBUG_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdarg.h>
#include <stdint.h>
#include <string.h>


int printk(const char *fmt, ...);

#define LOG_LEVEL_NONE  0 //no log output*/
#define LOG_LEVEL_ERROR 1 //only log error*/
#define LOG_LEVEL_INFO  2 //output debug info and error info*/
#define LOG_LEVEL_DEBUG 3 //output debug info and error info*/
#define LOG_LEVEL_LOG   4 //output debug info and error info*/
#define LOG_LEVEL_APP   5 //output all infomation*/

extern volatile uint32_t s_rom_debug_level;
//conditional output
#define LOG(...)                    {if(s_rom_debug_level == LOG_LEVEL_LOG) printk(__VA_ARGS__);}
#define LOG_DEBUG(...)              {if(s_rom_debug_level >= LOG_LEVEL_DEBUG) printk(__VA_ARGS__);}
#define LOG_INFO(...)               {if(s_rom_debug_level >= LOG_LEVEL_INFO) printk(__VA_ARGS__);}
#define LOG_ERROR(...)              {if(s_rom_debug_level >= LOG_LEVEL_ERROR) printk(__VA_ARGS__);}
#define LOG_APP(...)                {printk(__VA_ARGS__);}

#define TEST_START(x)  { printk("\nTest %s: START...\n", x); }
#define TEST_PASSED(x) { printk("Test %s: PASSED!\n", x);  }
#define TEST_FAILED(x) { printk("Test %s: FAILED!\n", x); }


#define MARK()          do{ printk("Passed at %s:%d: %s\n", __FILE__, __LINE__, __FUNCTION__); }while(0)

/* fails if x is false */
#define ASSERT(x)       do{ if(unlikely(!(x))) { fail((const char *)STR(x), __FILE__, __LINE__, __FUNCTION__); } }while(0)

void dump1x16(unsigned int nAddr, unsigned int nLen);
void dump2x8(unsigned int nAddr, unsigned int nLen);
void dump4x4(unsigned int nAddr, unsigned int nLen);

#ifdef __cplusplus
};
#endif

#endif

