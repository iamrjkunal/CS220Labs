
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name lcd_driver -dir "/media/aakashl/32A9-172C/Labs/CS220/lab5/lcd_driver/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "LCD_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {lcd_driver.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top LCD_top $srcset
add_files [list {LCD_top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
