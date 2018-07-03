library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity one_hot_dec_anode is
  Port (SelIn: in std_logic_vector(2 downto 0);
        blank : in std_logic;
        An: out std_logic_vector(7 downto 0)
        
   );
end one_hot_dec_anode;

architecture Behavioral of one_hot_dec_anode is
signal merge_enSel :std_logic_vector(3 downto 0);
begin
merge_enSel <= blank & SelIn;
with merge_enSel select An <=
    "11111110" when "0000", --0
    "11111101" when "0001", -- 1
    "11111011" when "0010", -- 2
    "11110111" when "0011", -- 3
    "11101111" when "0100", -- 4
    "11011111" when "0101",  -- 5
    "10111111" when "0110", -- 6
    "01111111" when "0111", -- 7
    "11111111" when "1XXX",
    "11111111" when others;

end Behavioral;