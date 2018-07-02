--*************************************************************************--
--64 Bit Adder
--For the ECE 475 final Project
--*************************************************************************--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all; 
library UNISIM;
use UNISIM.VComponents.all;
--Based on ALU Code
entity adder64 is
 Port ( ain, bin : in std_logic_vector(63 downto 0);
        sum : out std_logic_vector(63 downto 0)
       );
       
function add_two_values (ain, bin : std_logic_vector(63 downto 0)) return std_logic_vector is
    variable sumout : std_logic_vector(63 downto 0);
    variable a, b: std_logic_vector(63 downto 0);
           begin
               a := ain;
               b := bin; 
               sumout := a + b;
           return sumout;
       end add_two_values;        
end adder64;

architecture Behavioral of adder64 is

begin
    sum <= add_two_values(ain,bin);
end Behavioral;