
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name rotor -dir "/users/btech/rajkush/Desktop/CS220Labs/LAB4_1/rotor/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "rotor.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {rotor.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top rotor $srcset
add_files [list {rotor.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
