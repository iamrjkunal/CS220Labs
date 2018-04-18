`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:11 03/28/2018 
// Design Name: 
// Module Name:    lab8 
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
module xor_data(data1,data2,out
    );
	 input [7:0] data1,data2;
	 output wire [7:0]out;
	 assign out[0] = data1[0]^data2[0];
	 assign out[1] = data1[1]^data2[1];
	 assign out[2] = data1[2]^data2[2];
	 assign out[3] = data1[3]^data2[3];
	 assign out[4] = data1[4]^data2[4];
	 assign out[5] = data1[5]^data2[5];
	 assign out[6] = data1[6]^data2[6];
	 assign out[7] = data1[7]^data2[7];
	 

endmodule
module decode (in, out);
	input [2:0] in;
	output wire [7:0] out;
	
	assign out[7]= (~in[2])&&(~in[1])&&(~in[0]);
	assign out[6]= (~in[2])&&(~in[1])&&(in[0]);
	assign out[5]= (~in[2])&&(in[1])&&(~in[0]);
	assign out[4]= (~in[2])&&(in[1])&&(in[0]);
	assign out[3]= (in[2])&&(~in[1])&&(~in[0]);
	assign out[2]= (in[2])&&(~in[1])&&(in[0]);
	assign out[1]= (in[2])&&(in[1])&&(~in[0]);
	assign out[0]= (in[2])&&(in[1])&&(in[0]);
	
	

endmodule

module lab8( clk,push,led
    );
	input clk;
	input push;
	output reg [7:0] led;
	wire parity;
	reg flag;
	reg [7:0] memory [0:31];
	reg [2:0] counter;
	reg [7:0] temp;
	wire [7:0] decoded_value;
	initial begin
	counter =0;
	flag=0;
	memory[0]= 8'b00000011;	//3
	memory[1]= 8'b00000100;//4
	memory[2]= 8'b00000111; //7
	memory[3]= 8'b00000010; //2
	memory[4]= 8'b00000011; //3
	memory[5]= 8'b00000101; //5
	memory[6]= 8'b00000000; //0
	memory[7]= 8'b00000010; //2
	
	end
	
	
	
	always@(posedge clk)begin
	 
	 if(counter == 0)begin
		temp = memory[0];
		memory[0]= decoded_value;
		counter= 1;
	 end
	 if(counter == 1)begin
		temp = memory[1];
		memory[1]= decoded_value;
		counter= 2;
	 end
	 if(counter == 2)begin
		temp = memory[2];
		memory[2]= decoded_value;
		counter=3;
	 end
	 if(counter == 3)begin
		temp = memory[3];
		memory[3]= decoded_value;
		counter=4;
	 end
	 if(counter == 4)begin
		temp = memory[4];
		memory[4]= decoded_value;
		counter=5;
	 end
	 if(counter == 5)begin
		temp = memory[5];
		memory[5]= decoded_value;
		counter=6;
	 end
	 if(counter == 6)begin
		temp = memory[6];
		memory[6]= decoded_value;
		counter=7;
	 end
	 if(counter == 7)begin
		temp = memory[7];
		memory[7]= decoded_value;
	 end
	 
	 
	end
	wire [7:0] temp3 [0:6];
	decode d(temp,decoded_value);
	xor_data d1(memory[0],memory[1],temp3[0]);
	xor_data d2(memory[2],memory[3],temp3[1]);
	xor_data d3(memory[4],memory[5],temp3[2]);
	xor_data d4(memory[6],memory[7],temp3[3]);
	xor_data d5(memory[8],memory[9],temp3[4]);
	xor_data d6(memory[10],memory[11],temp3[5]);
	xor_data d7(memory[12],memory[13],temp3[6]);
	
	wire [7:0] temp2;
	assign temp2 = temp3[6];
	assign parity = temp2[0]^temp2[1]^temp2[2]^temp2[3]^temp2[4]^temp2[5]^temp2[6]^temp2[7];
	
	always@(posedge push)begin
		if(flag ==0)begin
		flag <=1;
		led<= temp3[6];
		end
		if(flag ==1)begin
		flag <=0;
		led [7:1] <=0;
		led[0] <= parity;
		end
		
	end
	
	endmodule
