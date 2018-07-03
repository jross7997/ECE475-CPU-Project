----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2016 10:31:35 AM
-- Design Name: 
-- Module Name: count_2s - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity count_8 is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           count_out : out STD_LOGIC_vector(2 downto 0));
end count_8;

architecture Behavioral of count_8 is
signal q: std_logic_vector(2 downto 0) := "000";
begin
process(clk, en, clr)
     begin      
        if en = '1' then
            if clk'event and clk = '1' then
                 if clr = '1' then
                    q <= "000";
 
                  else
                    q <= q + 1;
                  end if;
             end if;
         end if;
     end process;
count_out <= q;
end Behavioral;
