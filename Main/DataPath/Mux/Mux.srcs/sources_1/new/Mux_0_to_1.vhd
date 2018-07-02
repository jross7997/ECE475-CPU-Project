----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2018 10:02:05 AM
-- Design Name: 
-- Module Name: Mux_0_to_1 - Behavioral
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

entity Mux_0_to_1 is
    Port ( x : in STD_LOGIC_VECTOR (4 downto 0);
           y : in STD_LOGIC_VECTOR (4 downto 0);
           s : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (4 downto 0));
end Mux_0_to_1;

architecture Behavioral of Mux_0_to_1 is

begin
with s select 
     o <= x when '1',
          y when others;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
package final_project is
component Mux_0_to_1
  Port ( x : in std_logic_vector(4 downto 0);
      y : in std_logic_vector(4 downto 0);
      s : in std_logic;
      o : out std_logic_vector(4 downto 0));
end component;
end final_project;