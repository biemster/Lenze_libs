#include "usbh_ioreq.h"

/**
  * @brief  USBH_CtlSendSetup
  *         Sends the Setup Packet to the Device
  * @param  phost: Host Handle
  * @param  buff: Buffer pointer from which the Data will be send to Device
  * @param  ep_idx: Endpoint Index
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_CtlSendSetup(USBH_HandleTypeDef *phost,
                                     uint8_t *buff,
                                     uint8_t ep_idx)
{

  USBH_LL_SubmitURB(phost,                      /* Driver handle    */
                    ep_idx,               /* EP index       */
                    0U,                   /* Direction : OUT  */
                    USBH_EP_CONTROL,      /* EP type          */
                    USBH_PID_SETUP,       /* Type setup    Control.*/
                    buff,                 /* data buffer      */
                    USBH_SETUP_PKT_SIZE  /* data length      */
				    );
  return USBH_OK;
}


/**
  * @brief  USBH_CtlSendData
  *         Sends a data Packet to the Device
  * @param  phost: Host Handle
  * @param  buff: Buffer pointer from which the Data will be sent to Device
  * @param  length: Length of the data to be sent
  * @param  ep_idx: Endpoint Index
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_CtlSendData(USBH_HandleTypeDef *phost,
                                    uint8_t *buff,
                                    uint16_t length,
                                    uint8_t ep_idx)
{

  USBH_LL_SubmitURB(phost,                /* Driver handle    */
                    ep_idx,               /* EP index       */
                    0U,                   /* Direction : OUT  */
                    USBH_EP_CONTROL,      /* EP type          */
                    USBH_PID_DATA,        /* Type Data        */
                    buff,                 /* data buffer      */
                    length                /* data length      */
					);

  return USBH_OK;
}


/**
  * @brief  USBH_CtlReceiveData
  *         Receives the Device Response to the Setup Packet
  * @param  phost: Host Handle
  * @param  buff: Buffer pointer in which the response needs to be copied
  * @param  length: Length of the data to be received
  * @param  ep_idx: Endpoint Index
  * @retval USBH Status.
  */
USBH_StatusTypeDef USBH_CtlReceiveData(USBH_HandleTypeDef *phost,
                                       uint8_t *buff,
                                       uint16_t length,
                                       uint8_t ep_idx)
{
  USBH_LL_SubmitURB(phost,                 /* Driver handle    */
                    ep_idx,                /* ep Index       */
                    1U,                    /* Direction : IN   */
                    USBH_EP_CONTROL,       /* EP type          */
                    USBH_PID_DATA,         /* Type Data        */
                    buff,                  /* data buffer      */
                    length                 /* data length      */
                    );
  return USBH_OK;

}


/**
  * @brief  USBH_BulkSendData
  *         Sends the Bulk Packet to the device
  * @param  phost: Host Handle
  * @param  buff: Buffer pointer from which the Data will be sent to Device
  * @param  length: Length of the data to be sent
  * @param  ep_idx: Endpoint Index
  * @retval USBH Status
  */
USBH_StatusTypeDef USBH_BulkSendData(USBH_HandleTypeDef *phost,
                                     uint8_t *buff,
                                     uint16_t length,
                                     uint8_t ep_idx
									 )
{
  USBH_LL_SubmitURB(phost,                /* Driver handle    */
                    ep_idx,          /* EP index       */
                    0U,                   /* Direction : IN   */
                    USBH_EP_BULK,         /* EP type          */
                    USBH_PID_DATA,        /* Type Data        */
                    buff,                 /* data buffer      */
                    length               /* data length      */
                    );
  return USBH_OK;
}


/**
  * @brief  USBH_BulkReceiveData
  *         Receives IN bulk packet from device
  * @param  phost: Host Handle
  * @param  buff: Buffer pointer in which the received data packet to be copied
  * @param  length: Length of the data to be received
  * @param  ep_idx: Endpoint Index
  * @retval USBH Status.
  */
USBH_StatusTypeDef USBH_BulkReceiveData(USBH_HandleTypeDef *phost,
                                        uint8_t *buff,
                                        uint16_t length,
                                        uint8_t ep_idx)
{
  USBH_LL_SubmitURB(phost,                 /* Driver handle    */
                    ep_idx,                /* EP index       */
                    1U,                    /* Direction : IN   */
                    USBH_EP_BULK,          /* EP type          */
                    USBH_PID_DATA,         /* Type Data        */
                    buff,                  /* data buffer      */
                    length                /* data length      */
                    );
  return USBH_OK;
}


/**
  * @brief  USBH_InterruptReceiveData
  *         Receives the Device Response to the Interrupt IN token
  * @param  phost: Host Handle
  * @param  buff: Buffer pointer in which the response needs to be copied
  * @param  length: Length of the data to be received
  * @param  ep_idx: Endpoint Index
  * @retval USBH Status.
  */
USBH_StatusTypeDef USBH_InterruptReceiveData(USBH_HandleTypeDef *phost,
                                             uint8_t *buff,
                                             uint8_t length,
                                             uint8_t ep_idx)
{
  USBH_LL_SubmitURB(phost,                /* Driver handle    */
                    ep_idx,               /* EP index       */
                    1U,                   /* Direction : IN   */
                    USBH_EP_INTERRUPT,    /* EP type          */
                    USBH_PID_DATA,        /* Type Data        */
                    buff,                 /* data buffer      */
                    (uint16_t)length     /* data length      */
                    );

  return USBH_OK;
}

/**
  * @brief  USBH_InterruptSendData
  *         Sends the data on Interrupt OUT Endpoint
  * @param  phost: Host Handle
  * @param  buff: Buffer pointer from where the data needs to be copied
  * @param  length: Length of the data to be sent
  * @param  ep_idx: Endpoint Index
  * @retval USBH Status.
  */
USBH_StatusTypeDef USBH_InterruptSendData(USBH_HandleTypeDef *phost,
                                          uint8_t *buff,
                                          uint8_t length,
                                          uint8_t ep_idx)
{
  USBH_LL_SubmitURB(phost,                /* Driver handle    */
                    ep_idx,               /* EP index       */
                    0U,                   /* Direction : OUT   */
                    USBH_EP_INTERRUPT,    /* EP type          */
                    USBH_PID_DATA,        /* Type Data        */
                    buff,                 /* data buffer      */
                    (uint16_t)length     /* data length      */
                    );

  return USBH_OK;
}

/**
  * @brief  USBH_IsocReceiveData
  *         Receives the Device Response to the Isochronous IN token
  * @param  phost: Host Handle
  * @param  buff: Buffer pointer in which the response needs to be copied
  * @param  length: Length of the data to be received
  * @param  ep_idx: Endpoint Index
  * @retval USBH Status.
  */
USBH_StatusTypeDef USBH_IsocReceiveData(USBH_HandleTypeDef *phost,
                                        uint8_t *buff,
                                        uint32_t length,
                                        uint8_t ep_idx)
{
  USBH_LL_SubmitURB(phost,                /* Driver handle    */
                    ep_idx,               /* EP index       */
                    1U,                   /* Direction : IN   */
                    USBH_EP_ISO,          /* EP type          */
                    USBH_PID_DATA,        /* Type Data        */
                    buff,                 /* data buffer      */
                    (uint16_t)length     /* data length      */
                    );


  return USBH_OK;
}

/**
  * @brief  USBH_IsocSendData
  *         Sends the data on Isochronous OUT Endpoint
  * @param  phost: Host Handle
  * @param  buff: Buffer pointer from where the data needs to be copied
  * @param  length: Length of the data to be sent
  * @param  ep_idx: Endpoint Index
  * @retval USBH Status.
  */
USBH_StatusTypeDef USBH_IsocSendData(USBH_HandleTypeDef *phost,
                                     uint8_t *buff,
                                     uint32_t length,
                                     uint8_t ep_idx)
{
  USBH_LL_SubmitURB(phost,                /* Driver handle    */
                    ep_idx,               /* EP index          */
                    0U,                   /* Direction : OUT   */
                    USBH_EP_ISO,          /* EP type           */
                    USBH_PID_DATA,        /* Type Data         */
                    buff,                 /* data buffer       */
                    (uint16_t)length     /* data length       */
                    );

  return USBH_OK;
}