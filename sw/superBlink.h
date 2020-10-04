#define DELAY           200
#define ON              0x01
#define OFF             0x00
#define NUM_LEDS        0x04
#define LED0            0x0001
#define LED1            0x0002
#define LED2            0x0004
#define LED3            0x0008
#define FREQUENCY_KHZ   50000

#define MTIME_CSR       0xC00
#define MTIMECMP_CSR    0x7C0 
#define SIMPRINT        0x10001008
#define FINITO          0x10001009

#define GPIO_O0_OFFSET    0x0010 //Only use 4 lsbits - OE
#define GPIO_O1_OFFSET    0x0014 //Only use 4 lsbits - LED
#define GPIO_I0_OFFSET    0x0018 //Only use 4 lsbits
#define GPIO_I1_OFFSET    0x001C //Only use 4 lsbits

#define csr_read(reg) ({ uint32_t __tmp; \
  asm volatile ("csrr %0, " #reg : "=r"(__tmp)); \
  __tmp; })

#define csr_write(reg, val) ({ \
  asm volatile ("csrw " #reg ", %0" :: "rK"(val)); })

void enableLED_OE ();
void writeByte (int address, int data);
short readGPIO (int offset);
void setupTimer();
int  setLED    (int ledID, int state);
void delay     (int ms);
