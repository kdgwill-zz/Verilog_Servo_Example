library verilog;
use verilog.vl_types.all;
entity Servo_Rom is
    generic(
        ADDR_LEN        : integer := 8;
        DATA_LEN        : integer := 13
    );
    port(
        clock           : in     vl_logic;
        address         : in     vl_logic_vector;
        data            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_LEN : constant is 1;
    attribute mti_svvh_generic_type of DATA_LEN : constant is 1;
end Servo_Rom;
