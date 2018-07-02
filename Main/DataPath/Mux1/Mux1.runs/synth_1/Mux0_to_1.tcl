# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/dkafley/Mux1/Mux1.cache/wt [current_project]
set_property parent.project_path C:/Users/dkafley/Mux1/Mux1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_vhdl -library xil_defaultlib C:/Users/dkafley/Mux1/Mux1.srcs/sources_1/new/Mux0_to_1.vhd
synth_design -top Mux0_to_1 -part xc7a100tcsg324-1
write_checkpoint -noxdef Mux0_to_1.dcp
catch { report_utilization -file Mux0_to_1_utilization_synth.rpt -pb Mux0_to_1_utilization_synth.pb }