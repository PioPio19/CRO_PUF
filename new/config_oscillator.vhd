library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1_top is
  port (
    I0 : in std_logic;
    I1 : in std_logic;
    S : in std_logic;
    O : out std_logic
  );
end entity mux_2to1_top;


architecture rtl of mux_2to1_top is

  -- Deklarasi instance entity mux_2to1

component mux_2to1_bel_impl is
  port (
    A : in std_logic;
    B : in std_logic;
    S : in std_logic;
    Y : out std_logic
  );
end component mux_2to1_bel_impl;
  -- Instansiasi entity mux_2to1
  signal mux_out : std_logic;
  begin
    MUX_inst : mux_2to1_bel_impl
      port map (
        A => I0,
        B => I1,
        S => S,
        Y => mux_out
      );

    O <= mux_out;
end architecture rtl;