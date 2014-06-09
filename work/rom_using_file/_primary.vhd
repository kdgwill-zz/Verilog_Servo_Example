library verilog;
use verilog.vl_types.all;
entity rom_using_file is
    port(
        clock           : in     vl_logic;
        address         : in     vl_logic_vector(7 downto 0);
        data            : out    vl_logic_vector(12 downto 0)
    );
end rom_using_file;
