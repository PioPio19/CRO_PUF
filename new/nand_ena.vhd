library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity nand_ena is
  Port ( 
  cro_fb    : in std_logic; --input feedback from ro out
  cro_ena   : in std_logic;
  out_ena  : out std_logic);
end nand_ena;

architecture Behavioral of nand_ena is

begin
    out_ena <= cro_fb nand cro_ena;
end Behavioral;
