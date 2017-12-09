
#define PULSE_GEN_INACTIVE                          0
#define PULSE_GEN_ACTIVE                            1

#define PULSE_GEN_FWD                               1
#define PULSE_GEN_REV                               2

#define PULSE_GEN_STATE_M1_LOW_TIME_COMPLETED       0
#define PULSE_GEN_STATE_M2_LOW_TIME_COMPLETED       1
#define PULSE_GEN_STATE_M1_HIGH_TIME_COMPLETED      2
#define PULSE_GEN_STATE_M2_HIGH_TIME_COMPLETED      3

#define AUTO                                        1
#define MANUAL                                      2

#define START                                       1
#define STOP                                        0


struct def_pulse_counters
{
    unsigned int m1_low_time;
    unsigned int m2_low_time;
    unsigned int m1_high_time;
    unsigned int m2_high_time;
};

struct def_pulse_generator
{
    struct def_pulse_counters time_set_value;
    unsigned int time_down_counter;
    unsigned char generation_active;
    unsigned char direction;
    unsigned int auto_manual;
    unsigned char next_state;
    unsigned int cycle_counter;
};


extern struct def_pulse_generator pulse_generator_1;
extern struct def_pulse_generator pulse_generator_2;
extern struct def_pulse_generator pulse_generator_3;
extern struct def_pulse_generator pulse_generator_4;






// Com Related



#define MAX_COM_DATA_BUFFER_SIZE        200

#define COM_DATA_SOF                    91
#define COM_DATA_EOF                    93

#define COM_PING_FROM_PC                1
#define COM_PING_RESPONSE_ACK_FROM_TGT  2
#define COM_COMMAND_CONFIG_DATA         3
#define COM_COMMAND_ACK                 4
#define COM_COMMAND_ERROR               5


union def_packet_data
{
    struct
    {
        unsigned char start_byte;
        unsigned int address;
        unsigned int command;
        unsigned int frame_number;
        unsigned int length;        // Should always be 12
        unsigned char configuration;
        unsigned char auto_manual;
        unsigned char fwd_rev;
        unsigned long speed;
        unsigned long count;
        unsigned char start_stop;
        unsigned char stop_byte;
    };
    unsigned char data[22];
};

struct def_com_data
{
    unsigned char tx_data[MAX_COM_DATA_BUFFER_SIZE];
    unsigned char rx_data[MAX_COM_DATA_BUFFER_SIZE];
    
    unsigned int tx_data_length;
    unsigned char tx_data_available;

    unsigned int rx_data_read_pointer;
    unsigned int rx_data_write_pointer;
    
    unsigned char valid_mii_data_received;
    unsigned char phy_data_received;

    union def_packet_data tx_packet_data;
    union def_packet_data rx_packet_data;
};
extern struct def_com_data com_data;


struct def_com_timers
{
    unsigned int wdt;
    unsigned int cmd;
    unsigned int us_100;
};
extern struct def_com_timers com_timers;

extern void phy_generate_pulse4(void);
extern void phy_generate_pulse3(void);
extern void phy_generate_pulse2(void);
extern void phy_generate_pulse1(void);

extern void pulse_gen_set4(void);
extern void pulse_gen_set3(void);
extern void pulse_gen_set2(void);
extern void pulse_gen_set1(void);


extern void pulse_gen(void);
extern void pulse_gen_tasks(void);


extern void init_pulse_gen(void);
extern void init_pulse_gen_ports(void);
extern void init_pulse_gen_timer(void);
extern void init_pulse_gen_com_variables(void);

extern void pulse_gen_com_task(void);
extern void mii_validate_received_data(void);
extern unsigned int mii_get_data_offset_index(unsigned int ReadPointer, unsigned int Position);
extern void process_com_request(void);
extern void initiate_pulse_generation(void);
extern void initiate_pulse_generation_1(void);
extern void initiate_pulse_generation_2(void);
extern void initiate_pulse_generation_3(void);
extern void initiate_pulse_generation_4(void);
extern void initiate_com_data_transmission(void);


extern unsigned int wheel_Timings[39][2];

