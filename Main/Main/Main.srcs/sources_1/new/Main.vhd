--*************************************************************************--
--Main File
--For the ECE 475 final Project
-- This file connects the Control Unit and Data Path
--*************************************************************************--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
    Port ( manClock : in STD_LOGIC; --Manual Clock, linked to BTNC
           clk : in STD_LOGIC; --On board 100 MHZ Clock
           led : out STD_LOGIC_VECTOR (4 downto 0); --Output LED
           an : out STD_LOGIC_VECTOR (7 downto 0); --Anodes for Seven Segment Display
           seg : out STD_LOGIC_VECTOR (6 downto 0) --Segments for Seven Segment Display
           );
end Main;

architecture Behavioral of Main is
--*************************************************************************--
--Component Declarations
--*************************************************************************--
component ControlUnit is
    Port (
       instruction : in STD_LOGIC_VECTOR (31 downto 0); --The entire instruction
       manClock : in STD_LOGIC; --Manual Clock
       pcEn : out STD_LOGIC; --Enable Program Counter
       instMemEn : out STD_LOGIC; --Enable Instruction Memory
       reg2Loc : out STD_LOGIC; --Select where the select for the second register comes from
       unconditionalBranch : out STD_LOGIC; --Signal indicating if there's an unconditional branch 
       branch : out STD_LOGIC; -- Indicates if there's any other type of branch
       memRead : out STD_LOGIC; --Enables Read from Main Memory
       memToReg : out STD_LOGIC; --Enables a write from Memory to Registers
       aluOp : out STD_LOGIC_VECTOR (3 downto 0); --The ALU Op code that determines the functionality of the 
       memWrite : out STD_LOGIC; --Enable for writing to memory
       aluSrc : out STD_LOGIC; --Determine what the source for the second ALU Input is
       regWrite : out STD_LOGIC; -- Enable the Write on the Registers
       led: out STD_LOGIC_VECTOR (4 downto 0) --Output LEDs to determine what State we're in
       );
end component;

component DataPath is
 Port (manClock: in STD_LOGIC; --Manual Clock
         clk: in STD_LOGIC; --Clock for Seven Segment
         pcEn: in STD_LOGIC; --Program Counter Enable
         instMemEn: in STD_LOGIC; --Instruction Memory Enable
         ALUOP: in STD_LOGIC_VECTOR(3 downto 0); --ALU codes that select function
         reg2Loc: in STD_LOGIC; --Select where the select for the second register comes from
         uncondBranch: in STD_LOGIC; --A signal signifying an unconditional branch
         branch: in STD_LOGIC; --a signal signifying any other type of branch
         memWrite:in STD_LOGIC; -- write enable for Main Memory
         memRead : in STD_LOGIC; --Read enable for main memory
         memToReg : in STD_LOGIC; --Enable the writing from the Main memory to the registers
         ALUsrc: in STD_LOGIC; --A select line determining the second source of the ALU
         regWrite: in STD_LOGIC; --Write Enable for the Registers
         instruction : out STD_LOGIC_VECTOR(31 downto 0); --Outputs the entire Instruction to the Control Unit
         an :out STD_LOGIC_VECTOR(7 downto 0); --for the Seven Segment
         seg : out STD_LOGIC_VECTOR(6 downto 0)); --For the Seven Segment
end component;  
--*************************************************************************--
--Signal Declarations
--*************************************************************************--
signal pcEn: STD_LOGIC;
signal instMemEn : STD_LOGIC;
signal ALUOP: STD_LOGIC_VECTOR(3 downto 0);
signal reg2Loc: STD_LOGIC;
signal uncondBranch: STD_LOGIC;
signal branch: STD_LOGIC;
signal memWrite: STD_LOGIC;
signal memRead : STD_LOGIC;
signal memToReg : STD_LOGIC;
signal ALUsrc: STD_LOGIC;
signal regWrite:  STD_LOGIC;
signal instruction : STD_LOGIC_VECTOR(31 downto 0);  

--*************************************************************************--
--Connections
--*************************************************************************--
begin
control: ControlUnit Port Map(
       instruction => instruction,
       manClock => manClock,
       pcEn => pcEn,
       instMemEn => instMemEn,
       reg2Loc => reg2Loc,
       unconditionalBranch =>uncondBranch,
       branch => branch,
       memRead => memRead,
       memToReg => memToReg,
       aluOp => ALUOP,
       memWrite => memWrite,
       aluSrc => ALUsrc,
       regWrite => regWrite,
       led => led
        );

data: DataPath Port Map(
     manClock=> manClock,
     clk => clk,
     pcEn=> pcEn,
     instMemEn => instMemEn,
     ALUOP => ALUOP,
     reg2Loc=> reg2Loc,
     uncondBranch => uncondBranch,
     branch => branch,
     memWrite => memWrite,
     memRead => memRead,
     memToReg => memToReg,
     ALUsrc => ALUsrc,
     regWrite => regWrite,
     instruction => instruction,
     an => an,
     seg => seg
     );

end Behavioral;