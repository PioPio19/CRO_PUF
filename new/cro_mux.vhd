library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity cro_mux is
    generic (
        length : integer := 4   -- jumlah input
    );
  Port (
  mux_in    : in std_logic_vector((2**length)-1 downto 0);
  mux_sw    : in std_logic_vector(length-1 downto 0);
  mux_out   : out std_logic);
end cro_mux;

architecture Behavioral of cro_mux is
begin
    mux_out <= mux_in(to_integer(unsigned(mux_sw)));
end Behavioral;
