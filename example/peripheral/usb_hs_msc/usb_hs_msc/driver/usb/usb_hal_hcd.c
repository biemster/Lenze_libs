#include "stdio.h"
#include "unistd.h"
#include "usb_def.h"
#include "usb_hal_hcd.h"
#include "log.h"

extern HCD_HandleTypeDef hcd_handle;
extern void HAL_HCD_Connect_Callback(HCD_HandleTypeDef *hhcd);
extern void HAL_HCD_Disconnect_Callback(HCD_HandleTypeDef *hhcd);
extern void HAL_HCD_PortEnabled_Callback(HCD_HandleTypeDef *hhcd);
extern void HAL_HCD_PortDisabled_Callback(HCD_HandleTypeDef *hhcd);
extern void HAL_HCD_SOF_Callback(HCD_HandleTypeDef *hhcd);

void usb_nak_progress(HCD_HandleTypeDef *hhcd, hcd_token_t token)
{
	uint32_t frame_remaining = 0;
	uint32_t frame_remaining_mini = 0;
	uint16_t trans_size = token.b.TRANS_SZ;
	
	//HAL_HCD_FLUSH_FIFO(hhcd);
	

	frame_remaining_mini = trans_size * 8 + 122 + ((trans_size > 512) ? 1380 : ((trans_size > 128) ? 690 : 172)) + TIMING_BUFF;
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while ((frame_remaining < frame_remaining_mini) || (frame_remaining > 11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}

	hcd_handle.hcd_mac_regs->TOKEN = token.d32;
}

ATTRIBUTE_ISR void USB_IRQHandler(void)
{
	int32_t i = 0;
	uint32_t ep_num = 0;
	hcd_port_sts_ctl_t port_sts;
	hcd_port_sts_ctl_t port_sts_clr;
	hcd_sts_t status;
	uint32_t *fifo;
	uint32_t *data;
	uint32_t temp = 0;
	int32_t recv_len = 0;
	int32_t count = 0;
	//int32_t  remain_count  = 0;
	uint8_t *temp_ptr = NULL;
	hcd_token_t token;
	HCD_HandleTypeDef *hhcd = &hcd_handle;
	hcd_int_sts_t hcd_int_sts;
	hcd_int_sts_t hcd_int_clr;
	hcd_int_en_t hcd_int_en;

	hcd_int_sts.d32 = hhcd->hcd_glb_regs->HCD_INT_STS;
	hcd_int_en.d32 = hhcd->hcd_glb_regs->HCD_INT_EN;
	hcd_int_sts.d32 = hcd_int_sts.d32 & hcd_int_en.d32;

	//hhcd->hcd_glb_regs->HCD_INT_STS = hcd_int_sts.d32;

	token.d32 = hcd_handle.hcd_mac_regs->TOKEN;
	ep_num = token.b.EP_NUM;
	//printk("token %x, int %x\n",token.d32, hcd_int_sts.d32);

	if (hcd_int_sts.b.OTG_INT_STS & hcd_int_en.b.OTG_INT_EN)
	{
		hcd_int_clr.d32 = 0;
		hcd_int_clr.b.OTG_INT_STS = 1;
		hhcd->hcd_glb_regs->HCD_INT_STS = hcd_int_clr.d32;
	}

	if (hcd_int_sts.b.PORT_INT_STS & hcd_int_en.b.PORT_INT_EN)
	{
		hcd_int_clr.d32 = 0;
		hcd_int_clr.b.PORT_INT_STS = 1;
		hhcd->hcd_glb_regs->HCD_INT_STS = hcd_int_clr.d32;

		port_sts.d32 = hhcd->hcd_mac_regs->PORTSTSCTL;
		if (port_sts.b.CONSTACHG)
		{
			if (port_sts.b.CURCS)
			{
				HAL_HCD_Connect_Callback(hhcd);
			}
			else
			{
				HAL_HCD_Disconnect_Callback(hhcd);
			}
			port_sts_clr.d32 = 0;
			port_sts_clr.b.CONSTACHG = 1;
			hhcd->hcd_mac_regs->PORTSTSCTL = port_sts_clr.d32;
		}
		if (port_sts.b.PORTENSTACHG)
		{
			port_sts_clr.d32 = 0;
			port_sts_clr.b.PORTENSTACHG = 1;
			hhcd->hcd_mac_regs->PORTSTSCTL = port_sts_clr.d32;
		}
		if (port_sts.b.PORTRSTSCHG)
		{
			if (port_sts.b.PORTENSTA == 1)
			{
				hhcd->speed = (HAL_HCD_Get_Device_Speed(hhcd) == 0) ? HCD_FULL_SPEED : HCD_LOW_SPEED;
				HAL_HCD_PortEnabled_Callback(hhcd);
			}
			else
			{
				hhcd->speed = HCD_LOW_SPEED;
				HAL_HCD_PortDisabled_Callback(hhcd);
			}
			port_sts_clr.d32 = 0;
			port_sts_clr.b.PORTRSTSCHG = 1;
			hhcd->hcd_mac_regs->PORTSTSCTL = port_sts_clr.d32;
		}

		if (port_sts.b.PORTSUSPSTACHG)
		{
			port_sts_clr.d32 = 0;
			port_sts_clr.b.PORTSUSPSTACHG = 1;
			hhcd->hcd_mac_regs->PORTSTSCTL = port_sts_clr.d32;
			//printk("port suspend status change\n");
		}

		if (port_sts.b.PORTOVCIC)
		{
			port_sts_clr.d32 = 0;
			port_sts_clr.b.PORTOVCIC = 1;
			hhcd->hcd_mac_regs->PORTSTSCTL = port_sts_clr.d32;
			//printk("port overcurrent indicator change\n");
		}
	}

	if (hcd_int_sts.b.SOF_DUE_INT_STS & hcd_int_en.b.SOF_DUE_INT_EN)
	{
		//printk("sof interrupt\n");
		hcd_int_clr.d32 = 0;
		hcd_int_clr.b.SOF_DUE_INT_STS = 1;
		hhcd->hcd_glb_regs->HCD_INT_STS = hcd_int_clr.d32;
		HAL_HCD_SOF_Callback(hhcd);
	}

	if (hcd_int_sts.b.BELOW_THD_INT_STS & hcd_int_en.b.BELOW_THD_INT_EN)
	{
		//printk("below thd\n");
		hcd_int_clr.d32 = 0;
		hcd_int_clr.b.BELOW_THD_INT_STS = 1;
		hhcd->hcd_glb_regs->HCD_INT_STS = hcd_int_clr.d32;
	}

	if (hcd_int_sts.b.ABOVE_THD_INT_STS & hcd_int_en.b.ABOVE_THD_INT_EN)
	{
		//printk("above thd\n");
		do
		{
			fifo = (uint32_t *)(OTG_HCD_RX_FIFO);
			data = (uint32_t *)(hhcd->ep[ep_num].xfer_buff + hhcd->ep[ep_num].xfer_count);
			hhcd->ep[ep_num].xfer_count += (hhcd->rx_thd << 2);
			for (i = 0; i < hhcd->rx_thd; i++)
			{
				*data++ = *fifo;
			}
			hcd_int_sts.d32 = hhcd->hcd_glb_regs->HCD_INT_STS;
		} while (hcd_int_sts.b.ABOVE_THD_INT_STS);
	}

	if (hcd_int_sts.b.STATUS_INT_STS & hcd_int_en.b.STATUS_INT_EN)
	{
		hcd_int_clr.d32 = 0;
		hcd_int_clr.b.STATUS_INT_STS = 1;
		hhcd->hcd_glb_regs->HCD_INT_STS = hcd_int_clr.d32;

		status.d32 = hhcd->hcd_glb_regs->HCD_STS;
		switch (status.b.RESP_CODE)
		{
		case HAL_HCD_ACK:
			if (token.b.TOKEN_TYPE == HCD_IN_TOKEN)
			{
				//remain
				recv_len = (status.d32 >> 4) - hhcd->ep[ep_num].xfer_count;
				//printk("recv_len =%d,count=%d\n", recv_len,hhcd->ep[ep_num].xfer_count);
				if (recv_len > 0)
				{
					fifo = (uint32_t *)(OTG_HCD_RX_FIFO);
					data = (uint32_t *)(hhcd->ep[ep_num].xfer_buff + hhcd->ep[ep_num].xfer_count);
					count = recv_len >> 2;
					for (i = 0; i < count; i++)
					{
						*data++ = *fifo;
						recv_len -= 4;
						hhcd->ep[ep_num].xfer_count += 4;
					}
					if (recv_len > 0)
					{
						temp = *fifo;
						temp_ptr = (uint8_t *)(hhcd->ep[ep_num].xfer_buff + hhcd->ep[ep_num].xfer_count);
						for (i = 0; i < recv_len; i++)
						{
							*temp_ptr++ = (temp >> (i * 8)) & 0xff;
						}
						hhcd->ep[ep_num].xfer_count += recv_len;
					}
				}
			}
			else if (token.b.TOKEN_TYPE == HCD_OUT_TOKEN)
			{
				recv_len = (status.d32 >> 4);
				hhcd->ep[ep_num].xfer_count += recv_len;
			}
			if ((hhcd->ep[ep_num].xfer_count = hhcd->ep[ep_num].xfer_len) || ((status.d32 >> 4) <= hhcd->ep[ep_num].max_packet))
			{
				hhcd->ep[ep_num].urb_state = URB_DONE;
				hhcd->ep[ep_num].ErrCnt = 0;
			}
			break;
		case HAL_HCD_CRC_ERROR:
		case HAL_HCD_BIT_STUFF_ERROR:
		case HAL_HCD_DATA_TOGGLE_ERROR:
			//printk("ERROR 1\n");
			if (hhcd->ep[ep_num].ErrCnt++ > 2)
			{
				hhcd->ep[ep_num].ErrCnt = 0;
				hhcd->ep[ep_num].urb_state = URB_ERROR;
			}
			else
			{
				hhcd->ep[ep_num].urb_state = URB_NOTREADY;
			}
			break;
		case HAL_HCD_PID_CHECK_FALIED:
		case HAL_HCD_PID_UNEXPECTED:
		case HAL_HCD_DATA_OVERRUN:
		case HAL_HCD_DATA_UNDERRUN:
		case HAL_HCD_FRAME_OVERRUN:
		case HAL_HCD_BUFFER_OVERRUN:
		case HAL_HCD_BUFFER_UNDERRUN:
			if (hhcd->ep[ep_num].ErrCnt++ > 20)
			{
				hhcd->ep[ep_num].ErrCnt = 0;
				hhcd->ep[ep_num].urb_state = URB_ERROR;
			}
			else
			{	
				//printk("%d %d %d\n", status.b.TRANS_SZ, token.b.TRANS_SZ, token.b.TOKEN_TYPE);
				HAL_HCD_FLUSH_FIFO(hhcd);
				hhcd->ep[ep_num].urb_state = URB_NOTREADY;
			}
			break;
		case HAL_HCD_NAK:
			//printk("NAK\n");
			hhcd->ep[ep_num].urb_state = URB_NOTREADY;
			usb_nak_progress(hhcd, token);
			break;
		case HAL_HCD_STALL:
			// mask printk("STALL\n");
			hhcd->ep[ep_num].urb_state = URB_STALL;
			break;
		case HAL_HCD_TIME_OUT:
			// mask printk("TIME OUT\n");
			hhcd->ep[ep_num].urb_state = URB_ERROR;
			break;
		default:
			break;
		}
	}
}

uint32_t HAL_HCD_Get_Current_Frame(HCD_HandleTypeDef *hhcd)
{
	return hhcd->hcd_mac_regs->FMNUMBER;
}

uint32_t HAL_HCD_Get_Xfer_Count(HCD_HandleTypeDef *hhcd, uint8_t ep_idx)
{
	return hhcd->ep[ep_idx].xfer_count;
}

uint32_t HAL_HCD_Get_State(HCD_HandleTypeDef *hhcd, uint8_t ep_idx)
{
	return hhcd->ep[ep_idx].state;
}

HAL_HCD_URBStateTypeDef HAL_HCD_GetURBState(HCD_HandleTypeDef *hhcd, uint8_t ep_idx)
{
	return hhcd->ep[ep_idx].urb_state;
}

uint32_t HAL_HCD_Set_Device_Address(HCD_HandleTypeDef *hhcd, uint8_t addr)
{
	hhcd->dev_addr = addr;
	return HAL_OK;
}

uint32_t HAL_HCD_Set_EP_MAX_PKT_SZ(HCD_HandleTypeDef *hhcd, uint8_t ep_idx, uint16_t max_pkt_sz)
{
	hhcd->ep[ep_idx].max_packet = max_pkt_sz;

	return HAL_OK;
}

uint32_t HAL_HCD_Get_Device_Speed(HCD_HandleTypeDef *hhcd)
{
	hcd_port_sts_ctl_t hcd_port;
	hcd_port.d32 = hhcd->hcd_mac_regs->PORTSTSCTL;

	return hcd_port.b.LOWSPDDEVATCH;
}
HAL_StatusTypeDef HAL_HCD_Reset_Device(HCD_HandleTypeDef *hhcd)
{
	hcd_port_sts_ctl_t hcd_port;
	if (hhcd == NULL)
	{
		return -HAL_ERROR;
	}
	hcd_port.d32 = 0;
	hcd_port.b.PORTRSTSTA = 1;
	hhcd->hcd_mac_regs->PORTSTSCTL = hcd_port.d32;
	return HAL_OK;
}

HAL_StatusTypeDef HAL_HCD_VBUS_Enable(HCD_HandleTypeDef *hhcd)
{
	hcd_port_sts_ctl_t hcd_port;
	hcd_port.d32 = hhcd->hcd_mac_regs->PORTSTSCTL;
	hcd_port.b.PORTPWRSTA = 1;
	hhcd->hcd_mac_regs->PORTSTSCTL = hcd_port.d32;
	return HAL_OK;
}

HAL_StatusTypeDef HAL_HCD_VBUS_Disable(HCD_HandleTypeDef *hhcd)
{
	hcd_port_sts_ctl_t hcd_port;
	hcd_port.d32 = hhcd->hcd_mac_regs->PORTSTSCTL;
	hcd_port.b.LOWSPDDEVATCH = 1;
	hhcd->hcd_mac_regs->PORTSTSCTL = hcd_port.d32;

	return HAL_OK;
}

HAL_StatusTypeDef HAL_HCD_FLUSH_FIFO(HCD_HandleTypeDef *hhcd)
{
	if(hhcd == NULL)
	{
		return HAL_ERROR;
	}
	hhcd->hcd_glb_regs->HCD_CTL = 1;

	return HAL_OK;
}

HAL_StatusTypeDef USB_HCD_StartXfer(HCD_HandleTypeDef *hhcd, uint8_t ep_idx)
{
	hcd_token_t token;
	uint32_t xfer_size = 0;
	uint32_t trans_size = 0;
	uint32_t temp = 0;
	uint32_t mask = 0;
	uint32_t *fifo = NULL;
	uint32_t *data = NULL;
	uint32_t frame_remaining = 0;
	uint32_t frame_remaining_mini = 0;


    HAL_HCD_FLUSH_FIFO(hhcd);

	/*Write Data */
	xfer_size = hhcd->ep[ep_idx].xfer_len - hhcd->ep[ep_idx].xfer_count;

	if (xfer_size > hhcd->ep[ep_idx].max_packet)
	{
		xfer_size = hhcd->ep[ep_idx].max_packet;
	}

	trans_size = xfer_size;

	if ((hhcd->ep[ep_idx].ep_is_in == 0) && (xfer_size > 0))
	{

		/*HCD OUT SZ  Specifc the current transcation size*/
		hhcd->hcd_glb_regs->HCD_OUT_SZ = xfer_size;
		data = (uint32_t *)(hhcd->ep[ep_idx].xfer_buff + hhcd->ep[ep_idx].xfer_count);
		fifo = (uint32_t *)(OTG_HCD_TX_FIFO);
		__ISB();

		//if(ep_idx != 0)
		//{
		//	printk("%d\n", xfer_size);
		//}
		while (xfer_size >= 4)
		{
			*fifo = *data++;
			xfer_size -= 4;
		}

		if (xfer_size > 0)
		{
			if (xfer_size == 1)
			{
				mask = 0xff;
			}
			else if (xfer_size == 2)
			{
				mask = 0xffff;
			}
			else
			{
				mask = 0xffffff;
			}
			temp = *data;
			*fifo = temp & mask;
		}
	}
	/*Wait Transfer Solt*/
	frame_remaining_mini = trans_size * 8 + 122 + ((trans_size > 512) ? 1380 : ((trans_size > 128) ? 690 : 172)) + TIMING_BUFF;
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while ((frame_remaining < frame_remaining_mini) || (frame_remaining > 11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}

	/* Write Token */
	token.d32 = 0;
	token.b.ADDR = hhcd->dev_addr;
	token.b.EP_NUM = ep_idx;
	token.b.TOKEN_TYPE = hhcd->ep[ep_idx].token_type;
	token.b.DATA_PID = hhcd->ep[ep_idx].data_pid;
	if (hhcd->ep[ep_idx].ep_type == HCD_EP_TYPE_ISOC)
	{
		token.b.ISO = 1;
	}
	else
	{
		token.b.ISO = 0;
	}
	token.b.SPEED = hhcd->speed;
	token.b.TRANS_SZ = trans_size;

	hhcd->hcd_mac_regs->TOKEN = token.d32;

	return HAL_OK;
}

HAL_StatusTypeDef HAL_HCD_SubmitRequest(HCD_HandleTypeDef *hhcd,
										uint8_t ep_idx,
										uint8_t direction,
										uint8_t ep_type,
										uint8_t token,
										uint8_t *pbuff,
										uint16_t length)
{
	hhcd->ep[ep_idx].ep_is_in = direction;
	hhcd->ep[ep_idx].ep_type = ep_type;
	hhcd->ep[ep_idx].ep_num = ep_idx;

	if (token == 0U)
	{
		hhcd->ep[ep_idx].data_pid = HCD_PID_DATA0; //RSVD
		hhcd->ep[ep_idx].token_type = HCD_SETUP_TOKEN;
	}
	else
	{
		hhcd->ep[ep_idx].data_pid = HCD_PID_DATA1;
		if (direction == 1)
		{
			hhcd->ep[ep_idx].token_type = HCD_IN_TOKEN;
		}
		else
		{
			hhcd->ep[ep_idx].token_type = HCD_OUT_TOKEN;
		}
	}

	/* Manage Data Toggle */
	switch (ep_type)
	{
	case HCD_EP_TYPE_CTRL:
		if ((token == 1U) && (direction == 0U)) /*send data */
		{
			if (length == 0U)
			{
				/* For Status OUT stage, Length==0, Status Out PID = 1 */
				hhcd->ep[ep_idx].toggle_out = 1U;
			}

			/* Set the Data Toggle bit as per the Flag */
			if (hhcd->ep[ep_idx].toggle_out == 0U)
			{
				/* Put the PID 0 */
				hhcd->ep[ep_idx].data_pid = HCD_PID_DATA0;
			}
			else
			{
				/* Put the PID 1 */
				hhcd->ep[ep_idx].data_pid = HCD_PID_DATA1;
			}
		}
		break;

	case HCD_EP_TYPE_BULK:
		if (direction == 0U)
		{
			/* Set the Data Toggle bit as per the Flag */
			if (hhcd->ep[ep_idx].toggle_out == 0U)
			{
				/* Put the PID 0 */
				hhcd->ep[ep_idx].data_pid = HCD_PID_DATA0;
				hhcd->ep[ep_idx].toggle_out = 1;
			}
			else
			{
				/* Put the PID 1 */
				hhcd->ep[ep_idx].data_pid = HCD_PID_DATA1;
				hhcd->ep[ep_idx].toggle_out = 0;
			}
		}
		else
		{
			if (hhcd->ep[ep_idx].toggle_in == 0U)
			{
				hhcd->ep[ep_idx].data_pid = HCD_PID_DATA0;
				hhcd->ep[ep_idx].toggle_in = 1;
			}
			else
			{
				hhcd->ep[ep_idx].data_pid = HCD_PID_DATA1;
				hhcd->ep[ep_idx].toggle_in = 0;
			}
		}

		break;
	case HCD_EP_TYPE_INTR:
		if (direction == 0U)
		{
			/* Set the Data Toggle bit as per the Flag */
			if (hhcd->ep[ep_idx].toggle_out == 0U)
			{
				/* Put the PID 0 */
				hhcd->ep[ep_idx].data_pid = HCD_PID_DATA0;
			}
			else
			{
				/* Put the PID 1 */
				hhcd->ep[ep_idx].data_pid = HCD_PID_DATA1;
			}
		}
		else
		{
			if (hhcd->ep[ep_idx].toggle_in == 0U)
			{
				hhcd->ep[ep_idx].data_pid = HCD_PID_DATA0;
			}
			else
			{
				hhcd->ep[ep_idx].data_pid = HCD_PID_DATA1;
			}
		}
		break;

	case HCD_EP_TYPE_ISOC:
		hhcd->ep[ep_idx].data_pid = HCD_PID_DATA0;
		break;

	default:
		break;
	}

	hhcd->ep[ep_idx].xfer_buff = pbuff;
	hhcd->ep[ep_idx].xfer_len = length;
	hhcd->ep[ep_idx].xfer_count = 0; //TODO
	hhcd->ep[ep_idx].urb_state = URB_IDLE;
	hhcd->ep[ep_idx].xfer_count = 0U;
	hhcd->ep[ep_idx].state = HAL_HCD_NAK; //TODO

	return USB_HCD_StartXfer(hhcd, ep_idx);
}
#if 0
int32_t HAL_HCD_Recv_Data(usb_hal_hcd_t *hhcd, uint8_t ch, uint8_t addr, uint8_t ep, uint8_t *buf, uint32_t len)
{
	int32_t ret = HAL_OK;
	if(hhcd == NULL)
	{
		return -HAL_ERROR;
	}
	
	hhcd->ep[ch].xfer_buff    = buf;
	hhcd->ep[ch].xfer_size   = len;
	hhcd->ep[ch].ep_num      = ep;
	hhcd->ep[ch].xfer_count  = 0;
	hhcd->ep[ch].xfer_len    = 0;
	hhcd->ep[ch].ep_is_in    = 1;

	ret = hal_hcd_token_set(hhcd, addr, ep, HCD_IN_TOKEN, hhcd->hc[ch].data_pid, HCD_FULL_SPEED, false, len);

	return ret; 
}
#endif

HAL_StatusTypeDef HAL_HCD_Init(HCD_HandleTypeDef *hhcd)
{
	hcd_thd_t thd;
	hcd_fifo_sz_t fifo_sz;
	hcd_ctl_t hcd_ctl;
	hcd_int_en_t hcd_int_en;

	hhcd->hcd_mac_regs = (AP_USB_HCD_MAC_TypeDef *)OTG_HCD_MAC_REG_ADDR;
	hhcd->hcd_glb_regs = (AP_USB_HCD_GLB_TypeDef *)OTG_HCD_GLB_REG_ADDR;
	hhcd->hcd_diu_regs = (AP_USB_DIU_TypeDef *)OTG_DIU_REG_ADDR;
	hhcd->usb_top_regs = (AP_USB_TOP_TypeDef *)OTG_TOP_REG_ADDR;

    printk("AHB CD %d, %x\n", hhcd->usb_top_regs->AHB_CD,&hhcd->usb_top_regs->AHB_CD);
	
    hhcd->usb_top_regs->AHB_CD = 32;

	hhcd->hcd_mac_regs->FMINTEVAL = 11999;
	hhcd->hcd_mac_regs->FMNUMBER = 0;

	hcd_int_en.b.OTG_INT_EN = 0;
	hcd_int_en.b.PORT_INT_EN = 1;
	hcd_int_en.b.SOF_DUE_INT_EN = 1;
	hcd_int_en.b.BELOW_THD_INT_EN = 1;
	hcd_int_en.b.ABOVE_THD_INT_EN = 1;
	hcd_int_en.b.STATUS_INT_EN = 1;
	hhcd->hcd_glb_regs->HCD_INT_EN = hcd_int_en.d32;

	fifo_sz.b.TX_FIFO_SZ = hhcd->tx_fifo_sz;
	fifo_sz.b.RX_FIFO_SZ = hhcd->rx_fifo_sz;

	hhcd->hcd_glb_regs->HCD_FIFO_SZ = fifo_sz.d32;

	thd.b.TX_THD = hhcd->tx_thd;
	thd.b.RX_THD = hhcd->rx_thd;

	hhcd->hcd_glb_regs->HCD_THD = thd.d32;

	hcd_ctl.b.SCALE_DOWN = 0;
	hcd_ctl.b.FLUSH_FIFO = 1;
	hhcd->hcd_glb_regs->HCD_CTL = hcd_ctl.d32;

	hhcd->ep[0].max_packet = 64;

	return HAL_OK;
}
