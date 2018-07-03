----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2018 04:57:02 PM
-- Design Name: 
-- Module Name: SignExtender_tb - Behavioral
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
use STD.textio.all;
use IEEE.std_logic_textio.all;

library UNISIM;
use UNISIM.VComponents.all;

entity SignExtender_tb is
--  Port ( );
end SignExtender_tb;

architecture Behavioral of SignExtender_tb is

component SignExtender is
    Port ( instruction : in STD_LOGIC_VECTOR (31 downto 0);
           extended : out STD_LOGIC_VECTOR (63 downto 0));
end component;
signal instruction : STD_LOGIC_VECTOR(31 downto 0);
signal extended : STD_LOGIC_VECTOR (63 downto 0);

begin

DUT: SignExtender PORT MAP(
instruction => instruction,
extended => extended);

process
    variable s :line;
    
    begin
    --Branch -Passed
    instruction <= "00010100" & x"FFFFFF";
    wait for 10 ns;
    
    if (extended = x"0000000000FFFFFF") then
        write(s,string'("Branch Passed"));
        writeline(output,s);
    else
        write(s,string'("Branch Failed"));
        writeline(output,s);
    
    end if;
    
    --CB Format - Passed
    instruction <= "10110100" & "1010101010101010101"&"00000";
    wait for 10 ns;
    if (extended = x"0000000000055555") then
            write(s,string'("CB1 Passed"));
            writeline(output,s);
        else
            write(s,string'("CB1 Failed"));
            writeline(output,s);
    end if;
    
    instruction <= "10110101" & "0101010101010101010"&"00000";
        wait for 10 ns;
        if (extended = x"000000000002AAAA") then
                write(s,string'("CB2 Passed"));
                writeline(output,s);
            else
                write(s,string'("CB2 Failed"));
                writeline(output,s);
        end if;
    --Immediate
    instruction <= "1001000100" & "101010101010"&"00000"&"00001";
    wait for 10 ns;
     if (extended = x"0000000000000AAA") then
         write(s,string'("Immediate1 Passed"));
         writeline(output,s);
      else
            write(s,string'("Immediate 1 Failed"));
          writeline(output,s);
      end if;
      
    instruction <= "1101000100" & "101010101010"&"00000"&"00001";
    wait for 10 ns;
    if (extended = x"0000000000000AAA") then
        write(s,string'("Immediate2 Passed"));
        writeline(output,s);
    else
         write(s,string'("Immediate 2 Failed"));
         writeline(output,s);
     end if;
   
   --Logical Shifts  Passed
   instruction <= "11010011011" & "00000"&"101010"&"00001"&"00010";
       wait for 10 ns;
       if (extended = x"000000000000002A") then
           write(s,string'("LS1 Passed"));
           writeline(output,s);
       else
            write(s,string'("LS1 Failed"));
            writeline(output,s);
        end if;
        
   instruction <= "11010011010" & "00000"&"101010"&"00001"&"00010";
     wait for 10 ns;
     if (extended = x"000000000000002A") then
        write(s,string'("LS2 Passed"));
       writeline(output,s);
     else
        write(s,string'("LS2 Failed"));
       writeline(output,s);
     end if;
end process;
end Behavioral;
    
    

