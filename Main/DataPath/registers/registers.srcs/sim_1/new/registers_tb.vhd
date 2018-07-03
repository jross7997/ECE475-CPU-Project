
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;

--Empty Entity creation
entity register_file_tb is
end register_file_tb;

architecture Behavioral of register_file_tb is
--Declare the component
Component register_file
    Port (
            readData1          : out std_logic_vector(63 downto 0);
             readData2          : out std_logic_vector(63 downto 0);
            input         : in  std_logic_vector(63 downto 0);
            writeEnable   : in std_logic;
            reg1Sel       : in std_logic_vector(4 downto 0);
             reg2Sel       : in std_logic_vector(4 downto 0);
             writeRegSel   : in std_logic_vector(4 downto 0);
             clk           : in std_logic);
END Component;

--Signal Declarations that are the same as the component pieces
signal readData1 :  std_logic_vector(63 downto 0);
signal readData2 : std_logic_vector(63 downto 0);
signal input     :  std_logic_vector(63 downto 0);
signal writeEnable:  std_logic;
signal reg1Sel  :  std_logic_vector(4 downto 0);
signal reg2Sel : std_logic_vector(4 downto 0);
signal writeRegSel   :  std_logic_vector(4 downto 0);
signal clk     :  std_logic;
begin
--port map the test bench
dut: register_file PORT MAP (
    reg1Sel=> reg1Sel,
    reg2Sel => reg2Sel,
    writeEnable => writeEnable,
    writeRegSel => writeRegSel,
    input => input,
    readData1 =>readData1,
    readData2 => readData2,
    clk => clk
);

--Run the Clock
    process
    --the total time for the clock to run is 4 ns, which is even
    begin
    clk <='0';
    wait for 2 ns;
    clk <= '1';
    wait for 2 ns;
    end process;
    
--Start the Process
    process	
    --Variable declarations
    variable s :line;
    --begin the process
    --When each of the signals are assigned, the wait time is 5 ns, which is odd
    begin 
    --Set Write enable low and set the input to 0
    wait for 5 ns;
	writeEnable <= '0';
	input <= x"0000000000000000";
	wait for 5 ns;
	writeRegSel <= "00000";
	wait for 5 ns;
	--Write 0 to the first (index 0) register
	writeEnable <= '1';
	wait for 5 ns;
	
	--Repeat, but the second register (first index) is written to with the value 1
 	writeEnable <= '0';
    wait for 5 ns;
    input <= x"0000000000000001";
    wait for 5 ns;
    writeRegSel <= "00001";
    wait for 5 ns;
    writeEnable <= '1';
    wait for 5 ns;

    --Set the Write line low and read each of the two registers
    writeEnable <= '0';
    wait for 5 ns;
    reg1Sel <= "00000";
    wait for 5 ns;
    reg2Sel <= "00001";
    wait for 5 ns;
    
    --Check if Register 1 passes
    if(readData1 = x"0000000000000000") then  
        write(s, string'("Register 1 Test Passed"));writeline(output,s);  
    else
        write(s, string'("Register 1 Test Failed"));writeline(output,s);
    end if;
    
    --Check if Register 2 passes
    if(readData2 = x"0000000000000001") then  
       write(s, string'("Register 2 Test Passed"));writeline(output,s);  
    else
       write(s, string'("Register 2 Test Failed"));writeline(output,s);
     end if;
        
   END PROCESS;
END Behavioral;