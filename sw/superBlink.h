#define DELAY           2000
#define ON              0x01
#define OFF             0x00
#define NUM_LEDS        0x04
#define LED0            0x0010
#define LED1            0x0020
#define LED2            0x0040
#define LED3            0x0080
#define FREQUENCY_KHZ   100

#define MTIME_CSR       0xC00
#define MTIMECMP_CSR    0x7C0 


#define csr_read(reg) ({ uint32_t __tmp; \
  asm volatile ("csrr %0, " #reg : "=r"(__tmp)); \
  __tmp; })

#define csr_write(reg, val) ({ \
  asm volatile ("csrw " #reg ", %0" :: "rK"(val)); })

void setupGPIO ();
void setupTimer();
int  setLED    (int ledID, int state);
void delay     (int ms);
