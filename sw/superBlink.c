#include <stdio.h>
#include "superBlink.h"



void setupTimer (int val)
{
    csr_write(0xC01, val); 
}

void delay (int ms)
{
    setupTimer(0);
    uint32_t count_val= ms;
    uint32_t counter=0;
    while ( counter < count_val) {
      counter=csr_read(0xC00);
    }
}

int main()
{
    int error = 0;
    int ledNum = 0;
    int ledArray[NUM_LEDS] = {LED0, LED1, LED2, LED3};

    setupGPIO();

    while(!error) {
        setLED(ledArray[ledNum], ON);
        delay(DELAY);
        error = setLED(ledArray[ledNum], OFF);
        delay(DELAY);
        if(ledNum >= NUM_LEDS)
           ledNum = 0;
    }
}