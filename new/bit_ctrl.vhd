library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
--USE work.ro_pack_conf.ALL;

entity bit_ctrl is
    generic (
        data_in : integer := 32
    );
  Port ( 
  data_in1  : in std_logic_vector((data_in-1) downto 0);
  data_in2  : in std_logic_vector((data_in-1) downto 0);
  out_ena   : out std_logic;
  out_Inv   : out std_logic;
  sw_0     : out std_logic_vector(3 downto 0);
  sw_1     : out std_logic_vector(3 downto 0);
  sw_2     : out std_logic_vector(3 downto 0);
  sw_3     : out std_logic_vector(3 downto 0));
end bit_ctrl;

architecture Behavioral of bit_ctrl is
    signal data_rest1 : std_logic_vector(15 downto 0);
    signal data_rest2 : std_logic_vector(30 downto 0);
begin
sw_0(3 downto 0) <= data_in1(3 downto 0);
sw_1(3 downto 0) <= data_in1(7 downto 4);
sw_2(3 downto 0) <= data_in1(11 downto 8);
sw_3(3 downto 0) <= data_in1(15 downto 12);
data_rest1(15 downto 0) <= data_in1(31 downto 16);
out_ena <= data_in2(0);
out_inv <= not(data_in2(0));
data_rest2(30 downto 0) <= data_in2(31 downto 1);
end Behavioral;