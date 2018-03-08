
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name sq_grid -dir "/users/btech/rajkush/Desktop/CS220Labs/rot_shaft/square_grid/sq_grid/planAhead_run_4" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "square_grid.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {square_grid.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top square_grid $srcset
add_files [list {square_grid.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
