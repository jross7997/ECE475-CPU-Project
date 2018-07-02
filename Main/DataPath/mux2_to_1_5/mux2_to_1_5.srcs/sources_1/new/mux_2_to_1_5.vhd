----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2018 09:58:32 AM
-- Design Name: 
-- Module Name: muz2_to_1_64 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
library UNISIM;
use UNISIM.VComponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2_to_1_5 is
 Port ( x : in std_logic_vector(4 downto 0);
       y : in std_logic_vector(4 downto 0);
       s : in std_logic;
       m : out std_logic_vector(4 downto 0));
end mux2_to_1_5;

architecture Behavioral of mux2_to_1_5 is

begin
with s select m <=
     x when '0',
     y when others;

end Behavioral;
