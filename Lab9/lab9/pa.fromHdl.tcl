
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name lab9 -dir "/home/rjkunal/devilzone_home/CS220Labs/Lab9/lab9/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "lab9.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {lab9.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top lab9 $srcset
add_files [list {lab9.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
