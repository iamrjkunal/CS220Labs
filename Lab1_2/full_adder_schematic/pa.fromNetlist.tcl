
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name full_adder_schematic -dir "/users/btech/rajkush/Desktop/CS220Labs/Lab1_2/full_adder_schematic/planAhead_run_4" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/users/btech/rajkush/Desktop/CS220Labs/Lab1_2/full_adder_schematic/fuller_adder_sch.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/users/btech/rajkush/Desktop/CS220Labs/Lab1_2/full_adder_schematic} }
set_property target_constrs_file "fuller_adder_sch.ucf" [current_fileset -constrset]
add_files [list {fuller_adder_sch.ucf}] -fileset [get_property constrset [current_run]]
link_design
