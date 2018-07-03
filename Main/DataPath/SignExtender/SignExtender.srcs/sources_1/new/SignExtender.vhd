--*************************************************************************--
--Sign Extender
--For the ECE 475 final Project
-- This file takes in the entire instruction and selects the part of the
--Instruction that can be used in the ALU and extends it to be 64 bits long
--*************************************************************************--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignExtender is
    Port ( instruction : in STD_LOGIC_VECTOR (31 downto 0);
           extended : out STD_LOGIC_VECTOR (63 downto 0));
end SignExtender;

architecture Behavioral of SignExtender is

begin
    process(instruction)
        begin
        --B-Format
            --Get the branch Address from the instruction
            if instruction(31 downto 26) = "000101" then
                extended <= x"000000000"&"00" & instruction(25 downto 0);
        --CB-Format
            --Get the branch Address from the instruction
            elsif instruction(31 downto 24) = "10110100" or instruction(31 downto 24) = "10110101"  then
                extended <= x"00000000000" & "0" & instruction(23 downto 5);
        --D-Format
            --Get the OffSet from the Instruction
            elsif instruction(31 downto 21) = "11111000000" or instruction(31 downto 21) = "11111000010" then
                extended <= x"0000000000000"&"000"&instruction(19 downto 11);        
        --R-Format
        --Logical Shifts
            --Get the Shift Amount from the Instruction
            elsif instruction(31 downto 21) = "11010011011" or instruction(31 downto 21) = "11010011010" then
                extended <= x"00000000000000"&"00"&instruction(15 downto 10);   
        --I-Format
            --Get Immediate from instruction
            elsif instruction(31 downto 22) = "1001000100" or instruction(31 downto 21) = "1101000100" then
                extended <= x"0000000000000" & instruction(21 downto 10);
        end if;
    end process;
end Behavioral;
