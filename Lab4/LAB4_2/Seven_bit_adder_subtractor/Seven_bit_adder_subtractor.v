`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:32 03/07/2018 
// Design Name: 
// Module Name:    Seven_bit_adder_subtractor 
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
module full_adder(a,b,cin,s,cout
    );
	input a,b,cin;
	output s,cout;
	wire s,cout;
	assign s = a^b^cin;
	assign cout = (a&b)|(b&cin)|(cin&a);
endmodule


module detector(clk,ROT_A,ROT_B,rotation_event
    );
	input clk,ROT_A,ROT_B;
	output rotation_event;
	reg rotation_event;
	always@(posedge clk) begin
		if(ROT_A==1'b1 & ROT_B==1'b1) begin
			rotation_event<=1'b1;
		end
		if(ROT_A==1'b0 & ROT_B==1'b0) begin
			rotation_event<=1'b0;
		end
	end
endmodule


module seven(A,B,op,Z,obit
    );
	input [6:0]A;
	input [6:0]B;
	input op;
	output Z;
	wire [6:0]Z;
	wire [6:0]carry;
	output obit;
	wire obit;
	full_adder FA0(A[0],op^B[0],op,Z[0],carry[0]);
	full_adder FA1(A[1],op^B[1],carry[0],Z[1],carry[1]);
	full_adder FA2(A[2],op^B[2],carry[1],Z[2],carry[2]);
	full_adder FA3(A[3],op^B[3],carry[2],Z[3],carry[3]);
	full_adder FA4(A[4],op^B[4],carry[3],Z[4],carry[4]);
	full_adder FA5(A[5],op^B[5],carry[4],Z[5],carry[5]);
	full_adder FA6(A[6],op^B[6],carry[5],Z[6],carry[6]);
	assign obit = carry[5]^carry[6];
endmodule


module Seven_bit_adder_subtractor(clk,ROT_A,ROT_B,Y,Z,obit
    );
	input clk,ROT_A,ROT_B;
	input [3:0]Y;
	output Z,obit;
	wire [6:0]Z;
	wire obit;
	reg [6:0]A;
	reg [6:0]B;
	reg op;
	wire rotation_event,st,ct;
	reg prev_rotation_event;
	initial prev_rotation_event <= 1;
	reg [2:0] counter;
	initial counter <= 0;
	detector D0(clk,ROT_A,ROT_B,rotation_event);
	always@(posedge clk) begin
	
		prev_rotation_event <= rotation_event;
		if(prev_rotation_event == 0 & rotation_event == 1) begin
			if(counter == 0) begin
				A[3:0] <= Y[3:0];
				counter <= counter+1;
			end
			if(counter==1) begin
				A[6:4] <= Y[2:0];
				counter <= counter+1;
			end
			if(counter==2) begin
				B[3:0] <= Y[3:0];
				counter <= counter+1;
			end
			if(counter==3) begin
				B[6:4] <= Y[2:0];
				counter <= counter+1;
			end
			if(counter==4) begin
				op <= Y[0];
				counter <= 0;
			end
		end
	end
	seven s7(A,B,op,Z,obit);
endmodule








