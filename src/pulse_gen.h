#include <xc.h>

#include "pulse_gen_def.h"

// Port Definitions

#define WHEEL_M1 LATDbits.LD0
#define WHEEL_S1 LATDbits.LD1

#define WHEEL_M2 LATDbits.LD2
#define WHEEL_S2 LATDbits.LD3

#define WHEEL_M3 LATDbits.LD4
#define WHEEL_S3 LATDbits.LD5

#define WHEEL_M4 LATDbits.LD6
#define WHEEL_S4 LATDbits.LD7

#define WHEEL_M5 LATBbits.LB0
#define WHEEL_S5 LATBbits.LB1

#define WHEEL_M6 LATBbits.LB2
#define WHEEL_S6 LATBbits.LB3

#define WHEEL_M7 LATBbits.LB4
#define WHEEL_S7 LATBbits.LB5

#define WHEEL_M8 LATCbits.LC0
#define WHEEL_S8 LATCbits.LC1

// Data Direction Definitions

#define TRIS_WHEEL_M1 TRISDbits.TRISD0
#define TRIS_WHEEL_S1 TRISDbits.TRISD1

#define TRIS_WHEEL_M2 TRISDbits.TRISD2
#define TRIS_WHEEL_S2 TRISDbits.TRISD3

#define TRIS_WHEEL_M3 TRISDbits.TRISD4
#define TRIS_WHEEL_S3 TRISDbits.TRISD5

#define TRIS_WHEEL_M4 TRISDbits.TRISD6
#define TRIS_WHEEL_S4 TRISDbits.TRISD7

#define TRIS_WHEEL_M5 TRISBbits.TRISB0
#define TRIS_WHEEL_S5 TRISBbits.TRISB1

#define TRIS_WHEEL_M6 TRISBbits.TRISB2
#define TRIS_WHEEL_S6 TRISBbits.TRISB3

#define TRIS_WHEEL_M7 TRISBbits.TRISB4
#define TRIS_WHEEL_S7 TRISBbits.TRISB5

#define TRIS_WHEEL_M8 TRISCbits.TRISC0
#define TRIS_WHEEL_S8 TRISCbits.TRISC1


#define LAT_WDT_LED LATEbits.LATE1
#define LAT_CMD_LED LATEbits.LATE2

#define TRIS_WDT_LED TRISEbits.TRISE1
#define TRIS_CMD_LED TRISEbits.TRISE2

# define LAT_PULSE_P3_M1 LATAbits.LATA5;
# define LAT_PULSE_P3_M2 LATAbits.LATA4;



