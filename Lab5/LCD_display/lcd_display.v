`timescale 1ns / 1ps
`define Switch_time 1000000
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:37:44 03/07/2018 
// Design Name: 
// Module Name:    main 
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
module main(clk,LCD_RS,LCD_W,LCD_E,data
    );
input clk;
output LCD_RS;
output LCD_W;
output LCD_E;
output [3:0]data;
reg LCD_W;
reg LCD_E;
reg [3:0]data;
reg [19:0]counter;
reg active;
reg [9:0]step;
reg [3:0]Data_file[77:0];
reg LCD_RS;
reg [9:0]index;
initial begin
	index<=10'b0000000000;
	counter<=20'b00000000000000000000;
	active<=0;
	LCD_E<=0;
	LCD_W<=0;
	LCD_RS<=0;
	step<=10'b0000000000;
	//Data_file0[0]<=0;
	//
	//LCD_Init
	Data_file[0]<=4'b0011;
	Data_file[1]<=4'b0011;
	Data_file[2]<=4'b0011;
	Data_file[3]<=4'b0010;
	//Function_set
	Data_file[4]<=4'b0010;
	Data_file[5]<=4'b1000;
	//Entry_Mode_set
	Data_file[6]<=4'b0000;
	Data_file[7]<=4'b0110;
	//Display On/Off
	Data_file[8]<=4'b0000;
	Data_file[9]<=4'b1100;
	//Clear_Display
	Data_file[10]<=4'b0000;
	Data_file[11]<=4'b0001;
	//Displaying_Characters
	//W
	Data_file[12]<=4'b0101;
	Data_file[13]<=4'b0111;
	//E
	Data_file[14]<=4'b0100;
	Data_file[15]<=4'b0101;
	//L
	Data_file[16]<=4'b0100;
	Data_file[17]<=4'b1100;
	//C
	Data_file[18]<=4'b0100;
	Data_file[19]<=4'b0011;
	//O
	Data_file[20]<=4'b0100;
	Data_file[21]<=4'b1111;
	//M
	Data_file[22]<=4'b0100;
	Data_file[23]<=4'b1101;
	//E
	Data_file[24]<=4'b0100;
	Data_file[25]<=4'b0101;
	//Space
	Data_file[26]<=4'b1010;
	Data_file[27]<=4'b0000;
	//T
	Data_file[28]<=4'b0101;
	Data_file[29]<=4'b0100;
	//O
	Data_file[30]<=4'b0100;
	Data_file[31]<=4'b1111;
	//Space
	Data_file[32]<=4'b1010;
	Data_file[33]<=4'b0000;
	//C
	Data_file[34]<=4'b0100;
	Data_file[35]<=4'b0011;
	//S
	Data_file[36]<=4'b0101;
	Data_file[37]<=4'b0011;
	//E
	Data_file[38]<=4'b0100;
	Data_file[39]<=4'b0101;
	//,
	Data_file[40]<=4'b0010;
	Data_file[41]<=4'b1100;
	//Space
	Data_file[42]<=4'b1010;
	Data_file[43]<=4'b0000;
	//newline
	Data_file[44]<=4'b1100;
	Data_file[45]<=4'b0000;
	//I
	Data_file[46]<=4'b0100;
	Data_file[47]<=4'b1001;
	//I
	Data_file[48]<=4'b0100;
	Data_file[49]<=4'b1001;
	//T
	Data_file[50]<=4'b0101;
	Data_file[51]<=4'b0100;
	//K
	Data_file[52]<=4'b0100;
	Data_file[53]<=4'b0011;
	//A
	Data_file[54]<=4'b0100;
	Data_file[55]<=4'b0001;
	//N
	Data_file[56]<=4'b0100;
	Data_file[57]<=4'b1110;
	//P
	Data_file[58]<=4'b0101;
	Data_file[59]<=4'b0000;
	//U
	Data_file[60]<=4'b0101;
	Data_file[61]<=4'b0101;
	//R
	Data_file[62]<=4'b0101;
	Data_file[63]<=4'b0010;
	//Space
	Data_file[64]<=4'b1010;
	Data_file[65]<=4'b0000;
	//Space
	Data_file[66]<=4'b1010;
	Data_file[67]<=4'b0000;
	//Space
	Data_file[68]<=4'b1010;
	Data_file[69]<=4'b0000;
	//Space
	Data_file[70]<=4'b1010;
	Data_file[71]<=4'b0000;
	//Space
	Data_file[72]<=4'b1010;
	Data_file[73]<=4'b0000;
	//Space
	Data_file[74]<=4'b1010;
	Data_file[75]<=4'b0000;
	//Space
	Data_file[76]<=4'b1010;
	Data_file[77]<=4'b0000;
	//16
end


always @(posedge clk)begin
	if(counter==`Switch_time)begin
		counter<=20'b00000000000000000000;
		active<=1;
	end
	else begin
		active<=0;
		counter<=counter+1;
		//counter<=counter+20'b00000000000000000001;
	end
end
always @(posedge active)begin
	if(index<77)begin
		if(step==10'b0000000000)begin
		step<=10'b0000000001;
			LCD_E<=1'b0;
		end
		else if(step==10'b0000000001)
		begin
			step<=10'b0000000010;
			
			if(index==10'b0000101100)begin
				LCD_RS<=1'b0;
			end else if(index == 10'b0000101101) begin
				LCD_RS<=1'b0;
			end else if(index<12)begin
				LCD_RS<=1'b0;
			end else begin
				LCD_RS<=1'b1;
			end
			LCD_W<=1'b0;
			data<=Data_file[index];
			//data<=Data_file[index];
			index<=index+1;
		end
		else if(step==10'b0000000010)
		begin
			step<=10'b0000000000;
			LCD_E<=1'b1;
		end 
	end/* else begin
		index<=10'b0000000000;
	end*/
end
endmodule