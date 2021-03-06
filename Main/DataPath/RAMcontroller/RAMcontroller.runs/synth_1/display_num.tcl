# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Justin/Desktop/DataPath/RAMcontroller/RAMcontroller.cache/wt [current_project]
set_property parent.project_path C:/Users/Justin/Desktop/DataPath/RAMcontroller/RAMcontroller.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_vhdl -library xil_defaultlib {
  C:/Users/Justin/Desktop/DataPath/RAMcontroller/RAMcontroller.srcs/sources_1/new/num_disp_SM.vhd
  C:/Users/Justin/Desktop/DataPath/RAMcontroller/RAMcontroller.srcs/sources_1/new/one_hot_dec_anode.vhd
  C:/Users/Justin/Desktop/DataPath/RAMcontroller/RAMcontroller.srcs/sources_1/new/hex_to_7_seg.vhd
  C:/Users/Justin/Desktop/DataPath/RAMcontroller/RAMcontroller.srcs/sources_1/new/count_eighthms.vhd
  C:/Users/Justin/Desktop/DataPath/RAMcontroller/RAMcontroller.srcs/sources_1/new/count_8.vhd
  C:/Users/Justin/Desktop/DataPath/RAMcontroller/RAMcontroller.srcs/sources_1/new/bus_mux_8to1.vhd
  C:/Users/Justin/Desktop/DataPath/RAMcontroller/RAMcontroller.srcs/sources_1/new/display_num.vhd
}
read_xdc C:/Users/Justin/Desktop/DataPath/Nexys4_Master.xdc
set_property used_in_implementation false [get_files C:/Users/Justin/Desktop/DataPath/Nexys4_Master.xdc]

synth_design -top display_num -part xc7a100tcsg324-1
write_checkpoint -noxdef display_num.dcp
catch { report_utilization -file display_num_utilization_synth.rpt -pb display_num_utilization_synth.pb }
