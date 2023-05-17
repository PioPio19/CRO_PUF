library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity arbiter is
    port ( 
        input1, input2: in std_logic;
        output: out std_logic
    );
end arbiter;

architecture Behavioral of arbiter is

begin
    process (input1, input2)
    begin
        if (input1 = '1' and input2 = '0') then
            output <= '1';
        elsif (input1 = '0' and input2 = '1') then
            output <= '0';
        end if;
    end process;
end Behavioral;
