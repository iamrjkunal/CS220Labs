`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:04 02/14/2018 
// Design Name: 
// Module Name:    five_four_bit_adder 
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
module full_adder(a,b,cin,sum,cout);
	input a;
	input b;
	input cin;
	output sum;
	wire sum;
	output cout;
	wire cout;
	assign sum = a^b^cin;
	assign cout = (a & b) | (b & cin) | (cin & a);
endmodule

module four_adder(a,b,sum);
input [3:0]a;
input [3:0]b;
output [4:0]sum;
wire [4:0]sum;
wire [2:0]carry;

full_adder FA0 (a[0],b[0],1'b0,sum[0],carry[0]);
full_adder FA1 (a[1],b[1],carry[0],sum[1],carry[1]);
full_adder FA2 (a[2],b[2],carry[1],sum[2],carry[2]);
full_adder FA3 (a[3],b[3],carry[2],sum[3],sum[4]);
endmodule

module five_adder(a,b,sum);
input [4:0]a;
input [4:0]b;
output [5:0]sum;
wire [5:0]sum;
wire [3:0]carry;

full_adder FA20 (a[0],b[0],1'b0,sum[0],carry[0]);
full_adder FA21 (a[1],b[1],carry[0],sum[1],carry[1]);
full_adder FA22 (a[2],b[2],carry[1],sum[2],carry[2]);
full_adder FA23 (a[3],b[3],carry[2],sum[3],carry[3]);
full_adder FA24 (a[4],b[4],carry[3],sum[4],sum[5]);
endmodule


module six_adder(a,b,sum);
input [5:0]a;
input [5:0]b;
output [6:0]sum;
wire [6:0]sum;
wire [4:0]carry;

full_adder FA10 (a[0],b[0],1'b0,sum[0],carry[0]);
full_adder FA11 (a[1],b[1],carry[0],sum[1],carry[1]);
full_adder FA12 (a[2],b[2],carry[1],sum[2],carry[2]);
full_adder FA13 (a[3],b[3],carry[2],sum[3],carry[3]);
full_adder FA14 (a[4],b[4],carry[3],sum[4],carry[4]);
full_adder FA15 (a[5],b[5],carry[4],sum[5],sum[6]);
endmodule

module five_four_bit_adder(PB1,PB2,PB3,PB4,PB5,s,sum);
input PB1;
input PB2;
input PB3;
input PB4;
input PB5;
input [3:0]s;
reg [3:0]a;
reg [3:0]b;
reg [3:0]c;
reg [3:0]d;
reg [5:0]e;
wire [4:0]sum1;
wire [4:0]sum2;
wire [5:0]sum3;
output [6:0]sum;
wire [6:0]sum;
always @(posedge PB1) begin
	a[3:0] <= s[3:0];
end
always @(posedge PB2) begin
	b[3:0] <= s[3:0];
end
always @(posedge PB3) begin
	c[3:0] <=s[3:0];
end
always @(posedge PB4) begin
	d[3:0] <= s[3:0];
end
always @(posedge PB5) begin
	e[3:0] <= s[3:0];
	e[5:3] <= 2'b00;
end

four_adder F1 (a,b,sum1);
four_adder F2 (c,d,sum2);
five_adder F3 (sum1,sum2,sum3);
six_adder F4 (e,sum3,sum);

endmodule
