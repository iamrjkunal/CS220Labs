
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name seven_add_sub -dir "/users/btech/rajkush/Desktop/CS220Labs/rot_shaft/7addsub/seven_add_sub/planAhead_run_5" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "seven_add_sub.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {seven_add_sub.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top seven_add_sub $srcset
add_files [list {seven_add_sub.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
