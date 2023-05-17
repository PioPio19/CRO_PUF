--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

--entity cro_cell_v1 is
--  Port (
--  sig_in    : in std_logic;
--  sig_out   : out std_logic );
--end cro_cell_v1;

--architecture Behavioral of cro_cell_v1 is
--    attribute dont_touch          : string;
--    signal chain_c                : std_logic;
--    signal chain_out              : std_logic;
--    attribute dont_touch of chain_c : signal is "true";    
--    attribute dont_touch of Behavioral : architecture is "yes";

--begin
--    buff_and : LUT2
--    GENERIC MAP(
--    INIT => x"7")
--    PORT MAP( 
--    I0 => sig_in,
--    I1 => sig_in,
--    O  => chain_c);
--    buff_inv : LUT1
--    generic map(
--    init => x"1")
--    PORT MAP(
--    I0 => chain_c,
--    O => sig_out);  

--end Behavioral;
library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1_bel_impl is
  port (
    A : in std_logic;
    B : in std_logic;
    S : in std_logic;
    Y : out std_logic
  );
end entity mux_2to1_bel_impl;

architecture rtl of mux_2to1_bel_impl is
begin
  -- Implementasi BEL MUX 2-to-1
  Y <= A when S = '0' else B;
end architecture rtl;