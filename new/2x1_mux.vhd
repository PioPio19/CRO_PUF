library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity mux_2to1 is
  Port (
  sig_in     : in std_logic;
  mux_sw_0   : in std_logic;
  mux_sw_1   : in std_logic;
  mux_sw_2   : in std_logic;
  mux_sw_3   : in std_logic;
  mux_out    : out std_logic);
end mux_2to1;

architecture Behavioral of mux_2to1 is

component CRO_Cell is
  Port (
  sig_in    : in std_logic;
  sig_out   : out std_logic);
end component CRO_Cell;
    attribute dont_touch                : string;
    signal mux_0_in                     : std_logic_vector(1 downto 0);  
    signal mux_1_in                     : std_logic_vector(1 downto 0); 
    signal mux_2_in                     : std_logic_vector(1 downto 0); 
    signal mux_3_in                     : std_logic_vector(1 downto 0);
    signal mux_0_out                    : std_logic;  
    signal mux_1_out                    : std_logic; 
    signal mux_2_out                    : std_logic;  
    attribute dont_touch of Behavioral  : architecture is "yes";
    attribute dont_touch of CRO_Cell    : component is "yes";
    attribute dont_touch of mux_0_in    : signal is "yes";
    attribute dont_touch of mux_1_in    : signal is "yes";
    attribute dont_touch of mux_2_in    : signal is "yes";
    attribute dont_touch of mux_3_in    : signal is "yes";
    attribute dont_touch of mux_0_out   : signal is "yes";
    attribute dont_touch of mux_1_out   : signal is "yes";
    attribute dont_touch of mux_2_out   : signal is "yes";

begin  
    mux0_cell_0 : CRO_Cell
    port map(
    sig_in  => sig_in,
    sig_out => mux_0_in(0));
    
    mux0_cell_1 : CRO_Cell
    port map(
    sig_in  => sig_in,
    sig_out => mux_0_in(1));
    mux_0_out <= mux_0_in(0) when (mux_sw_0 = '0') else mux_0_in(1);
    
-- Second CRO MUX    
    mux1_cell_0 : CRO_Cell
    port map(
    sig_in  => mux_0_out,
    sig_out => mux_1_in(0));
    
    mux1_cell_1 : CRO_Cell
    port map(
    sig_in  => mux_0_out,
    sig_out => mux_1_in(1));
    mux_1_out <= mux_1_in(0) when (mux_sw_1 = '0') else mux_1_in(1);
    
-- Third CRO MUX    
    mux2_cell_0 : CRO_Cell
    port map(
    sig_in  => mux_1_out,
    sig_out => mux_2_in(0));
    
    mux2_cell_1 : CRO_Cell
    port map(
    sig_in  => mux_1_out,
    sig_out => mux_2_in(1));
    mux_2_out <= mux_2_in(0) when (mux_sw_2 = '0') else mux_2_in(1);
    
-- Fourth CRO MUX    
    mux3_cell_0 : CRO_Cell
    port map(
    sig_in  => mux_2_out,
    sig_out => mux_3_in(0));
    
    mux3_cell_1 : CRO_Cell
    port map(
    sig_in  => mux_2_out,
    sig_out => mux_3_in(1));
    mux_out <= mux_3_in(0) when (mux_sw_3 = '0') else mux_3_in(1);
end Behavioral;