#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"
#include <unistd.h>

int time=40000;
int switches=0;
static void irqhandler_btn (void * context)
{
	alt_printf("BUTTON INTERRUPT\n");
	
	int data=0x01;
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,0x01);
	usleep(time);
	

	while(data != 0x80)
	{
		data=data<<1;
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,data);
		usleep(time);	
	}
	
	while(data != 0x01)
	{
		data=data>>1;
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,data);
		usleep(time);	
	}
}
static void irqhandler_switch (void * context)
{
	alt_printf("SWITCHES INTERRUPT\n");
	switches = IORD_ALTERA_AVALON_PIO_DATA(SWITCH_BASE);
	alt_printf("sw = %x\n",switches);
	time=switches*10000+10000;
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(SWITCH_BASE,0b00001111);
}
int main()
{
	alt_printf("main() started\n");
	
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(BTN_BASE,0b1);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(BTN_BASE,0b1);
	
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(SWITCH_BASE,0b00001111);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(SWITCH_BASE,0b00001111);
	
	alt_ic_isr_register(SWITCH_IRQ_INTERRUPT_CONTROLLER_ID,BTN_IRQ,irqhandler_btn,NULL,NULL);
	alt_printf("btn interrupt created\n");

	alt_ic_isr_register(SWITCH_IRQ_INTERRUPT_CONTROLLER_ID,SWITCH_IRQ,irqhandler_switch,NULL,NULL);
	alt_printf("switches interrupt created\n");

	
	while(1){}
	return 0;
}