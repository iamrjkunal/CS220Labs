
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name tb_adder -dir "/home/rjkunal/Desktop/CS220Labs/Lab1/Lab1_3/tb_adder/planAhead_run_5" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "tb_adder.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {tb_adder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top tb_adder $srcset
add_files [list {tb_adder.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
