#include "pulse_gen.h"


struct def_pulse_generator pulse_generator_1;
struct def_pulse_generator pulse_generator_2;
struct def_pulse_generator pulse_generator_3;
struct def_pulse_generator pulse_generator_4;
struct def_com_timers com_timers;

void phy_generate_pulse4(void);
void phy_generate_pulse3(void);
void phy_generate_pulse2(void);
void phy_generate_pulse1(void);

void pulse_gen_set4(void);
void pulse_gen_set3(void);
void pulse_gen_set2(void);
void pulse_gen_set1(void);

void pulse_gen(void);
void pulse_gen_tasks(void);


void pulse_gen_tasks(void)
{
    if (INTCONbits.TMR0IF == 1) // 100uS Over
    {
        INTCONbits.TMR0IF = 0;
        T0CONbits.TMR0ON = 0;   // Stop Timer
        TMR0 = 105;
        T0CONbits.TMR0ON = 1;   // Start Timer
        pulse_gen();
        com_timers.us_100 = 1;
    }
    pulse_gen_com_task();


    if(com_timers.us_100 == 1)
    {
        com_timers.us_100 = 0;
        com_timers.wdt = com_timers.wdt + 1;
        if (com_timers.wdt >= 1000)   // 100mS is over
        {
            com_timers.wdt = 0;
            CLRWDT();
//            LAT_WDT_LED = ~LAT_WDT_LED;
        }


        if(com_timers.cmd >= 1000)
        {
            LAT_CMD_LED = 0;
        }
        else
        {
            com_timers.cmd = com_timers.cmd + 1;
            LAT_CMD_LED = 1;
        }
    }
}


void pulse_gen(void)
{
    if(pulse_generator_1.generation_active == PULSE_GEN_ACTIVE)
    {
        LATAbits.LA0 = 1;
        LATAbits.LA1 = 1;
        if (pulse_generator_1.time_down_counter > 0)
        {
            pulse_generator_1.time_down_counter = pulse_generator_1.time_down_counter - 1;  // Decrement every 100uS
        }
        if(pulse_generator_1.time_down_counter == 0)
        {
            if(pulse_generator_1.cycle_counter == 0)
            {
                pulse_generator_1.generation_active = PULSE_GEN_INACTIVE;
            }
            else
            {
                pulse_gen_set1();
            }
        }
    }
    else
    {
        LATAbits.LA0 = 0;
        LATAbits.LA1 = 0;
        if(com_data.rx_packet_data.auto_manual != MANUAL)
        {
            WHEEL_M1 = 0;
            WHEEL_S1 = 0;
            WHEEL_M2 = 0;
            WHEEL_S2 = 0;
        }
    }



    if(pulse_generator_2.generation_active == PULSE_GEN_ACTIVE)
    {
        LATAbits.LA2 = 1;
        LATAbits.LA3 = 1;
        if (pulse_generator_2.time_down_counter > 0)
        {
            pulse_generator_2.time_down_counter = pulse_generator_2.time_down_counter - 1;  // Decrement every 100uS
        }
        if(pulse_generator_2.time_down_counter == 0)
        {
            if(pulse_generator_2.cycle_counter == 0)
            {
                pulse_generator_2.generation_active = PULSE_GEN_INACTIVE;
            }
            else
            {
                pulse_gen_set2();
            }
        }
    }
    else
    {
        LATAbits.LA2 = 0;
        LATAbits.LA3 = 0;
        if(com_data.rx_packet_data.auto_manual != MANUAL)
        {
            WHEEL_M3 = 0;
            WHEEL_S3 = 0;
            WHEEL_M4 = 0;
            WHEEL_S4 = 0;
        }
    }


    if(pulse_generator_3.generation_active == PULSE_GEN_ACTIVE)
    {
        LATAbits.LA5 = 1;
        LATAbits.LA4 = 1;
        if (pulse_generator_3.time_down_counter > 0)
        {
            pulse_generator_3.time_down_counter = pulse_generator_3.time_down_counter - 1;  // Decrement every 100uS
        }
        if(pulse_generator_3.time_down_counter == 0)
        {
            if(pulse_generator_3.cycle_counter == 0)
            {
                pulse_generator_3.generation_active = PULSE_GEN_INACTIVE;
            }
            else
            {
                pulse_gen_set3();
            }
        }
    }
    else
    {
        LATAbits.LA4 = 0;
        LATAbits.LA5 = 0;
        WHEEL_M5 = 0;
        WHEEL_S5 = 0;
        WHEEL_M6 = 0;
        WHEEL_S6 = 0;
    }


    if(pulse_generator_4.generation_active == PULSE_GEN_ACTIVE)
    {
        LATEbits.LE0 = 1;
        LATEbits.LE1 = 1;
        if (pulse_generator_4.time_down_counter > 0)
        {
            pulse_generator_4.time_down_counter = pulse_generator_4.time_down_counter - 1;  // Decrement every 100uS
        }
        if(pulse_generator_4.time_down_counter == 0)
        {
            if(pulse_generator_4.cycle_counter == 0)
            {
                pulse_generator_4.generation_active = PULSE_GEN_INACTIVE;
            }
            else
            {
                pulse_gen_set4();
            }
        }
    }
    else
    {
        LATEbits.LE0 = 0;
        LATEbits.LE1 = 0;
        WHEEL_M7 = 0;
        WHEEL_S7 = 0;
        WHEEL_M8 = 0;
        WHEEL_S8 = 0;        
    }
}

void pulse_gen_set1(void)
{
    phy_generate_pulse1();
    
    switch(pulse_generator_1.next_state)    // Updating the States here for further operation
    {
        case PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED:
            pulse_generator_1.time_down_counter = pulse_generator_1.time_set_value.m2_low_time;
            pulse_generator_1.next_state = PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED:
            pulse_generator_1.time_down_counter = pulse_generator_1.time_set_value.m1_high_time;
            pulse_generator_1.next_state = PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED:
            pulse_generator_1.time_down_counter = pulse_generator_1.time_set_value.m2_high_time;
            pulse_generator_1.next_state = PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED:
            pulse_generator_1.time_down_counter = pulse_generator_1.time_set_value.m1_low_time;
            pulse_generator_1.next_state = PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED;

            if(pulse_generator_1.cycle_counter > 0)
            {
                pulse_generator_1.cycle_counter = pulse_generator_1.cycle_counter - 1;
            }

            break;
        default:
            pulse_generator_1.cycle_counter = 0;
            pulse_generator_1.generation_active = PULSE_GEN_INACTIVE;
            break;
    }

}


void pulse_gen_set2(void)
{
    phy_generate_pulse2();
    switch(pulse_generator_2.next_state)    // Updating the States here for further operation
    {
        case PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED:
            pulse_generator_2.time_down_counter = pulse_generator_2.time_set_value.m2_low_time;
            pulse_generator_2.next_state = PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED:
            pulse_generator_2.time_down_counter = pulse_generator_2.time_set_value.m1_high_time;
            pulse_generator_2.next_state = PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED:
            pulse_generator_2.time_down_counter = pulse_generator_2.time_set_value.m2_high_time;
            pulse_generator_2.next_state = PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED:
            pulse_generator_2.time_down_counter = pulse_generator_2.time_set_value.m1_low_time;
            pulse_generator_2.next_state = PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED;

            if(pulse_generator_2.cycle_counter > 0)
            {
                pulse_generator_2.cycle_counter = pulse_generator_2.cycle_counter - 1;
            }

            break;
        default:
            pulse_generator_2.cycle_counter = 0;
            pulse_generator_2.generation_active = PULSE_GEN_INACTIVE;
            break;
    }

}

void pulse_gen_set3(void)
{
    phy_generate_pulse3();
    switch(pulse_generator_3.next_state)    // Updating the States here for further operation
    {
        case PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED:
            pulse_generator_3.time_down_counter = pulse_generator_3.time_set_value.m2_low_time;
            pulse_generator_3.next_state = PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED:
            pulse_generator_3.time_down_counter = pulse_generator_3.time_set_value.m1_high_time;
            pulse_generator_3.next_state = PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED:
            pulse_generator_3.time_down_counter = pulse_generator_3.time_set_value.m2_high_time;
            pulse_generator_3.next_state = PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED:
            pulse_generator_3.time_down_counter = pulse_generator_3.time_set_value.m1_low_time;
            pulse_generator_3.next_state = PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED;

            if(pulse_generator_3.cycle_counter > 0)
            {
                pulse_generator_3.cycle_counter = pulse_generator_3.cycle_counter - 1;
            }

            break;
        default:
            pulse_generator_3.cycle_counter = 0;
            pulse_generator_3.generation_active = PULSE_GEN_INACTIVE;
            break;
    }

}

void pulse_gen_set4(void)
{
    phy_generate_pulse4();
    switch(pulse_generator_4.next_state)    // Updating the States here for further operation
    {
        case PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED:
            pulse_generator_4.time_down_counter = pulse_generator_4.time_set_value.m2_low_time;
            pulse_generator_4.next_state = PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED:
            pulse_generator_4.time_down_counter = pulse_generator_4.time_set_value.m1_high_time;
            pulse_generator_4.next_state = PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED:
            pulse_generator_4.time_down_counter = pulse_generator_4.time_set_value.m2_high_time;
            pulse_generator_4.next_state = PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED;
            break;
        case PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED:
            pulse_generator_4.time_down_counter = pulse_generator_4.time_set_value.m1_low_time;
            pulse_generator_4.next_state = PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED;
            if(pulse_generator_4.cycle_counter > 0)
            {
                pulse_generator_4.cycle_counter = pulse_generator_4.cycle_counter - 1;
            }
            break;
        default:
            pulse_generator_4.cycle_counter = 0;
            pulse_generator_4.generation_active = PULSE_GEN_INACTIVE;
            break;
    }

}

















// Pulse Bits Modification routenes
//
//           ------------> FORWARD
//           _________       _________
//M1         |       |       |       |
//   ________|       |_______|       |________
//           1   2   3   4   1   2   3   4
//               _________       _________
//M2             |       |       |       |
//   ____________|       |_______|       |________
//

//
//           ------------> Reverse
//           _________       _________
//M2         |       |       |       |
//   ________|       |_______|       |________
//           1   2   3   4   1   2   3   4
//               _________       _________
//M1             |       |       |       |
//   ____________|       |_______|       |________
//

void phy_generate_pulse1(void)
{
    switch(pulse_generator_1.next_state)    // Updating the States here for further operation
    {
        case PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED:
            if(pulse_generator_1.direction == PULSE_GEN_FWD)
            {
                WHEEL_M1 = 1;
                WHEEL_S1 = 1;
            }
            else
            {
                WHEEL_M2 = 1;
                WHEEL_S2 = 1;
            }
            break;
        case PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED:
            if(pulse_generator_1.direction == PULSE_GEN_FWD)
            {
                WHEEL_M2 = 1;
                WHEEL_S2 = 1;
            }
            else
            {
                WHEEL_M1 = 1;
                WHEEL_S1 = 1;
            }
            break;
        case PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED:
            if(pulse_generator_1.direction == PULSE_GEN_FWD)
            {
                WHEEL_M1 = 0;
                WHEEL_S1 = 0;
            }
            else
            {
                WHEEL_M2 = 0;
                WHEEL_S2 = 0;
            }
            break;
        case PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED:
            if(pulse_generator_1.direction == PULSE_GEN_FWD)
            {
                WHEEL_M2 = 0;
                WHEEL_S2 = 0;
            }
            else
            {
                WHEEL_M1 = 0;
                WHEEL_S1 = 0;
            }
            break;
        default:
            break;
    }
}

void phy_generate_pulse2(void)
{
    switch(pulse_generator_2.next_state)    // Updating the States here for further operation
    {
        case PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED:
            if(pulse_generator_2.direction == PULSE_GEN_FWD)
            {
                WHEEL_M3 = 1;
                WHEEL_S3 = 1;
            }
            else
            {
                WHEEL_M4 = 1;
                WHEEL_S4 = 1;
            }
            break;
        case PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED:
            if(pulse_generator_2.direction == PULSE_GEN_FWD)
            {
                WHEEL_M4 = 1;
                WHEEL_S4 = 1;
            }
            else
            {
                WHEEL_M3 = 1;
                WHEEL_S3 = 1;
            }
            break;
        case PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED:
            if(pulse_generator_2.direction == PULSE_GEN_FWD)
            {
                WHEEL_M3 = 0;
                WHEEL_S3 = 0;
            }
            else
            {
                WHEEL_M4 = 0;
                WHEEL_S4 = 0;
            }
            break;
        case PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED:
            if(pulse_generator_2.direction == PULSE_GEN_FWD)
            {
                WHEEL_M4 = 0;
                WHEEL_S4 = 0;
            }
            else
            {
                WHEEL_M3 = 0;
                WHEEL_S3 = 0;
            }
            break;
        default:
            break;
    }
}

void phy_generate_pulse3(void)
{        
    switch(pulse_generator_3.next_state)    // Updating the States here for further operation
    {
        case PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED:
            if(pulse_generator_3.direction == PULSE_GEN_FWD)
            {
                WHEEL_M5 = 1;
                WHEEL_S5 = 1;
            }
            else
            {
                WHEEL_M6 = 1;
                WHEEL_S6 = 1;
            }
            break;
        case PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED:
            if(pulse_generator_3.direction == PULSE_GEN_FWD)
            {
                WHEEL_M6 = 1;
                WHEEL_S6 = 1;
            }
            else
            {
                WHEEL_M5 = 1;
                WHEEL_S5 = 1;
            }
            break;
        case PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED:
            if(pulse_generator_3.direction == PULSE_GEN_FWD)
            {
                WHEEL_M5 = 0;
                WHEEL_S5 = 0;
            }
            else
            {
                WHEEL_M6 = 0;
                WHEEL_S6 = 0;
            }
            break;
        case PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED:
            if(pulse_generator_3.direction == PULSE_GEN_FWD)
            {
                WHEEL_M6 = 0;
                WHEEL_S6 = 0;
            }
            else
            {
                WHEEL_M5 = 0;
                WHEEL_S5 = 0;
            }
            break;
        default:            
            break;           
    }
}

void phy_generate_pulse4(void)
{
    switch(pulse_generator_4.next_state)    // Updating the States here for further operation
    {
        case PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED:
            if(pulse_generator_4.direction == PULSE_GEN_FWD)
            {
                WHEEL_M7 = 1;
                WHEEL_S7 = 1;
            }
            else
            {
                WHEEL_M8 = 1;
                WHEEL_S8 = 1;
            }
            break;
        case PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED:
            if(pulse_generator_4.direction == PULSE_GEN_FWD)
            {
                WHEEL_M8 = 1;
                WHEEL_S8 = 1;
            }
            else
            {
                WHEEL_M7 = 1;
                WHEEL_S7 = 1;
            }
            break;
        case PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED:
            if(pulse_generator_4.direction == PULSE_GEN_FWD)
            {
                WHEEL_M7 = 0;
                WHEEL_S7 = 0;
            }
            else
            {
                WHEEL_M8 = 0;
                WHEEL_S8 = 0;
            }
            break;
        case PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED:
            if(pulse_generator_4.direction == PULSE_GEN_FWD)
            {
                WHEEL_M8 = 0;
                WHEEL_S8 = 0;
            }
            else
            {
                WHEEL_M7 = 0;
                WHEEL_S7 = 0;
            }
            break;
        default:
            break;
    }
}