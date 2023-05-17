library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity cro_multi_stage is
    Port ( 
    sig_ro      : in std_logic;
    out_cro     : out std_logic_vector(1 downto 0));
end cro_multi_stage;

architecture Behavioral of cro_multi_stage is
component CRO_Cell is
  Port (
  sig_in    : in std_logic;
  sig_out   : out std_logic);
end component CRO_Cell;


component mux_2to1 is
  Port (
  mux_in    : in std_logic_vector(1 downto 0);
  mux_sw    : in std_logic;
  mux_out   : out std_logic);
end component mux_2to1;

    attribute dont_touch : string;
    signal chain_cell    : std_logic_vector(1 downto 0);
    attribute dont_touch of chain_cell : signal is "true";

begin
    gen_chain : FOR ii IN chain_cell'range GENERATE
    cell_i : CRO_Cell
    PORT MAP (
      sig_in => sig_ro,
      sig_out => chain_cell(ii));
    END GENERATE gen_chain;
      
end Behavioral;