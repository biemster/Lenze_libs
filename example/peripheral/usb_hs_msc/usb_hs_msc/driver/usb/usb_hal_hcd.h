#ifndef __USB_HAL_HCD_H__
#define __USB_HAL_HCD_H__

#ifdef __cplusplus
extern "C" {
#endif

#define TIMING_BUFF  200

typedef enum
{
    HAL_OK       = 0x00U,
    HAL_ERROR    = 0x01U,
    HAL_BUSY     = 0x02U,
    HAL_TIMEOUT  = 0x03U
} HAL_StatusTypeDef;

typedef enum
{
    HAL_UNLOCKED = 0x00U,
    HAL_LOCKED   = 0x01U
} HAL_LockTypeDef;


typedef enum
{
    HCD_OUT_TOKEN   = 0x1,
    HCD_IN_TOKEN    = 0x9,
    HCD_SETUP_TOKEN = 0xd
} HAL_TokenTypeDef;

typedef enum
{
    HCD_PID_DATA0 = 0,
    HCD_PID_DATA1 = 1
} HAL_PIDTypeDef;

typedef enum
{
    HCD_LOW_SPEED  = 0x2,
    HCD_FULL_SPEED = 0x3
} HAL_SpeedTypeDef;

typedef enum
{
    HCD_EP_TYPE_CTRL    = 0x00,
    HCD_EP_TYPE_ISOC    = 0x01,
    HCD_EP_TYPE_BULK    = 0x02,
    HCD_EP_TYPE_INTR    = 0x03,
} HCD_EPTypeDef;

typedef enum
{
    HAL_HCD_ACK               = 0,
    HAL_HCD_CRC_ERROR         = 1,
    HAL_HCD_BIT_STUFF_ERROR   = 2,
    HAL_HCD_DATA_TOGGLE_ERROR = 3,
    HAL_HCD_STALL             = 4,
    HAL_HCD_TIME_OUT          = 5,
    HAL_HCD_PID_CHECK_FALIED  = 6,
    HAL_HCD_PID_UNEXPECTED    = 7,
    HAL_HCD_DATA_OVERRUN      = 8,
    HAL_HCD_DATA_UNDERRUN     = 9,
    HAL_HCD_NAK               = 10,
    HAL_HCD_FRAME_OVERRUN     = 11,
    HAL_HCD_BUFFER_OVERRUN    = 12,
    HAL_HCD_BUFFER_UNDERRUN   = 13,
} HAL_HCD_StateTypeDef;


typedef enum
{
    URB_IDLE = 0,
    URB_DONE,
    URB_NOTREADY,
    URB_NYET,
    URB_ERROR,
    URB_STALL
} HAL_HCD_URBStateTypeDef;


typedef enum
{
    HAL_HCD_STATE_RESET    = 0x00,
    HAL_HCD_STATE_READY    = 0x01,
    HAL_HCD_STATE_ERROR    = 0x02,
    HAL_HCD_STATE_BUSY     = 0x03,
    HAL_HCD_STATE_TIMEOUT  = 0x04
} HCD_StateTypeDef;


typedef struct
{
    uint8_t        dev_addr;
    uint8_t        ep_num;
    uint8_t        ep_is_in;
    uint8_t        speed;
    uint8_t        ep_type;
    uint16_t       max_packet;
    uint8_t        token_type;
    uint8_t        data_pid;
    uint8_t        *xfer_buff;
    uint32_t       xfer_size;
    uint32_t       xfer_len;
    uint32_t       xfer_count;
    uint8_t        toggle_in;
    uint8_t        toggle_out;
    uint32_t       dma_addr;
    uint32_t       ErrCnt;
    HAL_HCD_URBStateTypeDef urb_state;
    HAL_HCD_StateTypeDef state;
} HAL_HCD_EP_TypedDef;

typedef struct
{
    AP_USB_HCD_GLB_TypeDef *hcd_glb_regs;
    AP_USB_HCD_MAC_TypeDef *hcd_mac_regs;
    AP_USB_DIU_TypeDef     *hcd_diu_regs;
    AP_USB_TOP_TypeDef     *usb_top_regs;
    HAL_HCD_EP_TypedDef    ep[16];
    uint8_t                dev_addr;
    uint8_t                speed;
    uint16_t               tx_fifo_sz;
    uint16_t               rx_fifo_sz;
    uint8_t                tx_thd;
    uint8_t                rx_thd;
    uint8_t                dma_enable;
    void                   *pData;
} HCD_HandleTypeDef;


#define HCD_FIFO_FLUSH(__HANDLE__)       do{hhcd->hcd_glb_regs->HCD_CTL = 1;}while(0)

uint32_t HAL_HCD_Get_Xfer_Count(HCD_HandleTypeDef *hhcd, uint8_t ep_idx);
uint32_t HAL_HCD_Get_State(HCD_HandleTypeDef *hhcd, uint8_t ep_idx);
HAL_HCD_URBStateTypeDef HAL_HCD_GetURBState(HCD_HandleTypeDef *hhcd, uint8_t ep_idx);

uint32_t HAL_HCD_Get_Device_Speed(HCD_HandleTypeDef *hhcd);
uint32_t HAL_HCD_Get_Current_Frame(HCD_HandleTypeDef *hhcd);
uint32_t HAL_HCD_Set_Device_Address(HCD_HandleTypeDef *hhcd, uint8_t addr);
uint32_t HAL_HCD_Set_EP_MAX_PKT_SZ(HCD_HandleTypeDef *hhcd, uint8_t ep_idx, uint16_t max_pkt_sz);

HAL_StatusTypeDef HAL_HCD_Reset_Device(HCD_HandleTypeDef *hhcd);
HAL_StatusTypeDef HAL_HCD_VBUS_Enable(HCD_HandleTypeDef *hhcd);
HAL_StatusTypeDef HAL_HCD_VBUS_Disable(HCD_HandleTypeDef *hhcd);
HAL_StatusTypeDef HAL_HCD_SubmitRequest(HCD_HandleTypeDef *hhcd,
                                        uint8_t ep_idx,
                                        uint8_t direction,
                                        uint8_t ep_type,
                                        uint8_t token,
                                        uint8_t *pbuff,
                                        uint16_t length
                                       );
HAL_StatusTypeDef HAL_HCD_FLUSH_FIFO(HCD_HandleTypeDef *hhcd);
HAL_StatusTypeDef USB_HCD_StartXfer(HCD_HandleTypeDef *hhcd, uint8_t ep_idx);
HAL_StatusTypeDef HAL_HCD_Init(HCD_HandleTypeDef *hhcd);

#ifdef __cplusplus
}
#endif

#endif    /*  __USB_HAL_HCD_H__ */


