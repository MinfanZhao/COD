# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a75tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/19079/project_6/project_6.cache/wt [current_project]
set_property parent.project_path C:/Users/19079/project_6/project_6.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/19079/project_6/project_6.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/19079/project_6/project_6.srcs/sources_1/new/coder.v
  C:/Users/19079/project_6/project_6.srcs/sources_1/new/cnt.v
  C:/Users/19079/project_6/project_6.srcs/sources_1/new/top.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/模数实验/CS_LAB/STEP资料/io_const.xdc
set_property used_in_implementation false [get_files E:/模数实验/CS_LAB/STEP资料/io_const.xdc]


synth_design -top top -part xc7a75tcsg324-1


write_checkpoint -force -noxdef top.dcp

catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }
