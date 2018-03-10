`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:43 02/07/2018 
// Design Name: 
// Module Name:    COM 
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
module single_bit(a,b,l1,g1,e1,l2,g2,e2);

input a;
input b;
input l1;
input g1;
input e1;
output l2;
wire l2;
output g2;
wire g2;
output e2;
wire e2;

assign g2= g1|((~l1 & b & ~a) & e1 );
assign l2= l1|((~g1 & ~b & a) & e1 );
assign e2= e1 & ((a & b )|(~a & ~b));
endmodule




module COM(PB1,PB2,PB3,PB4,s,lx,gx,ex);

input PB1;
input PB2;
input PB3;
input PB4;
input [3:0]s;
reg [7:0]a;
reg [7:0]b;
output wire lx;
wire [6:0]l;
output wire gx;
wire [6:0]g;
output wire ex;
wire [6:0]e;


always @(posedge PB1) begin
	a[3:0] <= s[3:0];
end
always @(posedge PB2) begin
	a[7:4] <= s[3:0];
end
always @(posedge PB3) begin
	b[3:0] <=s[3:0];
end
always @(posedge PB4) begin
	b[7:4] <= s[3:0];
end


single_bit SB0 (a[0],b[0],1'b0,1'b0,1'b1,l[0],g[0],e[0]);
single_bit SB1 (a[1],b[1],l[0],g[0],e[0],l[1],g[1],e[1]);
single_bit SB2 (a[2],b[2],l[1],g[1],e[1],l[2],g[2],e[2]);
single_bit SB3 (a[3],b[3],l[2],g[2],e[2],l[3],g[3],e[3]);
single_bit SB4 (a[4],b[4],l[3],g[3],e[3],l[4],g[4],e[4]);
single_bit SB5 (a[5],b[5],l[4],g[4],e[4],l[5],g[5],e[5]);
single_bit SB6 (a[6],b[6],l[5],g[5],e[5],l[6],g[6],e[6]);
single_bit SB7 (a[7],b[7],l[6],g[6],e[6],lx,gx,ex);

endmodule 