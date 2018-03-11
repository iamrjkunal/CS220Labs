`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:03:12 03/11/2018 
// Design Name: 
// Module Name:    sq_grid 
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
module full_adder(a,b,cin,sum,cout,op);
	input a;
	input b;
	input op;
	input cin;
	
	output sum;
	wire sum;
	output cout;
	wire cout;
	wire temp;
	
	assign temp = b^op;
	assign sum=a^temp^cin;
	assign cout = (a & temp) | (temp & cin) | (cin & a);
	
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


module five_adder(a,b,led,op);
input [4:0]a;
input [4:0]b;
input op;

output reg [3:0] led;
wire [5:0]sum;
wire [3:0]carry;

full_adder FA20 (a[0],b[0],op,sum[0],carry[0],op);
full_adder FA21 (a[1],b[1],carry[0],sum[1],carry[1],op);
full_adder FA22 (a[2],b[2],carry[1],sum[2],carry[2],op);
full_adder FA23 (a[3],b[3],carry[2],sum[3],carry[3],op);
full_adder FA24 (a[4],b[4],carry[3],sum[4],sum[5],op);

always @(sum or op) begin
	if(sum[4] == 1'b0)begin
	led <= sum[3:0];
	end
	if(sum[4]== 1'b1)begin
		
			if (op ==0)begin
				led <= 4'b1111;
			end
			if (op ==1)begin
				led <= 4'b0000;
			end
		
		
	end
end
endmodule

module sq_grid(clk,ROT_A,ROT_B,move_ct,dir,ledx,ledy);
	input clk,ROT_A,ROT_B;
	input [1:0] move_ct; 
	input [1:0] dir;
	output reg [3:0] ledx;
	output reg [3:0] ledy;
	
	reg [4:0] x;
	reg [4:0] y;
	reg [4:0] add_step;
	reg flag_f;
	reg flag_r;
	wire rotation_event;
	reg prev_rotation_event;
	initial begin
		ledx <=0;
		ledy <=0;
		x <=0;
		y<=0; 
		prev_rotation_event <= 1;
	end
	detector D0(clk,ROT_A,ROT_B,rotation_event);
	always@(posedge clk) begin
	
		prev_rotation_event <= rotation_event;
		if(prev_rotation_event == 0 & rotation_event == 1) begin
			assign add_step = {3'b000,move_ct};
			if(dir == 2'b00) begin
				flag_f <= 1'b0; // east
				
			end
			
			if(dir == 2'b01) begin
				flag_r <= 1'b1; // west
				
			end
			
			if(dir == 2'b10) begin
				 flag_f <= 1'b0;// north
				
			end
			
			if(dir == 2'b11) begin
				flag_r <= 1'b1; // south
				
			end	
			
		end
	end
	five_adder xforward(x,add_step,ledx,flag_f);
	five_adder xreverse(x,add_step,ledx,flag_r);
	five_adder yreverse(y,add_step,ledy,flag_r); 
	five_adder yforward(y,add_step,ledy,flag_f);
	always @(ledx or ledy)begin
	x<= ledx;
	y<= ledy;
	end
endmodule