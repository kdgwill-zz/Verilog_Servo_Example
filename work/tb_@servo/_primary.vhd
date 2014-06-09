library verilog;
use verilog.vl_types.all;
entity tb_Servo is
    generic(
        CLK_FREQUENCY   : integer := 50000000;
        SPEED_MAX_PERIOD: real    := 0.030000;
        MAX_RAM_POS     : integer := 256;
        VALUE_SCALING   : integer := 256
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_FREQUENCY : constant is 1;
    attribute mti_svvh_generic_type of SPEED_MAX_PERIOD : constant is 1;
    attribute mti_svvh_generic_type of MAX_RAM_POS : constant is 1;
    attribute mti_svvh_generic_type of VALUE_SCALING : constant is 1;
end tb_Servo;
