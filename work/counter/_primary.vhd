library verilog;
use verilog.vl_types.all;
entity counter is
    generic(
        CTR_LEN         : integer := 27
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        value           : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CTR_LEN : constant is 1;
end counter;
