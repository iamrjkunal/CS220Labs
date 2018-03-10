`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:27 01/31/2018 
// Design Name: 
// Module Name:    seven_adder 
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
module full_adder(a, b, cin, sum, cout
);
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

module seven_adder(PB1,PB2,PB3,PB4,Y,O,carry);
input PB1;
input PB2;
input PB3;
input PB4;
input [3:0]Y;

output [6:0]O;
wire [6:0]O;
output carry;
wire carry;
reg [6:0] A;
reg [6:0] B;
wire [5:0] c;
always@(posedge PB1)begin
A[3:0] <= Y;
end

always@(posedge PB2)begin
A[6:4] <= Y[2:0];
end
always@(posedge PB3)begin
B[3:0] <= Y;
end

always@(posedge PB4)begin
B[6:4] <= Y[2:0];
end

full_adder F0(A[0],B[0],1'b0,O[0],c[0]);
full_adder F1(A[1],B[1],c[0],O[1],c[1]);
full_adder F2(A[2],B[2],c[1],O[2],c[2]);
full_adder F3(A[3],B[3],c[2],O[3],c[3]);
full_adder F4(A[4],B[4],c[3],O[4],c[4]);
full_adder F5(A[5],B[5],c[4],O[5],c[5]);
full_adder F6(A[6],B[6],c[5],O[6],carry);
endmodule
