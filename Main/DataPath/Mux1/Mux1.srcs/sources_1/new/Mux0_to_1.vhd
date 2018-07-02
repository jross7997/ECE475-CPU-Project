----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2018 10:28:35 AM
-- Design Name: 
-- Module Name: Mux0_to_1 - Behavioral
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

entity Mux0_to_1 is
    Port ( a : in STD_LOGIC_VECTOR (63 downto 0);
           b : in STD_LOGIC_VECTOR (63 downto 0);
           c : in STD_LOGIC;
           d : out STD_LOGIC_VECTOR (63 downto 0));
end Mux0_to_1;

architecture Behavioral of Mux0_to_1 is

begin
with c select
     d <= a when '1',
          b when others;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
package final_project1 is
component mux_memory_to_register
  Port ( a : in std_logic_vector(63 downto 0);
      b : in std_logic_vector(63 downto 0);
      c : in std_logic;
      d : out std_logic_vector(63 downto 0));
end component;
end final_project1;