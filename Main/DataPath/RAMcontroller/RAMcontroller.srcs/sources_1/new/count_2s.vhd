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

entity count_2s is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           two_s : out STD_LOGIC);
end count_2s;

architecture Behavioral of count_2s is
signal q: std_logic_vector(31 downto 0) := X"00000000";
begin
process
     begin      
        if en = '1' then
            if clk'event and clk = '1' then
                 if clr = '1' then
                    q <= X"00000000";
                    two_s <= '0';
                  else
                    q <= q + 1;
                    if q = x"0BEBC200" then
                        two_s <= '0';
                     else
                        two_s <= '0';
                     end if;
                  end if;
             end if;
         end if;
     end process;

end Behavioral;
