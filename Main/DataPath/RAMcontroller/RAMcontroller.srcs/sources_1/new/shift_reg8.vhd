----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2016 10:52:51 AM
-- Design Name: 
-- Module Name: shift_reg8 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_reg8 is
 Port (parallelin : in std_logic_vector(7 downto 0);
       en: in std_logic;
       shiftLoadn: in std_logic;
       clk : in std_logic;
       data_out : out std_logic_vector(7 downto 0):= "00000000"
  );
end shift_reg8;

architecture Behavioral of shift_reg8 is
    signal shift_reg : std_logic_vector(7 downto 0);

begin
process (clk) begin
if rising_edge(clk) then
    if (shiftLoadn = '0') then
        shift_reg <= parallelin;
    elsif (shiftLoadn = '1') then
        shift_reg <= '0' & shift_reg(7 downto 1);
    end if;
end if;

end process;

data_out <= shift_reg;

end Behavioral;
