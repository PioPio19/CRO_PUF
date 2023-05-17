library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;
LIBRARY work;
USE work.ro_pack_conf.ALL;

entity stage_gen is
    generic (
    length : integer := 1);
    Port ( 
    ena      : in std_logic;
    chain_out: out std_logic);
end stage_gen;

architecture Behavioral of stage_gen is
component ro_chain is
    Port ( 
    sig_in  : in    std_logic;
    ro_out  : out   std_logic);
end component ro_chain;
    attribute dont_touch : string;
    signal chain_cell    : std_logic_vector(length-1 downto 0);
    attribute dont_touch of chain_cell : signal is "true";
begin
    chain_cell(0) <= not (ena and chain_cell(length-1));
    gen_chain : FOR ii IN 0 TO length-2 GENERATE
    cell_i : ro_chain
    PORT MAP (
      sig_in => chain_cell(ii),
      ro_out => chain_cell(ii+1));
    END GENERATE gen_chain;
    chain_out <= chain_cell(length-1);    
end Behavioral;