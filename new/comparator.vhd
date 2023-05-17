library ieee;
use ieee.std_logic_1164.all;

entity comparator is
  port (
    input1, input2, input3, input4, input5, input6 : in std_logic_vector(23 downto 0);
    out_sig : out std_logic_vector(14 downto 0));
end entity comparator;

architecture behavioral of comparator is
    signal out_sig1,out_sig2,out_sig3,out_sig4,out_sig5,out_sig6,out_sig7,out_sig8,out_sig9,out_sig10,out_sig11,out_sig12,out_sig13,out_sig14,out_sig15 : std_logic;
--    attribute dont_touch : string;
--    attribute dont_touch of behavioral : architecture is "true";
begin
process(input1, input2, input3, input4, input5, input6)
begin
-- Comparator 1
    if input1<input2 then
    out_sig1 <= '1';
    elsif input1 >= input2 then
    out_sig1 <= '0';
    end if;
-- Comparator 2
    if input1<input3 then
    out_sig2 <= '1';
    elsif input1 >= input3 then
    out_sig2 <= '0';
    end if;
-- Comparator 3
    if input1<input4 then
    out_sig3 <= '1';
    elsif input1 >= input4 then
    out_sig3 <= '0';
    end if;
-- Comparator 4
    if input1<input5 then
    out_sig4 <= '1';
    elsif input1 >= input5 then
    out_sig4 <= '0';
    end if;
-- Comparator 5
    if input1<input6 then
    out_sig5 <= '1';
    elsif input1 >= input6 then
    out_sig5 <= '0';
    end if;
-- Comparator 6
    if input2<input3 then
    out_sig6 <= '1';
    elsif input2 >= input3 then
    out_sig6 <= '0';
    end if;
-- Comparator 7
    if input2<input4 then
    out_sig7 <= '1';
    elsif input2 >= input4 then
    out_sig7 <= '0';
    end if;
-- Comparator 8
    if input2<input5 then
    out_sig8 <= '1';
    elsif input2 >= input5 then
    out_sig8 <= '0';
    end if;
-- Comparator 9
    if input2<input6 then
    out_sig9 <= '1';
    elsif input2 >= input6 then
    out_sig9 <= '0';
    end if;
-- Comparator 10
    if input3<input4 then
    out_sig10 <= '1';
    elsif input3 >= input4 then
    out_sig10 <= '0';
    end if;
-- Comparator 11
    if input3<input5 then
    out_sig11 <= '1';
    elsif input3 >= input5 then
    out_sig11 <= '0';
    end if;
-- Comparator 12
    if input3<input6 then
    out_sig12 <= '1';
    elsif input3 >= input6 then
    out_sig12 <= '0';
    end if;
-- Comparator 13
    if input4<input5 then
    out_sig13 <= '1';
    elsif input4 >= input5 then
    out_sig13 <= '0';
    end if;
-- Comparator 14
    if input4<input6 then
    out_sig14 <= '1';
    elsif input4 >= input6 then
    out_sig14 <= '0';
    end if;
-- Comparator 15
    if input5<input6 then
    out_sig15 <= '1';
    elsif input5 >= input6 then
    out_sig15 <= '0';
    end if;
    end process;
    out_sig(0) <= out_sig1;
    out_sig(1) <= out_sig2;
    out_sig(2) <= out_sig3;
    out_sig(3) <= out_sig4;
    out_sig(4) <= out_sig5;
    out_sig(5) <= out_sig6;
    out_sig(6) <= out_sig7;
    out_sig(7) <= out_sig8;
    out_sig(8) <= out_sig9;
    out_sig(9) <= out_sig10;
    out_sig(10) <= out_sig11;
    out_sig(11) <= out_sig12;
    out_sig(12) <= out_sig13;
    out_sig(13) <= out_sig14;
    out_sig(14) <= out_sig15;
end behavioral;

