#include "stdio.h"
#include "types.h"
#include "bus_dev.h"
#include "mcu.h"
#include "usb_def.h"
#include "usb_hal_hcd.h"
#include "usb_hcd.h"
#include "descriptor.h"
#include "log.h"

HCD_HandleTypeDef hcd_handle;
static volatile  int32_t reset_flag = 0;
static volatile  int32_t ack_flag = 0;
static volatile  int32_t sof_flag = 0;

uint8_t test_buf[64]={0};

ATTRIBUTE_ISR void USB_IRQHandler(void)
{
	int32_t i=0;
	uint32_t ep_num = 0;
	hcd_port_sts_ctl_t port_sts;
	hcd_port_sts_ctl_t port_sts_clr;
	otg_ctl_sts_t  otg_ctl_sts;
	hcd_sts_t status;
	uint32_t *fifo;
	uint32_t *data;
	int32_t  recv_len = 0;
	int32_t  count = 0;
	hcd_token_t token;
	HCD_HandleTypeDef *hhcd = &hcd_handle;
	hcd_int_sts_t hcd_int_sts;
	hcd_int_en_t  hcd_int_en;
	
	hcd_int_sts.d32 = hhcd->hcd_glb_regs->HCD_INT_STS;
	hcd_int_en.d32  = hhcd->hcd_glb_regs->HCD_INT_EN;
	hcd_int_sts.d32 = hcd_int_sts.d32&hcd_int_en.d32;
	
	hhcd->hcd_glb_regs->HCD_INT_STS = hcd_int_sts.d32;

   token.d32 = hcd_handle.hcd_mac_regs->TOKEN;
   ep_num = token.b.EP_NUM;

	if(hcd_int_sts.b.OTG_INT_STS)
	{
		printk("otg int\n");
	}

	if(hcd_int_sts.b.PORT_INT_STS)
	{		
		port_sts.d32 = hhcd->hcd_mac_regs->PORTSTSCTL;
		if(port_sts.b.CONSTACHG)
		{			
			if(port_sts.b.CURCS)
			{
				if((port_sts.b.PORTENSTA == 0)&&(port_sts.b.PORTRSTSTA == 0))
				{
					hal_hcd_reset_device(&hcd_handle);
				}
				reset_flag = 0;
			}
			port_sts_clr.d32 = 0;
			port_sts_clr.b.CONSTACHG = 1;
			hhcd->hcd_mac_regs->PORTSTSCTL = port_sts_clr.d32;
		}
		if(port_sts.b.PORTENSTACHG)
		{
			port_sts_clr.d32 = 0;
			port_sts_clr.b.PORTENSTACHG = 1;
			hhcd->hcd_mac_regs->PORTSTSCTL = port_sts_clr.d32;
		}
		if(port_sts.b.PORTRSTSCHG)
		{
			port_sts_clr.d32 = 0;
			port_sts_clr.b.PORTRSTSCHG = 1;
			hhcd->hcd_mac_regs->PORTSTSCTL = port_sts_clr.d32;
			reset_flag =1;
		}
		
		if(port_sts.b.PORTSUSPSTACHG)
		{
			port_sts_clr.d32 = 0;
			port_sts_clr.b.PORTSUSPSTACHG = 1;
			hhcd->hcd_mac_regs->PORTSTSCTL = port_sts_clr.d32;
			printk("port suspend status change\n");
		}
		
		if(port_sts.b.PORTOVCIC)
		{
			port_sts_clr.d32 = 0;
			port_sts_clr.b.PORTOVCIC = 1;
			hhcd->hcd_mac_regs->PORTSTSCTL = port_sts_clr.d32;
			printk("port overcurrent indicator change\n");
		}
	}

	if(hcd_int_sts.b.SOF_DUE_INT_STS)
	{
		//printk("sof interrupt\n");
		sof_flag = 1;
	}

	if(hcd_int_sts.b.BELOW_THD_INT_STS)
	{

		printk("below thd\n");
	}

	if(hcd_int_sts.b.ABOVE_THD_INT_STS)
	{
#if 0		
		printk("above thd\n");
		fifo = (uint32_t *)(OTG_HCD_RX_FIFO + hhcd->hc[ep_num].xfer_len);
		data = (uint32_t *)(hhcd->ep_info[ep_num].xfer_buf + hhcd->ep_info[ep_num].xfer_tmpcnt);
		hhcd->ep_info[ep_num].xfer_tmpcnt += (hhcd->rx_thd <<2);
		for(i=0;i<hhcd->rx_thd;i++)
		{
			*data++ = *fifo++;
		}
#endif		
	}

	if(hcd_int_sts.b.STATUS_INT_STS)
	{
		status.d32 =  hhcd->hcd_glb_regs->HCD_STS;
		//printk("status.d32 = %x\n",status.d32);
		//printk("data  size %d\n", status.b.TRANS_SZ);
		if((status.d32&0xf) == 0)
		{
			ack_flag = 1;
		}
		if(token.b.TOKEN_TYPE == HCD_IN_TOKEN)
		{
#if 0			
			recv_len  = status.d32>>4;
			//printk("recv_len =%d\n", recv_len);
			if(recv_len != 0){
				fifo = (uint32_t *)(OTG_HCD_RX_FIFO + hhcd->ep_info[ep_num].xfer_tmpcnt);
				data = (uint32_t *)(hhcd->ep_info[ep_num].xfer_buf + hhcd->ep_info[ep_num].xfer_tmpcnt);
				count = (recv_len - hhcd->ep_info[ep_num].xfer_tmpcnt)>>2;
				hhcd->ep_info[ep_num].xfer_tmpcnt += recv_len;
				hhcd->ep_info[ep_num].xfer_length = hhcd->ep_info[ep_num].xfer_tmpcnt;
				for(i=0;i<count;i++)
				{
					*data++ = *fifo++;
					recv_len-=4;
				}
				if(recv_len>0)
				{
					*data++ = *fifo++;
				}
			}
#endif			
		}
#if 0		
		//printk("#xfer_tmpcnt %d, xfer_length %d#\n", hhcd->ep_info[ep_num].xfer_tmpcnt, hhcd->ep_info[ep_num].xfer_length);
		if(hhcd->ep_info[ep_num].xfer_tmpcnt == hhcd->ep_info[ep_num].xfer_length)
		{
			hhcd->ep_info[ep_num].xfer_tmpcnt = 0;
			hhcd->ep_info[ep_num].xfer_length = 0;
		}
#endif
	}
}
#if 0
#define TIMING_BUFF   50
uint32_t usb_hcd_get_desc(usb_hal_hcd_t *hhcd, uint8_t addr)
{

	uint8_t  get_desc[]={0x80, 0x06, 0x00, 0x01, 0x00, 0x00, 0x12, 0x00};
	uint32_t data_size=0;
	uint32_t frame_remaining=0;
	uint32_t frame_remaining_mini=0;
	uint32_t  i =0;
	data_size  = 8;
	
	hal_hcd_send_data(hhcd, 0, addr, 0, get_desc, 8);	
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172)) + TIMING_BUFF;
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining > 11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}
	ack_flag=0;
	hal_hcd_token_set(hhcd, addr, 0, HCD_SETUP_TOKEN, HCD_DATA0_PID, HCD_FULL_SPEED, false, 8);
	//printk("frame_remaining_mini %d, remaining %d\n",frame_remaining_mini,frame_remaining);
	//printk("wait ack\n");
	while(ack_flag == 0)
	{
	}
	//printk("start send in token\n");
	data_size = 18;
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172)) + TIMING_BUFF;
	//printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining >11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}

	hhcd->ep_info[0].xfer_buf = test_buf;
	hhcd->ep_info[0].xfer_length = 18;
	hhcd->ep_info[0].xfer_tmpcnt = 0;
	ack_flag=0;
	hal_hcd_token_set(hhcd, addr, 0, HCD_IN_TOKEN, HCD_DATA1_PID, HCD_FULL_SPEED, false, 18);

	//printk("wait ack\n");
	while(ack_flag ==0)
	{
	}

	//printk("start send out token\n");
	data_size = 0;
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172)) + TIMING_BUFF;
	//printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining >11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}
	ack_flag=0;
	hal_hcd_token_set(hhcd, addr, 0, HCD_OUT_TOKEN, HCD_DATA1_PID, HCD_FULL_SPEED, false, 0);
	//printk("wait ack\n");
	while(ack_flag ==0)
	{
	}

    printk("get desc end\n");
	for(i=0;i<18;i++)
	{
		printk(" %x ", test_buf[i]);
	}
	return 0;
}

uint32_t usb_hcd_set_addr(usb_hal_hcd_t *hhcd)
{
	uint32_t data_size=0;
	uint32_t frame_remaining=0;
	uint32_t frame_remaining_mini=0;

	uint8_t  set_address[]={0x00, 0x05, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00};

	ack_flag = 0;
	hal_hcd_send_data(hhcd, 0, 0, set_address, 8);
	data_size  = 8;
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172));
	printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining > 11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}
	hal_hcd_token_set(hhcd, 0, 0, HCD_SETUP_TOKEN, HCD_DATA0_PID, HCD_FULL_SPEED, false, 8);
	printk("wait ack\n");
	while(ack_flag ==0)
	{
	}

	ack_flag = 0;
	hhcd->ep_info[0].xfer_buf = NULL;
	hhcd->ep_info[0].xfer_length = 0;
	hhcd->ep_info[0].xfer_tmpcnt = 0;
	data_size  = 0;
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172));
	printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining > 11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}

	hal_hcd_token_set(hhcd, 0, 0, HCD_IN_TOKEN, HCD_DATA1_PID, HCD_FULL_SPEED, false, 0);
	while(ack_flag ==0)
	{
	}

	return 0;
}

uint32_t usb_hcd_set_configuration(usb_hal_hcd_t *hhcd, uint8_t addr)
{
	uint32_t data_size=0;
	uint32_t frame_remaining=0;
	uint32_t frame_remaining_mini=0;

	uint8_t  set_configuration[]={0x00, 0x09, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00};

	ack_flag = 0;
	hal_hcd_send_data(hhcd, addr, 0, set_configuration, 8);
	data_size  = 8;
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172));
	printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining > 11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}
	hal_hcd_token_set(hhcd, addr, 0, HCD_SETUP_TOKEN, HCD_DATA0_PID, HCD_FULL_SPEED, false, 8);
	printk("wait ack\n");
	while(ack_flag ==0)
	{
	}

	ack_flag = 0;
	hhcd->ep_info[0].xfer_buf = NULL;
	hhcd->ep_info[0].xfer_length = 0;
	hhcd->ep_info[0].xfer_tmpcnt = 0;
	data_size  = 0;
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172));
	printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining > 11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}

	ack_flag = 0;
	hal_hcd_token_set(hhcd, addr, 0, HCD_IN_TOKEN, HCD_DATA1_PID, HCD_FULL_SPEED, false, 0);
	while(ack_flag ==0)
	{
	
	}

	return 0;
}

uint32_t usb_hcd_get_line_code(usb_hal_hcd_t *hhcd, uint8_t addr)
{

	uint8_t  get_desc[]={0xA1, 0x21, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00};
	uint32_t data_size=0;
	uint32_t frame_remaining=0;
	uint32_t frame_remaining_mini=0;


	data_size  = 8;
	
	hal_hcd_send_data(hhcd, addr, 0, get_desc, 8);
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172)) + TIMING_BUFF;
	printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining > 11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}
	hal_hcd_token_set(hhcd, addr, 0, HCD_SETUP_TOKEN, HCD_DATA0_PID, HCD_FULL_SPEED, false, 8);
	printk("wait ack\n");
	while(ack_flag ==0)
	{
	}
	ack_flag=0;
	printk("start send in token\n");
	data_size = 18;
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172)) + TIMING_BUFF;
	printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining >11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}

	hhcd->ep_info[0].xfer_buf = test_buf;
	hhcd->ep_info[0].xfer_length = 64;
	hhcd->ep_info[0].xfer_tmpcnt = 0;
	hal_hcd_token_set(hhcd, addr, 0, HCD_IN_TOKEN, HCD_DATA1_PID, HCD_FULL_SPEED, false, 7);

	printk("wait ack\n");
	while(ack_flag ==0)
	{
	}
	ack_flag = 0;	

	printk("start send out token\n");
	data_size = 0;
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172)) + TIMING_BUFF;
	printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining >11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}
	ack_flag = 0;	
	hal_hcd_token_set(hhcd, addr, 0, HCD_OUT_TOKEN, HCD_DATA1_PID, HCD_FULL_SPEED, false, 0);
	printk("wait ack\n");
	while(ack_flag ==0)
	{
	}

	return 0;
}



uint32_t usb_hcd_set_line_status(usb_hal_hcd_t *hhcd, uint8_t addr)
{
	//otg_hcd_token_t token;
	uint32_t data_size=0;
	uint32_t frame_remaining=0;
	uint32_t frame_remaining_mini=0;
	//int32_t ret = HAL_OK;

	uint8_t  set_control_line_status[]={0x21, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

	hal_hcd_send_data(hhcd, addr, 0, set_control_line_status, 8);
	data_size  = 8;
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172));
	printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining > 11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}
	ack_flag = 0;
	hal_hcd_token_set(hhcd, addr, 0, HCD_SETUP_TOKEN, HCD_DATA0_PID, HCD_FULL_SPEED, false, 8);
	while(ack_flag ==0)
	{
	}

	hhcd->ep_info[0].xfer_buf = NULL;
	hhcd->ep_info[0].xfer_length = 0;
	hhcd->ep_info[0].xfer_tmpcnt = 0;
	data_size  = 0;
	frame_remaining_mini = data_size*8 + 122 + ((data_size>512)?1380:((data_size>128)?690:172));
	printk("frame_remaining_mini %d\n",frame_remaining_mini);
	frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	while((frame_remaining < frame_remaining_mini)||(frame_remaining > 11800))
	{
		frame_remaining = hhcd->hcd_mac_regs->FMREMAINING;
	}

	ack_flag = 0;
	hal_hcd_token_set(hhcd, addr, 0, HCD_IN_TOKEN, HCD_DATA1_PID, HCD_FULL_SPEED, false, 0);
	while(ack_flag ==0)
	{
	}

	return 0;
}

uint32_t usb_host_init(void)
{
	uint8_t addr = 2;
	hcd_port_sts_ctl_t port_sts;
	hcd_port_sts_ctl_t port_sts_clr;
	
	NVIC_SetPriority(USB_IRQn, IRQ_PRIO_HAL);
	NVIC_EnableIRQ(USB_IRQn);


	ack_flag = 0;
	hcd_handle.rx_fifo_sz = 16;
	hcd_handle.tx_fifo_sz = 16;
	hcd_handle.pid = HCD_DATA0_PID;
	hcd_handle.rx_thd =8;
	hcd_handle.tx_thd =8;
	hcd_handle.ep_info[0].ep_num = 0;
	hcd_handle.ep_info[0].max_packet = 64;
	hcd_handle.ep_info[0].type  = USB_EP_ATTR_CONTROL;
	hal_hcd_init(&hcd_handle);
	/*Reset Device  */

    while(reset_flag == 0)
	{
	}
	
	usb_hcd_get_desc(&hcd_handle,0);

	printk("set address\n");
	usb_hcd_set_addr(&hcd_handle);
	printk("get desc\n");
	usb_hcd_get_desc(&hcd_handle,addr);
    printk("set configuration\n");
	usb_hcd_set_configuration(&hcd_handle,addr);

	printk("get line code\n");
	usb_hcd_get_line_code(&hcd_handle,addr);

	printk("set line status\n");
	usb_hcd_set_line_status(&hcd_handle, addr);

	delay(200);

	return 0;
}
#endif