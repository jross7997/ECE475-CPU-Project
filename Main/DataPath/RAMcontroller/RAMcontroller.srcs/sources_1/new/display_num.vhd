library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display_num is
    Port ( clk : in STD_LOGIC;
           blank_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           Hex0In : in STD_LOGIC_VECTOR(3 downto 0);
           Hex1In : in STD_LOGIC_VECTOR(3 downto 0);
           Hex2In : in STD_LOGIC_VECTOR(3 downto 0);
           Hex3In : in STD_LOGIC_VECTOR(3 downto 0);
           Hex4In : in STD_LOGIC_VECTOR(3 downto 0);
           Hex5In : in STD_LOGIC_VECTOR(3 downto 0);
           Hex6In : in STD_LOGIC_VECTOR(3 downto 0);
           Hex7In : in STD_LOGIC_VECTOR(3 downto 0);
           seg : out STD_LOGIC_vector(6 downto 0);
           an: out STD_LOGIC_vector(7 downto 0));
end display_num;

architecture Behavioral of display_num is
component num_disp_SM is
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
end component;

component count_8 is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           count_out : out STD_LOGIC_vector(2 downto 0));
end component;


component bus_mux_8to1 is
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
end component;

component one_hot_dec_anode is
  Port (SelIn: in std_logic_vector(2 downto 0);
        blank : in std_logic;
        An: out std_logic_vector(7 downto 0)
        
   );
end component;


component hex_to_7_seg is
  Port (HexIn: in std_logic_vector(3 downto 0);
        Cath: out std_logic_vector(6 downto 0)
        
   );
end component;


component count_eighthms is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           eighth_ms : out STD_LOGIC);
end component;


signal   equal_eighth_ms_Sig: std_logic;
signal   en_8count_Sig :  std_logic;
signal   clr_8count_Sig :  std_logic;
signal   en_Eighth_count_Sig :  std_logic;
signal   clr_Eighth_count_Sig :  std_logic;
signal   blank_out_n_Sig:  std_logic;
signal   SelIn_Sig:  std_logic_vector(2 downto 0);    

signal  Hex0_Sig: std_logic_vector(3 downto 0);
signal  Hex1_Sig:  std_logic_vector(3 downto 0);
signal  Hex2_Sig:  std_logic_vector(3 downto 0);
signal  Hex3_Sig:  std_logic_vector(3 downto 0);
signal  Hex4_Sig:  std_logic_vector(3 downto 0);
signal  Hex5_Sig:  std_logic_vector(3 downto 0);
signal  Hex6_Sig:  std_logic_vector(3 downto 0);
signal  Hex7_Sig:  std_logic_vector(3 downto 0);
signal  HexOut_sig:  std_logic_vector(3 downto 0) ;
signal segments :  STD_LOGIC_vector(6 downto 0);

begin
Hex0_Sig <= Hex0In;
Hex1_Sig <= Hex1In;
Hex2_Sig <= Hex2In;
Hex3_Sig <= Hex3In;
Hex4_Sig <= Hex4In;
Hex5_Sig <= Hex5In;
Hex6_Sig <= Hex6In;
Hex7_Sig <= Hex7In;
seg(0) <= segments(6);
seg(1) <= segments(5);
seg(2) <= segments(4);
seg(3) <= segments(3);
seg(4) <= segments(2);
seg(5) <= segments(1);
seg(6) <= segments(0);
u1 : count_eighthms PORT MAP(
                           clk => clk,
                           en => en_Eighth_count_Sig,
                           clr => clr_Eighth_count_Sig,
                        eighth_ms =>  equal_eighth_ms_Sig);
                        
 u2 : count_8 PORT MAP(
                           clk => clk,
                           en => en_8count_Sig,
                           clr => clr_8count_Sig,
                           count_out =>  SelIn_Sig);
                           
 u3: bus_mux_8to1 PORT MAP(
                              Hex0 => Hex0_Sig,
                              Hex1 => Hex1_Sig,
                              Hex2 => Hex2_Sig,
                              Hex3 => Hex3_Sig,
                              Hex4 => Hex4_Sig,
                              Hex5 => Hex5_Sig,
                              Hex6 => Hex6_Sig,
                              Hex7 => Hex7_Sig,
                              sel_in => SelIn_Sig ,
                              HexOut => HexOut_sig 
                              );
 u4:  hex_to_7_seg PORT MAP(
                               HexIn => HexOut_sig,
                               Cath => segments     
                                 );
                                 
 u5: one_hot_dec_anode PORT MAP(
                                 SelIn  => SelIn_Sig ,
                                 blank => not(blank_out_n_Sig),
                                 An => an         
                                 );

 u6: num_disp_SM PORT MAP(
                            clk => not(clk),
                            reset=> reset,
                            blank_in => blank_in,
                            equal_eighth_ms => equal_eighth_ms_Sig,
                            en_8count => en_8count_Sig,
                            clr_8count => clr_8count_Sig,
                            en_Eighth_count => en_Eighth_count_Sig,
                            clr_Eighth_count => clr_Eighth_count_Sig,
                            blank_out_n  => blank_out_n_Sig
        );                            
end Behavioral;
