# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Justin/Desktop/DataPath/mux2_to_1_64/mux2_to_1_64.cache/wt [current_project]
set_property parent.project_path C:/Users/Justin/Desktop/DataPath/mux2_to_1_64/mux2_to_1_64.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_vhdl -library xil_defaultlib C:/Users/Justin/Desktop/DataPath/mux2_to_1_64/mux2_to_1_64.srcs/sources_1/new/muz2_to_1_64.vhd
synth_design -top mux2_to_1_64 -part xc7a100tcsg324-1
write_checkpoint -noxdef mux2_to_1_64.dcp
catch { report_utilization -file mux2_to_1_64_utilization_synth.rpt -pb mux2_to_1_64_utilization_synth.pb }
