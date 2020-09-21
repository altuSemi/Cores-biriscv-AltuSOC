#include <stdio.h>
#include "superBlink.h"



void setupTimer (int val)
{
    csr_write(0xC01, val); 
}

void delay (int ms)
{
    setupTimer(0);
    uint32_t count_val= ms * FREQUENCY_KHZ;
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

    enableLED_OE();

    while(!error) {
        for (ledNum=0;ledNum<NUM_LEDS;ledNum++) {
            setLED(ledArray[ledNum], ON);
            delay(DELAY);
        }
        for (ledNum=0;ledNum<NUM_LEDS;ledNum++) {
            error = setLED(ledArray[ledNum], OFF);
            delay(DELAY);
        }
    }
}