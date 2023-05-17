library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity mux_freq_counter is
    generic (
        length : integer := 4   -- jumlah input
    );
  Port (
  mux_in            : in std_logic_vector((2**length)-1 downto 0);
  mux_sw            : in std_logic_vector(length-1 downto 0);
  i_clk_ref         : in  std_logic;
  i_rstb            : in  std_logic;
  mux_out           : out  std_logic;
  o_clock_freq      : out unsigned(23 downto 0));
end mux_freq_counter;

architecture Behavioral of mux_freq_counter is

    attribute dont_touch : string;
    signal i_clk_test                  :  std_logic;

-- r1_  register con clock reference domain
-- r2_  register con clock test domain
    
    --  CLOCK REFERENCE signal declaration
    signal r1_counter_ref              : unsigned(12 downto 0);  -- 12+1 bit: extra bit used for test counter control
    signal r1_counter_test_ena         : std_logic;
    signal r1_counter_test_strobe      : std_logic;
    signal r1_counter_test_rstb        : std_logic;
    --  CLOCK TEST signal declaration
    signal r2_counter_test             : unsigned(23 downto 0); -- clock test can be up-to 16 times clock ref
    signal r2_counter_test_ena         : std_logic;
    signal r2_counter_test_strobe      : std_logic;
    signal r2_counter_test_rstb        : std_logic;
    attribute dont_touch of i_clk_test : signal is "true";
begin
    
    i_clk_test <= mux_in(to_integer(unsigned(mux_sw)));
    mux_out <= i_clk_test;
--  CLOCK REFERENCE domain
p_counter_ref : process (i_rstb,i_clk_ref)
begin
  if(i_rstb='0') then
    r1_counter_ref                 <= (others=>'0');
    r1_counter_test_ena            <= '0';
    r1_counter_test_strobe         <= '0';
    r1_counter_test_rstb           <= '0';
  elsif(rising_edge(i_clk_ref)) then
    r1_counter_ref            <= r1_counter_ref + 1;  -- free running
    
    -- use MSB to control test counter
    r1_counter_test_ena       <= not r1_counter_ref(r1_counter_ref'high);
    
    -- enable storing for 1024 clock cycle after 256 clock cycle
    if(r1_counter_ref>16#1100#) and (r1_counter_ref<16#1500#) then
      r1_counter_test_strobe     <= '1';
    else
      r1_counter_test_strobe     <= '0';
    end if;

    -- enable reset for 1024 clock cycle; after 1024 clock cycle from storing
    if(r1_counter_ref>16#1900#) and (r1_counter_ref<16#1D00#) then
      r1_counter_test_rstb    <= '0';
    else
      r1_counter_test_rstb    <= '1';
    end if;

  end if;
end process p_counter_ref;

------------------------------------------------------------------------------------------------------------------------

p_clk_test_resync : process (i_clk_test)
begin
  if(rising_edge(i_clk_test)) then
    r2_counter_test_ena        <= r1_counter_test_ena     ;
    r2_counter_test_strobe     <= r1_counter_test_strobe  ;
    r2_counter_test_rstb       <= r1_counter_test_rstb    ;
  end if;
end process p_clk_test_resync;

p_counter_test : process (r2_counter_test_rstb,i_clk_test)
begin
  if(r2_counter_test_rstb='0') then
    r2_counter_test         <= (others=>'0');
  elsif(rising_edge(i_clk_test)) then
    if(r2_counter_test_ena='1') then
      r2_counter_test    <= r2_counter_test + 1;
    end if;
  end if;
end process p_counter_test;

p_counter_test_out : process (i_rstb,i_clk_test)
begin
  if(i_rstb='0') then
    o_clock_freq         <= (others=>'1');  -- set all bit to '1' at reset and if test clock is not present
  elsif(rising_edge(i_clk_test)) then
    if(r2_counter_test_strobe='1') then
      o_clock_freq         <= r2_counter_test;
    end if;
  end if;
end process p_counter_test_out;
end Behavioral;
