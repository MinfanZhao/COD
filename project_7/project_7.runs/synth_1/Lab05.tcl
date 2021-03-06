# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a75tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/19079/project_7/project_7.cache/wt [current_project]
set_property parent.project_path C:/Users/19079/project_7/project_7.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/19079/project_7/project_7.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/19079/project_7/project_7.srcs/sources_1/new/fsm.v
  C:/Users/19079/project_7/project_7.srcs/sources_1/new/creINPUT.v
  C:/Users/19079/project_7/project_7.srcs/sources_1/new/Lab05.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/模数实验/CS_LAB/STEP资料/io_const.xdc
set_property used_in_implementation false [get_files E:/模数实验/CS_LAB/STEP资料/io_const.xdc]


synth_design -top Lab05 -part xc7a75tcsg324-1


write_checkpoint -force -noxdef Lab05.dcp

catch { report_utilization -file Lab05_utilization_synth.rpt -pb Lab05_utilization_synth.pb }
