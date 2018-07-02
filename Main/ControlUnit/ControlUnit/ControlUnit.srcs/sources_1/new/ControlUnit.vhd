--*************************************************************************--
--Control Unit
--For the ECE 475 final Project
-- This file is a one-hot state machine that outputs signals to control the
--Flow of Data in the Data Path. It was designed to implement a multiple
--Clock Cycle implementation of the Assignment
--*************************************************************************--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
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
end ControlUnit;

architecture Behavioral of ControlUnit is
--Declare states
type state_type is (Idle, Fetch, Fetch2, Decode,Branch_EX,R_Format_EX,R_Format_WB,Ls_EX,Ls_WB,Cbz,Cbnz,
                    I_Format_EX, I_Format_WB,Stur_EX,Stur_MA,Ldur_EX,Ldur_MA,Ldur_WB);
    signal state : state_type;
    signal next_state : state_type;
    --Enable One-Hot
    attribute enum_endcoding : string;
    attribute enum_endcoding of state_type : type is "one-hot";

begin

--Change States on the Falling Edge of the Clock
clk: process (manClock,next_state)
    begin
        if manClock = '0' and manClock'event then
        state <= next_state;
        end if;
    end process;

--Set all of the Outputs for each state
process(state)
    begin 
        CASE state is
           When Idle =>
             aluOp <= "1111";
             pcEn <= '0';
             instMemEn <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '0';
             led <= "00001";
           when Fetch =>
             aluOp <= "1111";
             pcEn <= '1';
             instMemEn <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '0';
             led <= "00010";
           when Fetch2 =>
             aluOp <= "1111";
             pcEn <= '1';
             instMemEn  <= '1';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '0';
             led <= "10010";
          when Decode =>
             aluOp <= "1111";
             pcEn <= '0';
             instMemEn  <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '0';
             led <= "00011";          
         when Branch_EX =>
             aluOp <= "1100";
             pcEn <= '0';
             instMemEn  <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '1';
             branch <= '1';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '0';
             led <= "00100";    
         when R_Format_EX =>
             pcEn <= '0';
             instMemEn  <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '0';
             led <= "00101";
             --Add
             if instruction(31 downto 20) = "10001011000" then
                aluOp <= "0000";
             --Sub
             elsif instruction(31 downto 20) = "11001011000" then
                aluOp <= "00010";
              --Mul  
             elsif instruction(31 downto 20) ="10011011000" then
                aluOp <= "0110";
              --AND
             elsif  instruction(31 downto 20) = "10001010000" then
                aluOp <= "1001";
             --OR
             elsif  instruction(31 downto 20) = "10101010000" then
                aluOp <= "1010";
              --EOR  
             elsif  instruction(31 downto 20) = "11101010000" then 
                aluOp <= "1011";
             else
                aluOp <= "1111";
             end if;      
         when R_Format_WB =>
             aluOp <= "1111";
             pcEn <= '1';
             instMemEn  <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '1';
             led <= "00110"; 
         when I_Format_EX =>
             pcEn <= '0';
             instMemEn  <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '0';
             led <= "00111";
             --Addi
            if instruction(31 downto 21) = "1001000100" then
                aluOp <= "0001";
            --subi
            elsif instruction(31 downto 21) = "1101000100" then
                aluOp <= "0011";
             else
                aluop <= "1111";
             end if;     
         when I_Format_WB =>
             aluOp <= "1111";
             pcEn <= '1';
             instMemEn  <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '1';
             led <= "01000";
         when Ls_EX =>
             pcEn <= '0';
             instMemEn  <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '0';
             led <= "01001";
              --Left
              if instruction (31 downto 20) = "11010011011" then
                aluOp <= "0100";
              --Right
              elsif instruction (31 downto 20) = "11010011011" then
                aluOp <= "0101";
              else
                aluOp <= "1111";
              end if; 
         when Ls_WB => 
             aluOp <= "1111";
             pcEn <= '1';
             instMemEn  <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '1';
             led <= "01010";
         when Cbz =>
             aluOp <= "1101";
             pcEn <= '1';
             instMemEn  <= '0';
             reg2Loc <= '1';
             unconditionalBranch <= '0';
             branch <= '1';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '0';
             led <= "01011";    
         when Cbnz =>
             aluOp <= "1101";
             pcEn <= '1';
             instMemEn  <= '0';
             reg2Loc <= '1';
             unconditionalBranch <= '0';
             branch <= '1';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '0';
             led <= "01100";    
         when Ldur_EX =>
             aluOp <= "0000";
             pcEn <= '0';
             instMemEn  <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '1';
             regWrite <= '0';
             led <= "01101"; 
         when Ldur_MA =>
             aluOp <= "0000";
             pcEn <= '0';
             instMemEn  <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '1';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '1';
             regWrite <= '0';
             led <= "01110";  
         when Ldur_WB =>  
             aluOp <= "1111";
             pcEn <= '1';
             instMemEn  <='0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0'; 
             memRead<= '0';
             memToReg <= '1';
             memWrite <= '0';
             aluSrc <= '0';
             regWrite <= '1';
             led <= "01111";  
         when Stur_EX =>
             aluOp <= "0000";
             instMemEn  <= '0';
             pcEn <= '0';
             reg2Loc <= '1';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '1';
             regWrite <= '0';
             led <= "10000";     
         when Stur_MA =>
             aluOp <= "0000";
             instMemEn  <= '0';
             pcEn <= '0';
             reg2Loc <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '0';
             memToReg <= '0';
             memWrite <= '1';
             aluSrc <= '1';
             regWrite <= '0';
             led <= "10001";     
         when Others =>
             aluOp <= "1111";
             pcEn <= '0';
             reg2Loc <= '0';
             instMemEn  <= '0';
             unconditionalBranch <= '0';
             branch <= '0';
             memRead<= '1';
             memToReg <= '0';
             memWrite <= '0';
             aluSrc <= '1';
             regWrite <= '0';
             led <= "11111";               
         end CASE;
end process;

decoder: process(instruction)
    begin
        Case state is
            when Fetch => 
                next_state <= Fetch2;
             when Fetch2 => 
               next_state <= Decode;
             when Decode =>
                if instruction(31 downto 26) = "000101" then
                          next_state <= Branch_EX;
                          --R-Format
                         elsif instruction(31 downto 21) = "10001011000" or instruction(31 downto 21) = "11001011000"
                             or instruction(31 downto 21) ="10011011000" or instruction(31 downto 21) = "10001010000"
                             or instruction(31 downto 21) = "10101010000" or instruction(31 downto 21) = "11101010000" then
                           next_state <= R_Format_EX;
                         --I-Format
                         elsif instruction (31 downto 22) = "1001000100" or instruction (31 downto 22) = "1101000100" then
                           next_state <= I_Format_Ex;
                         --Shifts
                         elsif instruction (31 downto 21) = "11010011011" or instruction (31 downto 21) = "11010011010" then
                         next_state <=Ls_EX;
                         --CBZ
                        elsif instruction (31 downto 24) = "10110100" then
                         next_state <= Cbz;
                        --CBNZ
                        elsif instruction (31 downto 24) = "10110101" then
                         next_state <= Cbnz;
                        --LDUR
                        elsif instruction (31 downto 21) = "11111000010" then
                          next_state <= Ldur_EX; 
                          --STUR
                        elsif instruction (31 downto 21) = "11111000000" then
                          next_state <= Stur_EX;  
                        else
                          next_state <= Idle;             
                        end if;
        
             when R_Format_Ex =>
               next_state <= R_Format_WB;
             when R_Format_WB =>
               next_state <= Fetch;
             when Branch_EX =>
               next_state <= Fetch;
             when Cbz =>
               next_state <= Fetch;
             when Cbnz =>
               next_state <= Fetch;
             when I_Format_Ex =>
               next_state <= I_Format_WB;
             when I_Format_WB =>
               next_state <= Fetch;
             when Ls_EX =>
               next_state <= Ls_WB;
             when Ls_WB =>
                next_state <= Fetch;
             when Ldur_EX =>
                next_state <= Ldur_MA;
             when Ldur_MA =>
                next_state <= Ldur_WB;
             when Ldur_WB =>
                next_state <= Fetch;
             when Stur_EX =>
                next_state <= Stur_MA;
             when Stur_MA =>
                next_state <= Fetch;
             when Idle =>
                next_state <= Fetch;
              when others =>
                next_state <= Idle;
            end case;
         end process;
end Behavioral;