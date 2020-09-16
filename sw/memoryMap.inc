.equ GPIO_ADDRESS,       0x10001000
.equ EXCSR_ADDRESS,      0x10002000
.equ DCCM_ADDRESS,       0x00004000

.equ SIMPRINT,           0x0008
.equ LED_OE_OFFSET,      0x0010 //Only use 4 lsbits
.equ LED_OUT_OFFSET,     0x0010 //Use bits 4 to 7
.equ SW_OFFSET,          0x0010 //Only use 4 lsbits
.equ GPREG_OFFSET,       0x0014 

//.equ mitcnt0_OFFSET,     0x7D2 //Internal timer counter 0
//.equ mitb0_OFFSET,       0x7D3 //Internal timer bound 0
//.equ mitctl0_OFFSET,     0x7D4 //Internal timer control 0: [2] pause, [1] halt_en, [0] enable
