#include "pulse_gen.h"

struct def_com_data com_data;

void pulse_gen_com_task(void);
void mii_validate_received_data(void);
unsigned int mii_get_data_offset_index(unsigned int ReadPointer, unsigned int Position);
void process_com_request(void);
void initiate_pulse_generation(void);
void initiate_pulse_generation_1(void);
void initiate_pulse_generation_2(void);
void initiate_pulse_generation_3(void);
void initiate_pulse_generation_4(void);
void initiate_com_data_transmission(void);



void pulse_gen_com_task(void)
{
    if (com_data.phy_data_received == 1)
    {
        com_data.phy_data_received = 0;
        mii_validate_received_data();
    }
    if (com_data.valid_mii_data_received == 1)
    {
        com_data.valid_mii_data_received = 0;
        process_com_request();
        com_timers.cmd = 0;         // Blink CMD LED
    }
}

void mii_validate_received_data(void)
{
    unsigned int i, j;
    unsigned int temp;
    for (i=0; i<MAX_COM_DATA_BUFFER_SIZE; i++)
    {
        if(com_data.rx_data[i] == COM_DATA_SOF)
        {
            temp = mii_get_data_offset_index(i, 21);    // Get the EOF Location
            if (com_data.rx_data[temp] == COM_DATA_EOF) // Complete Data is available
            {
                for (j=0; j<22; j++)    // Length of Packet is 22 Bytes
                {
                    com_data.rx_packet_data.data[j] = com_data.rx_data[mii_get_data_offset_index(i, j)];
                }
                com_data.valid_mii_data_received = 1;

                com_data.rx_data[i] = 0;    // Invalidate Packet
                com_data.rx_data[temp] = 0;
            }
        }
    }
}

unsigned int mii_get_data_offset_index(unsigned int ReadPointer, unsigned int Position)
{
    unsigned int ReturnValue;
    unsigned int TempPosition;

    TempPosition = ReadPointer + Position;

    if(TempPosition >= MAX_COM_DATA_BUFFER_SIZE)
    {
        ReturnValue = TempPosition - MAX_COM_DATA_BUFFER_SIZE;
    }
    else
    {
        ReturnValue = TempPosition;
    }
    return(ReturnValue);
}



void process_com_request(void)
{
    com_data.tx_packet_data.configuration = 0;
    com_data.tx_packet_data.speed = 0;
    com_data.tx_packet_data.count = 0;
    com_data.tx_packet_data.fwd_rev = 0;

    if (com_data.rx_packet_data.length == 12)
    {
        switch(com_data.rx_packet_data.command)
        {
            case COM_PING_FROM_PC:
                com_data.tx_packet_data.command = COM_PING_RESPONSE_ACK_FROM_TGT;
                break;
            case COM_COMMAND_CONFIG_DATA:
                initiate_pulse_generation();
                break;
            default:
                com_data.tx_packet_data.command = COM_COMMAND_ERROR;
                break;
        }
    }
    else
    {
        com_data.tx_packet_data.command = COM_COMMAND_ERROR;
    }

    initiate_com_data_transmission();
}




void initiate_pulse_generation(void)
{
    union
    {
        unsigned char byte_data[4];
        unsigned long long_data;
    }long_byte_data;


    com_data.tx_packet_data.command = COM_COMMAND_ACK;
    if(com_data.rx_packet_data.auto_manual == AUTO)
    {
        if(!(com_data.rx_packet_data.fwd_rev == PULSE_GEN_FWD || com_data.rx_packet_data.fwd_rev == PULSE_GEN_REV))
        {
            com_data.tx_packet_data.command = COM_COMMAND_ERROR;
            com_data.tx_packet_data.fwd_rev = 1;
        }


        if(com_data.rx_packet_data.speed >= 301 || com_data.rx_packet_data.speed == 0)
        {
            com_data.tx_packet_data.command = COM_COMMAND_ERROR;
            com_data.tx_packet_data.speed = 1;
        }
        else
        {
            if(com_data.rx_packet_data.speed <= 10) // Array index from 0 to 9, for user speed 1 to 10
            {
                com_data.rx_packet_data.speed = com_data.rx_packet_data.speed - 1;
            }
            
            // if user gives speed between 11 and 300, then (Speed/10) + 8 is the array index
            // user speed from 11 to 19, the index is 9
            // from 20 to 29, the index is 10
            // from 290 to 299, te index is 37
            // for 300, the index is 38.
            
            else
            {
                com_data.rx_packet_data.speed = (unsigned long) com_data.rx_packet_data.speed / 10;
                com_data.rx_packet_data.speed = com_data.rx_packet_data.speed + 8;

                if(com_data.rx_packet_data.speed >= 39) // if the array index is more than the array size, declare error
                {
                    com_data.tx_packet_data.command = COM_COMMAND_ERROR;
                    com_data.tx_packet_data.speed = 1;
                }
            }
        }


        if(com_data.rx_packet_data.count >= 65535 || com_data.rx_packet_data.count == 0)
        {
            com_data.tx_packet_data.command = COM_COMMAND_ERROR;
            com_data.tx_packet_data.count = 1;
        }
    }
    else if(com_data.rx_packet_data.auto_manual == MANUAL)
    {
        long_byte_data.long_data = com_data.rx_packet_data.speed;
        if(long_byte_data.byte_data[0] >= 2)
        {
            com_data.tx_packet_data.command = COM_COMMAND_ERROR;
            long_byte_data.byte_data[0] = 1;
        }
        if(long_byte_data.byte_data[1] >= 2)
        {
            com_data.tx_packet_data.command = COM_COMMAND_ERROR;
            long_byte_data.byte_data[1] = 1;
        }
        if(com_data.tx_packet_data.command == COM_COMMAND_ERROR)
        {
            /* In case of error, set the speed bytes to report back to PC */
            long_byte_data.byte_data[2] = 0;
            long_byte_data.byte_data[3] = 0;
            com_data.tx_packet_data.speed = long_byte_data.long_data;
        }
    }
    else
    {
        com_data.tx_packet_data.command = COM_COMMAND_ERROR;
        com_data.tx_packet_data.auto_manual = 1;
    }



    
    
    if (com_data.tx_packet_data.command == COM_COMMAND_ACK)
    {
        if(com_data.rx_packet_data.auto_manual == AUTO)
        {
            if(com_data.rx_packet_data.start_stop == START)
            {
                switch(com_data.rx_packet_data.configuration)
                {
                    case 1:
                        initiate_pulse_generation_1();
                        break;
                    case 2:
                        initiate_pulse_generation_2();
                        break;
                    case 3:
                        initiate_pulse_generation_3();
                        break;
                    case 4:
                        initiate_pulse_generation_4();
                        break;
                    default:
                        com_data.tx_packet_data.command = COM_COMMAND_ERROR;
                        com_data.tx_packet_data.configuration = 1;
                        break;
                }
            }
            else
            {
                switch(com_data.rx_packet_data.configuration)
                {
                    case 1:
                        pulse_generator_1.generation_active = PULSE_GEN_INACTIVE;
                        break;
                    case 2:
                        pulse_generator_2.generation_active = PULSE_GEN_INACTIVE;
                        break;
                    case 3:
                        pulse_generator_3.generation_active = PULSE_GEN_INACTIVE;
                        break;
                    case 4:
                        pulse_generator_4.generation_active = PULSE_GEN_INACTIVE;
                        break;
                    default:
                        com_data.tx_packet_data.command = COM_COMMAND_ERROR;
                        com_data.tx_packet_data.configuration = 1;
                        break;
                }
            }
        }


        else if(com_data.rx_packet_data.auto_manual == MANUAL)
        {
            switch(com_data.rx_packet_data.configuration)
            {
                case 1:
                    WHEEL_M1 = long_byte_data.byte_data[0];
                    WHEEL_S1 = long_byte_data.byte_data[0];

                    WHEEL_M2 = long_byte_data.byte_data[1];
                    WHEEL_S2 = long_byte_data.byte_data[1];
                    pulse_generator_1.generation_active = PULSE_GEN_INACTIVE;
                    break;
                case 2:
                    WHEEL_M3 = long_byte_data.byte_data[0];
                    WHEEL_S3 = long_byte_data.byte_data[0];

                    WHEEL_M4 = long_byte_data.byte_data[1];
                    WHEEL_S4 = long_byte_data.byte_data[1];
                    pulse_generator_1.generation_active = PULSE_GEN_INACTIVE;
                    break;
                default:
                    com_data.tx_packet_data.command = COM_COMMAND_ERROR;
                    com_data.tx_packet_data.configuration = 1;
                    break;
            }
        }
    }
}





void initiate_pulse_generation_1(void)
{
    pulse_generator_1.cycle_counter = com_data.rx_packet_data.count;            // Number of pulses to be generated
    pulse_generator_1.direction = com_data.rx_packet_data.fwd_rev;
    pulse_generator_1.time_set_value.m1_low_time = wheel_Timings[com_data.rx_packet_data.speed][0] + wheel_Timings[com_data.rx_packet_data.speed][1];
    pulse_generator_1.time_set_value.m2_low_time = wheel_Timings[com_data.rx_packet_data.speed][0];
    pulse_generator_1.time_set_value.m1_high_time = wheel_Timings[com_data.rx_packet_data.speed][1];
    pulse_generator_1.time_set_value.m2_high_time = wheel_Timings[com_data.rx_packet_data.speed][0];

    pulse_generator_1.time_down_counter = pulse_generator_1.time_set_value.m1_low_time;    // Load with first time
    pulse_generator_1.next_state = PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED;
    pulse_generator_1.generation_active = PULSE_GEN_ACTIVE;
}


void initiate_pulse_generation_2(void)
{
    pulse_generator_2.cycle_counter = com_data.rx_packet_data.count;            // Number of pulses to be generated
    pulse_generator_2.direction = com_data.rx_packet_data.fwd_rev;
    pulse_generator_2.time_set_value.m1_low_time = wheel_Timings[com_data.rx_packet_data.speed][0] + wheel_Timings[com_data.rx_packet_data.speed][1];
    pulse_generator_2.time_set_value.m2_low_time = wheel_Timings[com_data.rx_packet_data.speed][0];
    pulse_generator_2.time_set_value.m1_high_time = wheel_Timings[com_data.rx_packet_data.speed][1];
    pulse_generator_2.time_set_value.m2_high_time = wheel_Timings[com_data.rx_packet_data.speed][0];

    pulse_generator_2.time_down_counter = pulse_generator_2.time_set_value.m1_low_time;    // Load with first time
    pulse_generator_2.next_state = PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED;
    pulse_generator_2.generation_active = PULSE_GEN_ACTIVE;
}

void initiate_pulse_generation_3(void)
{
    pulse_generator_3.cycle_counter = com_data.rx_packet_data.count;            // Number of pulses to be generated
    pulse_generator_3.direction = com_data.rx_packet_data.fwd_rev;
    pulse_generator_3.time_set_value.m1_low_time = wheel_Timings[com_data.rx_packet_data.speed][0] + wheel_Timings[com_data.rx_packet_data.speed][1];
    pulse_generator_3.time_set_value.m2_low_time = wheel_Timings[com_data.rx_packet_data.speed][0];
    pulse_generator_3.time_set_value.m1_high_time = wheel_Timings[com_data.rx_packet_data.speed][1];
    pulse_generator_3.time_set_value.m2_high_time = wheel_Timings[com_data.rx_packet_data.speed][0];

    pulse_generator_3.time_down_counter = pulse_generator_3.time_set_value.m1_low_time;    // Load with first time
    pulse_generator_3.next_state = PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED;
    pulse_generator_3.generation_active = PULSE_GEN_ACTIVE;
}


void initiate_pulse_generation_4(void)
{
    pulse_generator_4.cycle_counter = com_data.rx_packet_data.count;            // Number of pulses to be generated
    pulse_generator_4.direction = com_data.rx_packet_data.fwd_rev;
    pulse_generator_4.time_set_value.m1_low_time = wheel_Timings[com_data.rx_packet_data.speed][0] + wheel_Timings[com_data.rx_packet_data.speed][1];
    pulse_generator_4.time_set_value.m2_low_time = wheel_Timings[com_data.rx_packet_data.speed][0];
    pulse_generator_4.time_set_value.m1_high_time = wheel_Timings[com_data.rx_packet_data.speed][1];
    pulse_generator_4.time_set_value.m2_high_time = wheel_Timings[com_data.rx_packet_data.speed][0];

    pulse_generator_4.time_down_counter = pulse_generator_4.time_set_value.m1_low_time;    // Load with first time
    pulse_generator_4.next_state = PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED;
    pulse_generator_4.generation_active = PULSE_GEN_ACTIVE;
}




void initiate_com_data_transmission(void)
{
    union
    {
        struct
        {
            unsigned char b0:1;
            unsigned char b1:1;
            unsigned char b2:1;
            unsigned char b3:1;
            unsigned char b4:1;
            unsigned char b5:1;
            unsigned char b6:1;
            unsigned char b7:1;

        };
        unsigned char data;
    }bit_arb;


    unsigned int i;

    com_data.tx_packet_data.start_byte = COM_DATA_SOF;
    com_data.tx_packet_data.length = 12;
    com_data.tx_packet_data.stop_byte = COM_DATA_EOF;

    bit_arb.data = 0;
    
    bit_arb.b0 = pulse_generator_1.generation_active;
    bit_arb.b1 = pulse_generator_2.generation_active;
    bit_arb.b2 = pulse_generator_3.generation_active;
    bit_arb.b3 = pulse_generator_4.generation_active;

    com_data.tx_packet_data.configuration = bit_arb.data;

    for (i=0; i<22; i++)
    {
        com_data.tx_data[i] = com_data.tx_packet_data.data[i];
    }

    com_data.tx_data_length = 22;
    com_data.tx_data_available = 1;
}