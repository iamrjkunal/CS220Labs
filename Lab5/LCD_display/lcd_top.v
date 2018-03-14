`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:46:28 03/07/2018
// Design Name:   main
// Module Name:   /users/btech/akashks/LCD_display/lcd_top.v
// Project Name:  LCD_display
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lcd_top;

	// Inputs
	reg clk;

	// Outputs
	wire LCD_RS;
	wire LCD_W;
	wire LCD_E;
	wire [3:0] data;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.LCD_RS(LCD_RS), 
		.LCD_W(LCD_W), 
		.LCD_E(LCD_E), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		
		// Wait 100 ns for global reset to finish
		$finish;
        
		// Add stimulus here

	end
      
endmodule

