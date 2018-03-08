
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name sq_grid -dir "/media/akashish/UBUNTU 17_1/CS220LAB4/rot_shaft/square_grid/sq_grid/planAhead_run_4" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/media/akashish/UBUNTU 17_1/CS220LAB4/rot_shaft/square_grid/sq_grid/square_grid.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/media/akashish/UBUNTU 17_1/CS220LAB4/rot_shaft/square_grid/sq_grid} }
set_property target_constrs_file "square_grid.ucf" [current_fileset -constrset]
add_files [list {square_grid.ucf}] -fileset [get_property constrset [current_run]]
link_design
