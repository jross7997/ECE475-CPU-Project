----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2018 08:47:11 PM
-- Design Name: 
-- Module Name: LSR - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LSR is
Port ( a : in STD_LOGIC_VECTOR (63 downto 0);
           b : in STD_LOGIC_VECTOR (63 downto 0);
           shift : out STD_LOGIC_VECTOR (63 downto 0)
           );
end LSR;

architecture Behavioral of LSR is

    signal nextLine: std_logic_vector(63 downto 0);
    signal zeros : std_logic_vector(63 downto 0) := x"0000000000000000";
    signal sel :Std_logic_vector(5 downto 0);


begin

sel <= b(5 downto 0);

with sel select

nextLine <=   zeros(0) & a(63 downto 1) when "000001",
              zeros(1 downto 0) & a(63 downto 2) when "000010",
              zeros(2 downto 0) & a(63 downto 3) when "000011",
              zeros(3 downto 0) & a(63 downto 4) when "000100",
              zeros(4 downto 0) & a(63 downto 5) when "000101",
              zeros(5 downto 0) & a(63 downto 6) when "000110",
              zeros(6 downto 0) & a(63 downto 7) when "000111",
              zeros(7 downto 0) & a(63 downto 8) when "001000",
              zeros(8 downto 0) & a(63 downto 9) when "001001",
              zeros(9 downto 0) & a(63 downto 10) when "001010",
              zeros(10 downto 0) & a(63 downto 11) when "001011",
              zeros(11 downto 0) & a(63 downto 12) when "001100",
              zeros(12 downto 0) & a(63 downto 13) when "001101",
              zeros(13 downto 0) & a(63 downto 14) when "001110",
              zeros(14 downto 0) & a(63 downto 15) when "001111",
              zeros(15 downto 0) & a(63 downto 16) when "010000",
              zeros(16 downto 0) & a(63 downto 17) when "010001",
              zeros(17 downto 0) & a(63 downto 18) when "010010",
              zeros(18 downto 0) & a(63 downto 19) when "010011",
              zeros(19 downto 0) & a(63 downto 20) when "010100",
              zeros(20 downto 0) & a(63 downto 21) when "010101",
              zeros(21 downto 0) & a(63 downto 22) when "010110",
              zeros(22 downto 0) & a(63 downto 23) when "010111",
              zeros(23 downto 0) & a(63 downto 24) when "011000",
              zeros(24 downto 0) & a(63 downto 25) when "011001",
              zeros(25 downto 0) & a(63 downto 26) when "011010",
              zeros(26 downto 0) & a(63 downto 27) when "011011",
              zeros(27 downto 0) & a(63 downto 28) when "011100",
              zeros(28 downto 0) & a(63 downto 29) when "011101",
              zeros(29 downto 0) & a(63 downto 30) when "011110",
              zeros(30 downto 0) & a(63 downto 31) when "011111",
              zeros(31 downto 0) & a(63 downto 32) when "100000",
              zeros(32 downto 0) & a(63 downto 33) when "100001",
              zeros(33 downto 0) & a(63 downto 34) when "100010",
              zeros(34 downto 0) & a(63 downto 35) when "100011",
              zeros(35 downto 0) & a(63 downto 36) when "100100",
              zeros(36 downto 0) & a(63 downto 37) when "100101",
              zeros(37 downto 0) & a(63 downto 38) when "100110",
              zeros(38 downto 0) & a(63 downto 39) when "100111",
              zeros(39 downto 0) & a(63 downto 40) when "101000",
              zeros(40 downto 0) & a(63 downto 41) when "101001",
              zeros(41 downto 0) & a(63 downto 42) when "101010",
              zeros(42 downto 0) & a(63 downto 43) when "101011",
              zeros(43 downto 0) & a(63 downto 44) when "101100",
              zeros(44 downto 0) & a(63 downto 45) when "101101",
              zeros(45 downto 0) & a(63 downto 46) when "101110",
              zeros(46 downto 0) & a(63 downto 47) when "101111",
              zeros(47 downto 0) & a(63 downto 48) when "110000",
              zeros(48 downto 0) & a(63 downto 49) when "110001",
              zeros(49 downto 0) & a(63 downto 50) when "110010",
              zeros(50 downto 0) & a(63 downto 51) when "110011",
              zeros(51 downto 0) & a(63 downto 52) when "110100",
              zeros(52 downto 0) & a(63 downto 53) when "110101",
              zeros(53 downto 0) & a(63 downto 54) when "110110",
              zeros(54 downto 0) & a(63 downto 55) when "110111",
              zeros(55 downto 0) & a(63 downto 56) when "111000",
              zeros(56 downto 0) & a(63 downto 57) when "111001",
              zeros(57 downto 0) & a(63 downto 58) when "111010",
              zeros(58 downto 0) & a(63 downto 59) when "111011",
              zeros(59 downto 0) & a(63 downto 60) when "111100",
              zeros(60 downto 0) & a(63 downto 61) when "111101",
              zeros(61 downto 0) & a(63 downto 62) when "111110",
              zeros(62 downto 0) & a(63) when "111111",
             a when others;
             
          shift <= nextLine;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
package right_shift_package is 
component LSR is
    Port ( a : in STD_LOGIC_VECTOR (63 downto 0);
           b : in STD_LOGIC_VECTOR (63 downto 0);
           shift : out STD_LOGIC_VECTOR (63 downto 0)
           );
end component;
end right_shift_package;
