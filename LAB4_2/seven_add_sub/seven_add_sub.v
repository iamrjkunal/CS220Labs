`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:20 02/14/2018 
// Design Name: 
// Module Name:    seven_add_sub 
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


module seven_add_sub(clk,rota,rotb,y,sum,o
    );
	
	input [3:0] y;
	input clk;
	input rota;
	input rotb;
	reg op;
	
	output [6:0] sum;
	wire [6:0] sum;
	output o;
	reg o;
	wire rote;
	wire [6:0] cout;
	
	reg [6:0] a;
	reg [6:0] b;
 	
	rot_shaft_api api(clk,rota,rotb,rote);
	
	reg [1:0] counter;
	
	initial begin
		counter <= 2'b00;
	end
	
	always @ (posedge rote) begin
		counter <= counter + 1;
		 if(counter == 2'b00) begin
			  a[3:0] <= y;
		 end
		 else if(counter == 2'b01) begin
			  a[6:4] <= y[2:0];
		 end
		 else if(counter == 2'b10) begin
			  b[3:0] <= y;
		 end
		 else if(counter == 2'b11) begin
			  b[6:4] <= y[2:0];
			  op <= y[3];
			  counter <= 2'b00;
		 end
	end
	
	adder b1(a[0],b[0],op,sum[0],cout[0],op);
	adder b2(a[1],b[1],cout[0],sum[1],cout[1],op);
	adder b3(a[2],b[2],cout[1],sum[2],cout[2],op);
	adder b4(a[3],b[3],cout[2],sum[3],cout[3],op);
	adder b5(a[4],b[4],cout[3],sum[4],cout[4],op);
	adder b6(a[5],b[5],cout[4],sum[5],cout[5],op);
	adder b7(a[6],b[6],cout[5],sum[6],cout[6],op);
	
	always @ (cout[5],cout[6]) begin
		if(cout[5]==cout[6]) begin
			o <= 1'b0;
		end
		else begin
			o <= 1'b1;
		end
	end

endmodule
