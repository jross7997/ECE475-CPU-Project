----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2018 10:57:22 PM
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

use STD.textio.all;
use IEEE.std_logic_textio.all;

library UNISIM;
use UNISIM.VComponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_tb is
--  Port ( );
end ALU_tb;

architecture Behavioral of ALU_tb is
component  ALU is
   Port ( sel : in STD_LOGIC_VECTOR (3 downto 0);
          data1 : in STD_LOGIC_VECTOR (63 downto 0);
          data2 : in STD_LOGIC_VECTOR (63 downto 0);
          clk : in STD_Logic;
          zero : out STD_LOGIC;
          result : out STD_LOGIC_VECTOR (63 downto 0));
end component;
         signal sel : STD_LOGIC_VECTOR (3 downto 0);
         signal data1 :  STD_LOGIC_VECTOR (63 downto 0);
         signal data2 :  STD_LOGIC_VECTOR (63 downto 0);
         signal clk :  STD_Logic;
         signal zero :  STD_LOGIC;
         signal result :  STD_LOGIC_VECTOR (63 downto 0);

begin

DUT: ALU Port Map(
sel => sel,
data1 => data1,
data2 => data2,
clk => clk,
zero => zero,
result => result
);

process
begin
clk <= '0';
wait for 2 ns;
clk <= '1';
wait for 2 ns;
end process;

process
    variable s : line;
    
    begin
    data1 <= x"0000000000000006";
    data2 <= x"0000000000000005";
    wait for 5 ns;
    sel <= "0000";
    wait for 5 ns;
    if (result = x"000000000000000B") then
     write(s,string'("Add Passed"));
     writeline(output,s);
    else
    write(s,string'("Add Failed"));
    writeline(output,s);    
    end if;
    
    sel <= "0010";
    wait for 5 ns;
    if (result = x"0000000000000001") then
         write(s,string'("Subtraction Passed"));
         writeline(output,s);
        else
        write(s,string'("Subtraction Failed"));
        writeline(output,s);    
        end if;
        
        
    sel <= "0100";
    wait for 5 ns;    
    if (result = x"00000000000000C0") then
       write(s,string'("LSL Passed"));
       writeline(output,s);
    else
       write(s,string'("LSL Failed"));
       writeline(output,s);    
    end if;
    
    
    data1 <= x"00000000000000C0";
    wait for 5 ns;
    sel <= "0101";
    wait for 5 ns;    
       if (result = x"0000000000000006") then
          write(s,string'("LSR Passed"));
          writeline(output,s);
       else
          write(s,string'("LSR Failed"));
          writeline(output,s);    
       end if; 
    
    data1 <= x"0000000000000006";
     wait for 5 ns;
      sel <= "0110";
     wait for 5 ns;    
       if (result = x"000000000000001E") then
        write(s,string'("Mul Passed"));
         writeline(output,s);
       else
         write(s,string'("Mul Failed"));
         writeline(output,s);    
      end if; 
      
 data1 <= x"0000000000000000";
    wait for 5 ns;
   sel <= "0110";
   wait for 5 ns;    
  if (zero = '1') then
     write(s,string'("Mul Zero Flag Passed"));
     writeline(output,s);
  else
     write(s,string'("Mul Zer Floag Failed"));
     writeline(output,s);    
 end if; 
 
  data1 <= x"0000000000000005";
    wait for 5 ns;
   sel <= "0010";
   wait for 5 ns;    
  if (zero = '1') then
     write(s,string'("Sub Zero Flag Passed"));
     writeline(output,s);
  else
     write(s,string'("Sub Zer Floag Failed"));
     writeline(output,s);    
 end if; 
 
   data1 <= x"0000000000000000";
   wait for 5 ns;
   data2 <= x"0000000000000000";
  sel <= "0000";
  wait for 5 ns;    
 if (zero = '1') then
    write(s,string'("Add Zero Flag Passed"));
    writeline(output,s);
 else
    write(s,string'("Add Zer Floag Failed"));
    writeline(output,s);    
end if; 
 
    
end process;

end Behavioral;
