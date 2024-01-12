#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"
#include <unistd.h>



static void irqhandler (void * context)
{	
	uint8_t data=0x01;

	while(data != 0x80)
	{
		data=data<<1;
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,data);
		usleep(60000);	
	}
	
	while(data != 0x01)
	{
		data=data>>1;
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,data);
		usleep(60000);	
	}
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(BTN_BASE,0b1);
}

int main()
{
	alt_printf("main() started\n");
	
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(BTN_BASE,0b1);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(BTN_BASE,0b1);
	//alt_irq_register(BTN_IRQ, NULL,(void*)irqhandler );
	
	alt_ic_isr_register(BTN_IRQ_INTERRUPT_CONTROLLER_ID,BTN_IRQ,irqhandler,NULL,NULL);
	alt_printf("btn interrupt created");
	
	while(1){}
	return 0;
}