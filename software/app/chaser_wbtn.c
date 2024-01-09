#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"
#include <unistd.h>



static void irqhandler (void * context,alt_u32 id)
{
	char data=0x01;
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,0x01);
	usleep(60000);
	
	while(data != 0x80)
	{
		data=data<<1;
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,data);
		usleep(60000);	
	}
}

int main()
{
	alt_printf("main() started\n");
	alt_irq_register(BTN_IRQ, NULL,(void*)irqhandler );
	for (;;) {}
	return 0;
}