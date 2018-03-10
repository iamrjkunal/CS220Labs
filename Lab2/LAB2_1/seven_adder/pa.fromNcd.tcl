
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name seven_adder -dir "/users/btech/rajkush/Desktop/CS220Labs/LAB2_1/seven_adder/planAhead_run_5" -part xc3s500efg320-4
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "/users/btech/rajkush/Desktop/CS220Labs/LAB2_1/seven_adder/seven_adder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/users/btech/rajkush/Desktop/CS220Labs/LAB2_1/seven_adder} }
set_property target_constrs_file "seven_adder.ucf" [current_fileset -constrset]
add_files [list {seven_adder.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "/users/btech/rajkush/Desktop/CS220Labs/LAB2_1/seven_adder/seven_adder.ncd"
if {[catch {read_twx -name results_1 -file "/users/btech/rajkush/Desktop/CS220Labs/LAB2_1/seven_adder/seven_adder.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"/users/btech/rajkush/Desktop/CS220Labs/LAB2_1/seven_adder/seven_adder.twx\": $eInfo"
}
