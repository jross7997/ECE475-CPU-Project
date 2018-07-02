----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2018 09:41:54 AM
-- Design Name: 
-- Module Name: LSL - Behavioral
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

entity LSL is
    Port ( a : in STD_LOGIC_VECTOR (63 downto 0);
           b : in STD_LOGIC_VECTOR (63 downto 0);
           shift : out STD_LOGIC_VECTOR (63 downto 0)
           );
end LSL;

architecture Behavioral of LSL is

    signal nextLine: std_logic_vector(63 downto 0);
    signal zeros : std_logic_vector(63 downto 0) := x"0000000000000000";
    signal sel :Std_logic_vector(5 downto 0);


begin

sel <= b(5 downto 0);

with sel select

nextLine <=   zeros(0) & a(63 downto 1) when "000001",
               a(63 downto 2) & zeros(1 downto 0) when "000010",
               a(63 downto 3) & zeros(2 downto 0) when "000011",
               a(63 downto 4) & zeros(3 downto 0) when "000100",
               a(63 downto 5) & zeros(4 downto 0) when "000101",
               a(63 downto 6) & zeros(5 downto 0) when "000110",
               a(63 downto 7) &zeros(6 downto 0) when "000111",
               a(63 downto 8) & zeros(7 downto 0) when "001000",
               a(63 downto 9) & zeros(8 downto 0) when "001001",
               a(63 downto 10) &  zeros(9 downto 0)when "001010",
               a(63 downto 11) & zeros(10 downto 0) when "001011",
               a(63 downto 12) & zeros(11 downto 0) when "001100",
               a(63 downto 13) & zeros(12 downto 0) when "001101",
               a(63 downto 14) & zeros(13 downto 0) when "001110",
               a(63 downto 15) &  zeros(14 downto 0) when "001111",
               a(63 downto 16) & zeros(15 downto 0) when "010000",
               a(63 downto 17) & zeros(16 downto 0) when "010001",
               a(63 downto 18)& zeros(17 downto 0)  when "010010",
               a(63 downto 19)& zeros(18 downto 0)  when "010011",
               a(63 downto 20) & zeros(19 downto 0)  when "010100",
               a(63 downto 21) & zeros(20 downto 0)  when "010101",
               a(63 downto 22)& zeros(21 downto 0)  when "010110",
               a(63 downto 23) & zeros(22 downto 0)  when "010111",
               a(63 downto 24) & zeros(23 downto 0) when "011000",
               a(63 downto 25) & zeros(24 downto 0)  when "011001",
               a(63 downto 26) & zeros(25 downto 0)  when "011010",
               a(63 downto 27) & zeros(26 downto 0) when "011011",
               a(63 downto 28) & zeros(27 downto 0)  when "011100",
               a(63 downto 29) & zeros(28 downto 0) when "011101",
               a(63 downto 30) & zeros(29 downto 0) when "011110",
               a(63 downto 31) & zeros(30 downto 0)  when "011111",
               a(63 downto 32) & zeros(31 downto 0) when "100000",
               a(63 downto 33) & zeros(32 downto 0) when "100001",
               a(63 downto 34) & zeros(33 downto 0) when "100010",
               a(63 downto 35) & zeros(34 downto 0)  when "100011",
               a(63 downto 36) & zeros(35 downto 0) when "100100",
               a(63 downto 37) & zeros(36 downto 0)  when "100101",
               a(63 downto 38) & zeros(37 downto 0) when "100110",
               a(63 downto 39) & zeros(38 downto 0) when "100111",
               a(63 downto 40) & zeros(39 downto 0) when "101000",
               a(63 downto 41) & zeros(40 downto 0) when "101001",
               a(63 downto 42) & zeros(41 downto 0) when "101010",
               a(63 downto 43) & zeros(42 downto 0) when "101011",
               a(63 downto 44) & zeros(43 downto 0) when "101100",
               a(63 downto 45) & zeros(44 downto 0) when "101101",
               a(63 downto 46) & zeros(45 downto 0) when "101110",
               a(63 downto 47) & zeros(46 downto 0) when "101111",
               a(63 downto 48) & zeros(47 downto 0) when "110000",
               a(63 downto 49) & zeros(48 downto 0) when "110001",
               a(63 downto 50) & zeros(49 downto 0) when "110010",
               a(63 downto 51) & zeros(50 downto 0) when "110011",
               a(63 downto 52) & zeros(51 downto 0) when "110100",
               a(63 downto 53) & zeros(52 downto 0) when "110101",
               a(63 downto 54) & zeros(53 downto 0) when "110110",
               a(63 downto 55) & zeros(54 downto 0) when "110111",
               a(63 downto 56) & zeros(55 downto 0) when "111000",
               a(63 downto 57) & zeros(56 downto 0) when "111001",
               a(63 downto 58) & zeros(57 downto 0) when "111010",
               a(63 downto 59) & zeros(58 downto 0) when "111011",
               a(63 downto 60) & zeros(59 downto 0) when "111100",
               a(63 downto 61) & zeros(60 downto 0) when "111101",
               a(63 downto 62) & zeros(61 downto 0) when "111110",
               a(63) & zeros(62 downto 0) when "111111",
             a when others;
             
          shift <= nextLine;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
package left_shift_package is 
component LSL is
    Port ( a : in STD_LOGIC_VECTOR (63 downto 0);
           b : in STD_LOGIC_VECTOR (63 downto 0);
           shift : out STD_LOGIC_VECTOR (63 downto 0));
end component;
end left_shift_package;