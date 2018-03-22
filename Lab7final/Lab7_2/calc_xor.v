`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:55:17 03/21/2018 
// Design Name: 
// Module Name:    calc_xor 
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
module calc_xor(data1,data2,out
    );
	 input [15:0] data1,data2;
	 output wire [15:0]out;
	 assign out[0] = data1[0]^data2[0];
	 assign out[1] = data1[1]^data2[1];
	 assign out[2] = data1[2]^data2[2];
	 assign out[3] = data1[3]^data2[3];
	 assign out[4] = data1[4]^data2[4];
	 assign out[5] = data1[5]^data2[5];
	 assign out[6] = data1[6]^data2[6];
	 assign out[7] = data1[7]^data2[7];
	 assign out[8] = data1[8]^data2[8];
	 assign out[9] = data1[9]^data2[9];
	 assign out[10] = data1[10]^data2[10];
	 assign out[11] = data1[11]^data2[11];
	 assign out[12] = data1[12]^data2[12];
	 assign out[13] = data1[13]^data2[13];
	 assign out[14] = data1[14]^data2[14];
	 assign out[15] = data1[15]^data2[15];




endmodule
