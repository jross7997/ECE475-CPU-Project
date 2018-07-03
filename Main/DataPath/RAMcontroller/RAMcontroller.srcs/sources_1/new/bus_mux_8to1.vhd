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

entity bus_mux_8to1 is
  Port (Hex0: in std_logic_vector(3 downto 0);
        Hex1: in std_logic_vector(3 downto 0);
        Hex2: in std_logic_vector(3 downto 0);
        Hex3: in std_logic_vector(3 downto 0);
        Hex4: in std_logic_vector(3 downto 0);
        Hex5: in std_logic_vector(3 downto 0);
        Hex6: in std_logic_vector(3 downto 0);
        Hex7: in std_logic_vector(3 downto 0);
        sel_in : in std_logic_vector(2 downto 0);
        HexOut: out std_logic_vector(3 downto 0)
   );
end bus_mux_8to1;

architecture Behavioral of bus_mux_8to1 is

begin
with sel_in select HexOut <=
    Hex0 when "000",
    Hex1 when "001",
    Hex2 when "010",
    Hex3 when "011",
    Hex4 when "100",
    Hex5 when "101",
    Hex6 when "110",
    Hex7 when "111",
    "0000" when others;

end Behavioral;