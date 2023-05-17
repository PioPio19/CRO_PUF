library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity cro_multi_gen is
    generic (
        length : integer :=4  -- jumlah input
    );
    Port ( 
    sig_ro      : in std_logic;
    out_cro     : out std_logic_vector((2**length)-1 downto 0));
end cro_multi_gen;

architecture Behavioral of cro_multi_gen is
component CRO_Cell is
  Port (
  sig_in    : in std_logic;
  sig_out   : out std_logic);
end component CRO_Cell;
    attribute dont_touch : string;
    signal chain_cell    : std_logic_vector((2**length)-1 downto 0);
    attribute dont_touch of chain_cell : signal is "true";

begin
--    gen_cro_0  : for ii in cro_out_sig_0'range generate
    gen_chain : FOR ii IN chain_cell'range GENERATE
    cell_i : CRO_Cell
    PORT MAP (
      sig_in => sig_ro,
      sig_out => chain_cell(ii));
    END GENERATE gen_chain;
    out_cro <= chain_cell;   
--    gen_cro_0  : for ii in cro_out_sig_0'range generate
--        cro_stage_0    : CRO_Cell
--        port map(
--        sig_in  => sig_ro,
--        sig_out => cro_out_sig_0(ii));
--    end generate;
--    out_cro <= cro_out_sig_0;
end Behavioral;