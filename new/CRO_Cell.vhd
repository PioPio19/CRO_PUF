library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity CRO_Cell is
  Port (
  sig_in    : in std_logic;
  sig_out   : out std_logic );
end CRO_Cell;

architecture Behavioral of CRO_Cell is
    attribute dont_touch          : string;  
    attribute dont_touch of Behavioral : architecture is "yes";
begin
--This is to generate NOT Gate using LUT 6 input. 
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
    O  => sig_out);
end Behavioral;
