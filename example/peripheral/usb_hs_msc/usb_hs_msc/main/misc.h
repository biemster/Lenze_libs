#ifndef __MISC_H__
#define __MISC_H__

typedef enum
{
  MSC_DEMO_START = 0,
  MSC_DEMO_FILE_OPERATIONS,
  MSC_DEMO_EXPLORER,
} MSC_Demo_State;

typedef struct _DemoStateMachine
{
  __IO MSC_Demo_State state;
  __IO uint8_t select;
} MSC_DEMO_StateMachine;

typedef enum
{
  APPLICATION_IDLE = 0,
  APPLICATION_READY,
  APPLICATION_DISCONNECT,
} MSC_ApplicationTypeDef;


void uart_init(void);
#endif