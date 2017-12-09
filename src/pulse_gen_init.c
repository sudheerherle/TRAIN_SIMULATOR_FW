#include "pulse_gen.h"

void init_pulse_gen(void);
void init_pulse_gen_ports(void);
void init_pulse_gen_timer(void);
void init_pulse_gen_com_variables(void);



/*	PD2_LOW_TIME	PD1_HIGH_TIME		*/

unsigned int wheel_Timings[39][2] = {
                                    { 7400, 2000},  // 0
                                    { 6660, 1800},  // 1
                                    { 5920, 1600},  // 2
                                    { 5180, 1400},  // 3
                                    { 4440, 1200},  // 4
                                    { 3700, 1000},  // 5
                                    { 2960, 800},   // 6
                                    { 2220, 600},   // 7
                                    { 1480, 400},    // 8, Speed Value received for this will be 9
                                    
                                    { 740, 200 },   // 9, 10
                                    { 380, 100 },   // 10, 11
                                    { 240, 70  },
                                    { 190, 50  },
                                    { 150, 40  },
                                    { 125, 35  },
                                    { 110, 30  },
                                    { 105, 25  },
                                    { 87, 23   },
                                    { 80, 20   },
                                    { 71, 19   },
                                    { 64, 16   },
                                    { 55, 15   },
                                    { 54, 14   },
                                    { 49, 13   },
                                    { 47, 11   },
                                    { 44, 10   },
                                    { 42, 10   },
                                    { 40,  9   },
                                    { 38,  8   },
                                    { 36,  7   },
                                    { 35,  7   },
                                    { 34,  6   },
                                    { 32,  6   },
                                    { 30,  6   },
                                    { 28,  6   },
                                    { 28,  5   },
                                    { 27,  5   },
                                    { 25,  5   },
                                    { 24,  5   }};


void init_pulse_gen(void)
{
    init_pulse_gen_ports();
    init_pulse_gen_timer();
    init_pulse_gen_com_variables();


}

void init_pulse_gen_ports(void)
{
    // All pins are output
    TRIS_WHEEL_M1 = 0;
    TRIS_WHEEL_S1 = 0;
    TRIS_WHEEL_M2 = 0;
    TRIS_WHEEL_S2 = 0;
    TRIS_WHEEL_M3 = 0;
    TRIS_WHEEL_S3 = 0;
    TRIS_WHEEL_M4 = 0;
    TRIS_WHEEL_S4 = 0;
    TRIS_WHEEL_M5 = 0;
    TRIS_WHEEL_S5 = 0;
    TRIS_WHEEL_M6 = 0;
    TRIS_WHEEL_S6 = 0;
    TRIS_WHEEL_M7 = 0;
    TRIS_WHEEL_S7 = 0;
    TRIS_WHEEL_M8 = 0;
    TRIS_WHEEL_S8 = 0;

    // Set initial value to 0
    WHEEL_M1 = 0;
    WHEEL_S1 = 0;
    WHEEL_M2 = 0;
    WHEEL_S2 = 0;
    WHEEL_M3 = 0;
    WHEEL_S3 = 0;
    WHEEL_M4 = 0;
    WHEEL_S4 = 0;
    WHEEL_M5 = 0;
    WHEEL_S5 = 0;
    WHEEL_M6 = 0;
    WHEEL_S6 = 0;
    WHEEL_M7 = 0;
    WHEEL_S7 = 0;
    WHEEL_M8 = 0;
    WHEEL_S8 = 0;


    TRIS_WDT_LED = 0;
    TRIS_CMD_LED = 0;
    
    LAT_WDT_LED = 0;
    LAT_CMD_LED = 0;



}

void init_pulse_gen_timer(void)
{
    // Initialize the timer to overflow once 100uS
    // CPU Clock Freq is 48MHz. So, Ins Freq is 48MHz/4 = 12MHz
    // tcy = 83.333nS
    // Required overflow rate = 100uS
    // 100us / 83.333nS = 1200 Counts
    // Timer Prescaler = 8. So, Counts can be 1200 / 8 = 150 Counts
    // Timer reload Value  = 255 - 150 = 105

    T0CON = 0;
    T0CONbits.PSA = 0;      // Prescaler is assigned
    T0CONbits.T08BIT = 1;   // Operate in 8 bit Mode
    T0CONbits.T0CS = 0;     // Clock Src is Fcy
    T0CONbits.T0PS = 0b010; // Prescaler is 8

    INTCONbits.TMR0IE = 0;  // No Interrupts :(
    INTCONbits.TMR0IF = 0;
    TMR0 = 105;
    T0CONbits.TMR0ON = 1;   // Start Timer
}



void init_pulse_gen_com_variables(void)
{
    unsigned int i;

    pulse_generator_1.generation_active = PULSE_GEN_INACTIVE;
    pulse_generator_2.generation_active = PULSE_GEN_INACTIVE;
    pulse_generator_3.generation_active = PULSE_GEN_INACTIVE;
    pulse_generator_4.generation_active = PULSE_GEN_INACTIVE;

    pulse_generator_1.time_down_counter = 0;
    pulse_generator_2.time_down_counter = 0;
    pulse_generator_3.time_down_counter = 0;
    pulse_generator_4.time_down_counter = 0;

    com_data.phy_data_received = 0;
    com_data.valid_mii_data_received = 0;

    com_data.tx_data_available = 0;

    com_data.rx_data_read_pointer = 0;
    com_data.rx_data_write_pointer = 0;


    
    for (i=0; i<MAX_COM_DATA_BUFFER_SIZE; i++)
    {
        com_data.tx_data[i] = 0;
    }
    for (i=0; i<MAX_COM_DATA_BUFFER_SIZE; i++)
    {
        com_data.rx_data[i] = 0;
    }

    for (i=0; i<22; i++)
    {
        com_data.rx_packet_data.data[i] = 0;
    }
    for (i=0; i<22; i++)
    {
        com_data.tx_packet_data.data[i] = 0;
    }

}
