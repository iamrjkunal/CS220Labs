`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:32 02/14/2018 
// Design Name: 
// Module Name:    square_grid 
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
module adder(a,b,cin,sum,cout,op);
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

module rot_shaft_api(clk,rota,rotb,rot_event
    );
	 
	 input clk;
	 input rota;
	 input rotb;
	 
	 output rot_event;
	 reg rot_event;
	 
	always @ (posedge clk) begin
		if(rota==1'b1 && rotb==1'b1)
		begin
			rot_event = 1'b1;
		end
		
		if(rota==1'b0 && rotb==1'b0)
		begin
			rot_event = 1'b0;
		end
	end
	
endmodule

module add(a,b,op,led);

	input [4:0] a;
	input [4:0] b;
	input op;
	
	output led;
	reg [3:0] led;
	reg [4:0] sum;
	reg [4:0] cout;
	
	adder v1(a[0],b[0],op,sum[0],cout[0],op);
	adder v2(a[1],b[1],cout[0],sum[1],cout[1],op);
	adder v3(a[2],b[2],cout[1],sum[2],cout[2],op);
	adder v4(a[3],b[3],cout[2],sum[3],cout[3],op);
	adder v5(a[4],b[4],cout[3],sum[4],cout[4],op);
	
	always @ (a,b,op) begin 
		if(sum[4] == 1'b1) begin 
			sum <= 0;
		end
		if(cout[4]^cout[3]==0) begin
			sum <= 5'b01111;
		end
		led <= sum[3:0];
	end
	
	
endmodule

module square_grid(rota,rotb,move_ct,dir,led
    );
	 input rota ;
	 input rotb;
	 input [1:0] move_ct;
	 input [1:0] dir;
	 output [7:0] led;
	 wire rote;
	 reg [7:0] led;
	 
	 rot_shaft_api api(clk,rota,rotb,rote);
	
	 initial begin 
		led <= 0;
	 end
	 
	 reg [4:0] x;
	 reg [4:0] y;
	 reg [4:0] to_add;
	 
	 reg [3:0] o1;
	 reg [3:0] o2;
	 reg flag_o;
	 reg flag;
	 
	 always @ (posedge rote) begin
			x <= {0,led[3:0]};
			y <= {0,led[7:4]};
			to_add <= {3'b000,move_ct};
			if(dir == 2'b00) begin
				flag <= 1'b1; // east
				flag_o <= 1'b0;
			end
			
			if(dir == 2'b01) begin
				flag <= 1'b1; // west
				flag_o <= 1'b1;
			end
			
			if(dir == 2'b10) begin
				flag <= 1'b0; // north
				flag_o <= 1'b0;
			end
			
			if(dir == 2'b11) begin
				flag <= 1'b0; // south
				flag_o <= 1'b1;
			end
			
			add a1(x,to_add,flag_o,o1);
			add a4(y,to_add,flag_o,o2);
			
			if(flag==1'b1) begin
				led[3:0] <= o1;
			end
			else begin
				led[7:4] <= o2;
			end
	 end
	 //	add a1(x,to_add,0,led[3:0]);
	 
	 

endmodule
