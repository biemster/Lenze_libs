#include <stdio.h>
#include <stdint.h>
#include "csi_gcc.h"

int timeout_1ms = 0;

void set_timeout_1ms(int timeout)
{
	timeout_1ms = timeout;
}

void delay(uint32_t val)
{	
	int i=0;
	do{
		for(i=0;i<timeout_1ms;i++)
		{
			__NOP();
		}
	}while(val--);
}