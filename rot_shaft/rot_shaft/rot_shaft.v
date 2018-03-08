`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:21 02/14/2018 
// Design Name: 
// Module Name:    rot_shaft 
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

module rip(clk, led,rote,rotd
    );
	reg prev_rote;
	output [7:0] led;
	reg [7:0] led;
	input clk;
	input rote;
	inout rotd;
	
	initial
	begin
		led[0] <= 1;
		led[7:1] <= 0;
		prev_rote <= 1;
	end
	
	always @ (posedge clk)
	begin
		prev_rote <= rote;
		if(prev_rote==0 && rote==1)
		begin
			if(rotd==1) begin
				led[1] <= led[0];
				led[2] <= led[1];
				led[3] <= led[2];
				led[4] <= led[3];
				led[5] <= led[4];
				led[6] <= led[5];
				led[7] <= led[6];
				led[0] <= led[7];
			end
			else begin
				led[0] <= led[1];
				led[1] <= led[2];
				led[2] <= led[3];
				led[3] <= led[4];
				led[4] <= led[5];
				led[5] <= led[6];
				led[6] <= led[7];
				led[7] <= led[0];
			end
		end
	end
	
endmodule


module rot_shaft_api(clk,rota,rotb,rot_event,rot_dir
    );
	 
	 input clk;
	 input rota;
	 input rotb;
	 
	 output rot_event;
	 reg rot_event;
	 output rot_dir;
	 reg rot_dir;
	 
	always @ (posedge clk) begin
		if(rota==1'b1 && rotb==1'b1)
		begin
			rot_event = 1'b1;
		end
		
		if(rota==1'b0 && rotb==1'b0)
		begin
			rot_event = 1'b0;
		end
		
		if(rota==1'b0 && rotb==1'b1)
		begin
			rot_dir = 1'b1;
		end
		
		if(rota==1'b1 && rotb==1'b0)
		begin
			rot_dir = 1'b0;
		end
	end
	
endmodule


module rot_shaft(clk,rota,rotb,led
    );
	 
	 input clk;
	 input rota;
	 input rotb;
	 
	 output [7:0] led;
	 wire [7:0] led;
	 wire rote;
	 wire rotd;
	 
	 rot_shaft_api qw(clk,rota,rotb,rote,rotd);
	 rip r(clk,led,rote,rotd);
	 
endmodule


