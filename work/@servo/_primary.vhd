library verilog;
use verilog.vl_types.all;
entity Servo is
    generic(
        CLK_FREQUENCY   : integer := 50000000;
        VALUE_SCALING   : integer := 256;
        CTR_LEN         : integer := 21;
        SPEED_DATA_LEN  : integer := 5;
        POSITION_DATA_LEN: integer := 8;
        ADDR_LEN        : integer := 8;
        MAX_RAM_POS     : integer := 256;
        DATA_LEN        : integer := 13
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        data            : in     vl_logic_vector;
        address         : out    vl_logic_vector;
        servo_q         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_FREQUENCY : constant is 1;
    attribute mti_svvh_generic_type of VALUE_SCALING : constant is 1;
    attribute mti_svvh_generic_type of CTR_LEN : constant is 1;
    attribute mti_svvh_generic_type of SPEED_DATA_LEN : constant is 1;
    attribute mti_svvh_generic_type of POSITION_DATA_LEN : constant is 1;
    attribute mti_svvh_generic_type of ADDR_LEN : constant is 1;
    attribute mti_svvh_generic_type of MAX_RAM_POS : constant is 1;
    attribute mti_svvh_generic_type of DATA_LEN : constant is 1;
end Servo;
