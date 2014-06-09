library verilog;
use verilog.vl_types.all;
entity ServoLinPosCntr is
    generic(
        ADDR_LEN        : integer := 8;
        POSITION_DATA_LEN: integer := 8;
        SPEED_DATA_LEN  : integer := 5
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        data            : in     vl_logic_vector;
        address         : out    vl_logic_vector;
        position        : out    vl_logic_vector;
        nextValue       : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_LEN : constant is 1;
    attribute mti_svvh_generic_type of POSITION_DATA_LEN : constant is 1;
    attribute mti_svvh_generic_type of SPEED_DATA_LEN : constant is 1;
end ServoLinPosCntr;
