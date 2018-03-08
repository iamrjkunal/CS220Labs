`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:19 02/14/2018 
// Design Name: 
// Module Name:    rotor 
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
module rotorx(clk,ROT_A,ROT_B,rot_event,rot_direction
    );
input clk,ROT_A,ROT_B;
output reg rot_event,rot_direction;
always @(posedge clk)begin
if(ROT_A==1 && ROT_B==1)begin
rot_event<=1;
end

if(ROT_A==0 && ROT_B==0)begin
rot_event<=0;
end

if(ROT_A==0 && ROT_B==1)begin
rot_direction<=1;
end

if(ROT_A==1 && ROT_B==0)begin
rot_direction<=0;
end
end
endmodule

module rot_encoder(clk,rot_event,rot_direction,led0, 
led1, led2, led3, led4, led5, led6, led7);
input clk,rot_event,rot_direction;
output reg led0,led1, led2, led3, led4, led5, led6, led7;
initial led0=1'b1;
initial led1=1'b0;
initial led2=1'b0;
initial led3=1'b0;
initial led4=1'b0;
initial led5=1'b0;
initial led6=1'b0;
initial led7=1'b0;
reg prev_rot_event;
initial begin
prev_rot_event<=1'b1;
end
always @(posedge clk)begin
prev_rot_event<=rot_event;
if(prev_rot_event==0 && rot_event==1)begin
	if(rot_direction==0)begin
	led0<=led1;
	led1<=led2;
	led2<=led3;
	led3<=led4;
	led4<=led5;
	led5<=led6;
	led6<=led7;
	led7<=led0;
	end
	
	if(rot_direction==1)begin
	led1<=led0;
	led2<=led1;
	led3<=led2;
	led4<=led3;
	led5<=led4;
	led6<=led5;
	led7<=led6;
	led0<=led7;
	end
end
end
endmodule

module rotor(clk,ROT_A,ROT_B,led0,
led1, led2, led3, led4, led5, led6, led7);
input clk,ROT_A,ROT_B;
output wire led0,led1, led2, led3, led4, led5, led6, led7;
wire rot_event,rot_direction;
rotorx f1(clk,ROT_A,ROT_B,rot_event,rot_direction);
rot_encoder f2(clk,rot_event,rot_direction,led0,led1, led2, led3, led4, led5, led6, led7);
endmodule











