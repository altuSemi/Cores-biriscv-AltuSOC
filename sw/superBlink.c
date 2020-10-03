#include <stdio.h>
#include "superBlink.h"
#include <math.h>


void setupTimer (int val)
{
    csr_write(0xC01, val); 
}

void delay (int ms)
{
    uint32_t count_val= ms;
    uint32_t counter=0;
    while ( counter < count_val) {
      counter=csr_read(0xC00);
    }
    setupTimer(0);
}
short led_ind (int led_sel)
{
    switch (led_sel)
    {
    case 1: return 0;
    case 2: return 1;
    case 4: return 2;
    case 8: return 3;
    }
}
int main()
{
    int error = 0;
    int ledNum = 0;
    int ledArray[NUM_LEDS] = {LED0, LED1, LED2, LED3};
    short led_before,led_after,led_xor;
    int state=ON;
    int sim;
    sim=readGPIO(GPIO_I0_OFFSET) & 0x1; //If GPIO_I lsbit is 1 we are in sim mode
    int delay_ms;
    if (sim) delay_ms=DELAY;
    else delay_ms=DELAY*FREQUENCY_KHZ;

    enableLED_OE();
    setupTimer(0);

    while(!error) {
        for (ledNum=0;ledNum<NUM_LEDS;ledNum++) {
            led_before=readGPIO(GPIO_O1_OFFSET);
            setLED(ledArray[ledNum], state);
            led_after=readGPIO(GPIO_O1_OFFSET);
            led_xor=led_before^led_after;
            writeByte((state<<4)+led_ind(led_xor),SIMPRINT);
            delay(delay_ms);
            
        }
        if (state==ON)  state=OFF;
        else {
             state =ON;
             if (sim) writeByte(0,FINITO);
        }
    }
}