#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include <unistd.h>

int main()
{
	char data=0x01;
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,0x01);
	usleep(60000);
	while(1)
	{
		while(data != 0x80)
		{
			data=data<<1;
			IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,data);
			usleep(60000);
			
		}
		
	}
	return 0;
}