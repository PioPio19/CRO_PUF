library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

package ro_pack_conf is
    constant nstg   : natural   :=4;    --number of stage ring oscillator (n-1)*2
--    constant nro    : natural   :=1;    --total number of ring oscillator (n+1)
    constant stage  : natural   :=4; -- value mean 2^stage
end package;