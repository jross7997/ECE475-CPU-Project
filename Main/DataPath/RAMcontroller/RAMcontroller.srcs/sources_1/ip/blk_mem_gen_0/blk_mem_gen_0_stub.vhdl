-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
-- Date        : Wed Mar 30 09:29:18 2016
-- Host        : MARIANNEHROD1FE running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/hromalik/Documents/fall2015/Research
--               Paper/xapp1026/XAPP1026/KC705_AxiEth_150MHZ_64KB/HW/RAMcontroller/RAMcontroller.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_stub.vhdl}
-- Design      : blk_mem_gen_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blk_mem_gen_0 is
  Port ( 
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end blk_mem_gen_0;

architecture stub of blk_mem_gen_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,ena,wea[0:0],addra[3:0],dina[15:0],douta[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_0,Vivado 2015.3";
begin
end;
