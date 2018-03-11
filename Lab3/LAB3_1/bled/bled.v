`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:02 02/14/2018 
// Design Name: 
// Module Name:    bled 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bled(clk,led);

input clk;
output led;
reg led;
reg [26:0]counter;

initial
	begin
		counter=27'b0;
	end

always@(posedge clk) begin
counter<=counter+1;
if (counter==25000000) begin
led<=0;
end
if (counter==50000000) begin
led<=1;
counter<=0;
end
end    
endmodule
