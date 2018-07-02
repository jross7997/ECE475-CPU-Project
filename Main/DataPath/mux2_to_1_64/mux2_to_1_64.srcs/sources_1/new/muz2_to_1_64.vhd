--*************************************************************************--
--64 bit Two Way Multiplexor
--For the ECE 475 final Project
--*************************************************************************--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
library UNISIM;
use UNISIM.VComponents.all;

entity mux2_to_1_64 is
 Port ( x : in std_logic_vector(63 downto 0);
       y : in std_logic_vector(63 downto 0);
       s : in std_logic;
       m : out std_logic_vector(63 downto 0));
end mux2_to_1_64;

architecture Behavioral of mux2_to_1_64 is

begin
    with s select m <=
         x when '0',
         y when others;
end Behavioral;
