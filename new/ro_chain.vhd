library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity ro_chain is
    Port ( 
    sig_in  : in    std_logic;
    ro_out  : out   std_logic);
end ro_chain;

architecture Behavioral of ro_chain is
    attribute dont_touch          : string;
--    signal chain_c                : std_logic;
--    signal chain_out              : std_logic;
--    attribute dont_touch of chain_c : signal is "true";
    attribute dont_touch of Behavioral : architecture is "yes";
begin  
--    buff_and : LUT2
--    GENERIC MAP(
--    INIT => x"7")
--    PORT MAP( 
--    I0 => sig_in,
--    I1 => sig_in,
--    O  => ro_out);
    not_gate : LUT6
    GENERIC MAP(
    INIT => x"7FFFFFFFFFFFFFFF")
    PORT MAP( 
    I0 => sig_in,
    I1 => sig_in,
    I2 => sig_in,
    I3 => sig_in,
    I4 => sig_in,
    I5 => sig_in,
    O  => ro_out);
--    buff_inv : LUT1
--    generic map(
--    init => x"1")
--    PORT MAP(
--    I0 => chain_c,
--    O => ro_out);
end Behavioral;