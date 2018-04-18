`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:17 04/11/2018 
// Design Name: 
// Module Name:    lab10 
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

module lab10( clk,led);
	 input clk;
	 reg [31:0] memory [0:13];
	 reg [7:0] register [0:31];
	 reg [7:0] data_mem [0:10];
	 reg [7:0] temp1;
	 reg [7:0] temp2;
	 reg [7:0] temp3;
	 reg [7:0] temp4;
	 
	 //reg [5:0] func;
	 output reg [7:0] led;
	 reg [2:0] state;
		integer k;
	 reg [7:0] pc;
	 reg [5:0] opcode;
	 reg [5:0] fun;
	 
	 initial begin
		pc= 8'b00001100;
		
		state=0;
		memory[0]<= 32'b001001 00000 00010 0000000000000000;
		memory[1]<= 32'b001001 00000 00011 0000000000000000;
		memory[2]<= 32'b000000 00001 00011 00100 00000 101010;
		memory[3]<= 32'b000100 00000 00100 0000000000001000;
		memory[4]<= 32'b001001 00000 00101 0000000000001010;
		memory[5]<= 32'b000100 00101 00011 0000000000000110;
		memory[6]<= 32'b100011 00011 00110 0000000000000000;
		memory[7]<= 32'b000000 00010 00010 00110 00000 100001;
		memory[8]<= 32'b001001 00011 00011 0000000000000001;
		memory[9]<= 32'b000000 00001 00011 00100 00000 101010;
		memory[10]<=32'b000101 00000 00100 1111111111111011;
		memory[11]<=32'b000000 11111 00000 00000 00000 001000;
		memory[12]<=32'b100011 00000 00001 0000000000001010;
		memory[13]<=32'b000011 00000 00000 0000000000000000;
		
		data_mem[0]<= 00000000;
		data_mem[1]<= 00000001;
		data_mem[2]<= 00000010;
		data_mem[3]<= 00000011;
		data_mem[4]<= 00000100;
		data_mem[5]<= 00000101;
		data_mem[6]<= 00000110;
		data_mem[7]<= 00000111;
		data_mem[8]<= 00001000;
		data_mem[9]<= 00001001;
		data_mem[10]<= 00001000;
		
		
	end
	initial begin
		for(k=0; k<32; k = k+1)begin
			register[k]=0;
		end
	end
	 reg [31:0] present;
	
	always@(posedge clk)begin
		if (state==0)begin
			present <= memory[pc];
			state <=1;
			pc <= pc +1;
		end
		else if (state ==1)begin
				opcode <= present[31:26]
				
				temp1 <= present[25:21]; // 
				temp2 <= present[20:16]; //
				temp4 <= present[7:0]; // intermediate value
				//state <= 2;
				
			
			
				//temp1 <= present[25:21]; // 
				//temp2 <= present[20:16]; //
				temp3 <= present[15:11];
				func <= present[5:0];
				state <=2;
			
		end
		else if ( state ==2)begin
			if(opcode == 6'b100011)begin // lw n
				register[10] <= data_mem[10];
				register[3] <= data_mem[temp1];
				register[temp2]<= register[temp1+temp4];
				if(pc ==12)begin 
					opcode == 6'b000011;
				end
				else begin
					state <=0;
				end
			end
			if(opcode == 6'b000011)begin
				pc <=0;
				state <=0;
			end
			if(opcode== 6'b001001) begin
				register[temp2]<= register[temp1] + temp4;
				if (pc <5)begin
					pc <= pc +1;
				end
				state <= 0;
			end
			if (opcode ==6'b000000 && fun == 6'b101010) begin
				if(register[temp2] < register[temp1])begin
					register[temp3]<= 8'b00000001;
				end
				else begin
					register[temp3]<= 8'b00000000;
				end
				state <=0;
			end
			if(opcode== 6'b000100)begin
				if(register[temp2] == register[temp1])begin
					if(temp4==8'b00001000)begin
						pc <=11;
						state <=0;
					end 
					else begin
						state <=0;
					end
				end
				else begin
					if(temp4==8'b00000110)begin
					state <=3;
					end
				end
				
			end
			if (opcode ==6'b000000 && fun == 6'b100001)begin
				register[temp3] = register[temp1]+register[temp2];
				state <=0;
			end
			if(opcode == 6'b000101)begin
				if( register[temp1]== register[temp2])begin
					 pc <=5;
					 state <=0;
				end
				state <=0;
			end
			
		end
		else if ( state ==3)begin
			led <= register[2];
		end
			
		
	end
	
endmodule

