----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2016 09:34:48 AM
-- Design Name: 
-- Module Name: a - Behavioral
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

entity a is
--  Port ( );
end a;

architecture Behavioral of a is
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab6_1_1_testbench is
end lab6_1_1_testbench;

architecture Behavioral of lab6_1_1_testbench is
    COMPONENT lab6_1_1
    
    PORT (  Clk     : in STD_LOGIC;
            D       : in STD_LOGIC_VECTOR( 3 downto 0);
            reset   : in STD_LOGIC;
            load    : in STD_LOGIC;
            Q       : out STD_LOGIC_VECTOR( 3 downto 0)
         );
    END COMPONENT;
    
    SIGNAL Clk      : STD_LOGIC := '0';
    SIGNAL D        : STD_LOGIC_VECTOR( 3 downto 0 ) := "0000";
    SIGNAL reset    : STD_LOGIC := '0';
    SIGNAL load     : STD_LOGIC := '0';
    SIGNAL Q        : STD_LOGIC_VECTOR( 3 downto 0 );
    
    constant clk_period : time := 20ns;
begin
    
    uut: lab6_1_1 PORT MAP (
            Clk => Clk,
            D => D,
            reset => reset,
            load => load,
            Q => Q
            );
    clk_process :process
    begin
        loop
            Clk <= '0';
            wait for clk_period/2;
            Clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;
    
    stim_proc: process
    begin
        loop 
            wait for 20 ns;
            D <= "0101";       
            wait for 40 ns;
            load <= '1';
            wait for 20 ns;
            load <= '0';
            wait for 20 ns;
            D <= "1001";
            wait for 40 ns;
            load <= '1';
            wait for 20 ns;
            load <= '0';
            wait for 15 ns;
            reset <= '1';
            wait for 40 ns;
            load <= '1';
            wait for 20 ns;
            load <= '0';
            wait for 25 ns;
            reset <= '0';
            wait for 40 ns;
            load <= '1';
            wait for 20 ns;
            load <= '0';
            wait for 20 ns;
            D <= "0000";
            wait for 20 ns;
            D <= "0101";
         end loop;
    END PROCESS;
end Behavioral;

begin


end Behavioral;
