library verilog;
use verilog.vl_types.all;
entity testServo is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        position        : in     vl_logic_vector(7 downto 0);
        servo           : out    vl_logic
    );
end testServo;
