# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Justin/Desktop/ControlUnit/ControlUnit/ControlUnit.cache/wt [current_project]
set_property parent.project_path C:/Users/Justin/Desktop/ControlUnit/ControlUnit/ControlUnit.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_vhdl -library xil_defaultlib C:/Users/Justin/Desktop/ControlUnit/ControlUnit/ControlUnit.srcs/sources_1/new/ControlUnit.vhd
synth_design -top ControlUnit -part xc7a100tcsg324-1
write_checkpoint -noxdef ControlUnit.dcp
catch { report_utilization -file ControlUnit_utilization_synth.rpt -pb ControlUnit_utilization_synth.pb }
