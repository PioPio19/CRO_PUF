library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;
LIBRARY work;
USE work.ro_pack_conf.ALL;

entity ro_bus_v2 is
    generic (
        length : integer := stage   -- jumlah input
    );
    Port ( 
    ena_ro_a   : in std_logic;
    osc_out    : out std_logic_vector((2**length)-1 downto 0));
end  ro_bus_v2;

architecture Behavioral of  ro_bus_v2 is
    attribute   dont_touch : string;
component stage_gen is
    generic (
    length : integer := nstg);
    Port ( 
    ena      : in std_logic;
    chain_out: out std_logic);
end component stage_gen;
    signal      osc_ro_out_a   : std_logic_vector((2**length)-1 downto 0);
    attribute dont_touch of osc_ro_out_a : signal is "true";
begin
    gen_ro_a  : for ii in osc_out'range generate
        ro_stage    : stage_gen
        port map(
            ena         => ena_ro_a,
            chain_out   => osc_ro_out_a(ii));
    end generate;
    osc_out <= osc_ro_out_a;
end Behavioral;