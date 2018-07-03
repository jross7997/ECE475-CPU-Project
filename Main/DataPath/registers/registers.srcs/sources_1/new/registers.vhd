--*************************************************************************--
--REgister File
--For the ECE 475 final Project
-- Creates a 32 individual 64-bit registers
--*************************************************************************--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--Declare the Entity
entity register_file is   
    port
    (
    readData1          : out std_logic_vector(63 downto 0);
    readData2          : out std_logic_vector(63 downto 0);
    input         : in  std_logic_vector(63 downto 0);
    writeEnable   : in std_logic;
    reg1Sel       : in std_logic_vector(4 downto 0);
    reg2Sel       : in std_logic_vector(4 downto 0);
    writeRegSel   : in std_logic_vector(4 downto 0);
    clk           : in std_logic
    );
end register_file;

--Declare the Architecture
architecture behavioral of register_file is
--We learned the Array Trick from a post on Stack Overflow.
--The registers are actually a big array, and the index of the array will be used as the address

--declare an array of size 32, and of width 64.
--Or 32 separate 64 bit registers
type registerFile is array(0 to 31) of std_logic_vector(63 downto 0);
--declare the signal to work with
signal registers : registerFile;

--Begin the Architecture
begin
    
    --Working in the regFile type, the process is declared
    --The clock is the onlything on the sensitivity list
    regFile: process(clk)
    begin
        --Only works on the rising edge of the clock
        if rising_edge(clk) then 
            --If the write enable is high, then write. Otherwise, read
            if(writeEnable = '1') then
                --Select the correct register and store the input there
                registers(to_integer(unsigned(writeRegSel))) <= input;
             Else
            --Read the data from each selected Register
            readData1 <= registers(to_integer(unsigned(reg1Sel)));
            readData2 <= registers(to_integer(unsigned(reg2Sel)));
            end if;
        end if;
    end process;
    
    --Make Sure that last Register is at 0
    registers(31) <= x"00000000000000";
    
end behavioral;