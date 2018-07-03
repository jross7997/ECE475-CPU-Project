----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2016 11:20:15 AM
-- Design Name: 
-- Module Name: num_disp_SM - Behavioral
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

entity num_disp_SM is
  Port (clk : in std_logic;
        reset: in std_logic;
        blank_in : in std_logic;
        equal_eighth_ms: in std_logic;
        en_8count : out std_logic;
        clr_8count : out std_logic;
        en_Eighth_count : out std_logic;
        clr_Eighth_count : out std_logic;
        blank_out_n: out std_logic        -- disable anode mux
        
         );
end num_disp_SM;

architecture Behavioral of num_disp_SM is
TYPE type_state IS (Initialize, normalRun, EightMsUp);
attribute enum_encoding :string;
attribute enum_encoding of type_state : type is "one-hot";
SIGNAL next_state : type_state;
SIGNAL curr_state : type_state;
begin
    clkprocess : process(CLK, CURR_STATE, RESET)
    BEGIN
        IF RESET = '1' THEN 
            NEXT_STATE <= Initialize;
        ELSIF CLK'EVENT AND CLK = '1' THEN
            NEXT_STATE <= CURR_STATE;
        END IF;
    END PROCESS clkprocess;

    NEXTSTATELOGIC : PROCESS(NEXT_STATE, blank_in, equal_eighth_ms)
    BEGIN
       CASE NEXT_STATE IS 
        WHEN Initialize =>
            IF ( NOT(blank_in = '1')) THEN
                CURR_STATE <= normalRun;
            ELSE
                CURR_STATE <= Initialize;
            END IF;
        WHEN normalRun =>
            IF ((blank_in = '1')) THEN
                CURR_STATE <= Initialize;
            ELSIF ((blank_in = '0') and (equal_eighth_ms = '1')) then
                CURR_STATE <= EightMsUp;
            ELSE
                CURR_STATE <= normalRun;
            END IF;
        WHEN EightMsUp =>
            IF ((blank_in = '1')) THEN
               CURR_STATE <= Initialize;
            ELSE
                CURR_STATE <= normalRun;
            END IF;
         WHEN OTHERS =>
            CURR_STATE <= Initialize;
         END CASE;
     END PROCESS NEXTSTATELOGIC;
     
     OUTPUTLOGIC: PROCESS(NEXT_STATE)
          BEGIN
             CASE NEXT_STATE IS
                 WHEN Initialize =>
                      en_8count <= '0';
                      clr_8count <= '1';
                      en_Eighth_count <= '0';
                      clr_Eighth_count <= '1';
                      blank_out_n <= '0'; -- actively blanking
                 WHEN normalRun =>
                       en_8count <= '0';
                       clr_8count <= '0';
                       en_Eighth_count <= '1';
                       clr_Eighth_count <= '0';
                       blank_out_n <= '1';       
                  WHEN EightMsUp =>
                       en_8count <= '1';
                       clr_8count <= '0';
                       en_Eighth_count <= '0';
                       clr_Eighth_count <= '1';
                       blank_out_n <= '1';           
                  WHEN OTHERS =>
                        en_8count <= '0';
                        clr_8count <= '1';
                        en_Eighth_count <= '0';
                        clr_Eighth_count <= '1';
                        blank_out_n <= '0'; -- actively blanking
             END CASE;
             END PROCESS  OUTPUTLOGIC;   
end Behavioral;



