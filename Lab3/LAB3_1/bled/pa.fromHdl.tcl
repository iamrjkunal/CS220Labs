
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name bled -dir "/users/btech/rajkush/Desktop/CS220Labs/LAB3_1/bled/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "bled.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {bled.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top bled $srcset
add_files [list {bled.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
