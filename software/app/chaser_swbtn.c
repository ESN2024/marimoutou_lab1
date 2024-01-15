#include<stdio.h>
#include<stdint.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"
#include <unistd.h>

uint32_t time=40000;
uiint8_t switches=0;

static void irqhandler_btn (void * context)
{
	alt_printf("BUTTON INTERRUPT\n");
	
	uint8_t data=0x01;
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,0x01);
	usleep(time);
	
	//chaser leds 7 to 0
	while(data != 0x80)
	{
		data=data<<1;
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,data);
		usleep(time);	
	}
	//chaser leds 0 to 7
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
	// Read Switch Value
	switches = IORD_ALTERA_AVALON_PIO_DATA(SWITCH_BASE);
	alt_printf("sw = %x\n",switches);
	time=switches*10000+10000;
	
	// Clear Interrupt
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(SWITCH_BASE,0b00001111);
}
int main()
{
	alt_printf("main() started\n");
	// Enable IRQ end button capture
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(BTN_BASE,0b1);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(BTN_BASE,0b1);
	
	// Enable IRQ end Switches capture
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(SWITCH_BASE,0b00001111);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(SWITCH_BASE,0b00001111);
	
	// Register Buttons Interrupt
	alt_ic_isr_register(SWITCH_IRQ_INTERRUPT_CONTROLLER_ID,BTN_IRQ,irqhandler_btn,NULL,NULL);
	alt_printf("btn interrupt created\n");
	
	// Register Switches Interrupt
	alt_ic_isr_register(SWITCH_IRQ_INTERRUPT_CONTROLLER_ID,SWITCH_IRQ,irqhandler_switch,NULL,NULL);
	alt_printf("switches interrupt created\n");

	
	while(1){}
	return 0;
}