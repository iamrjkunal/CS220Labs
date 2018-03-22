`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:48:12 03/20/2018 
// Design Name: 
// Module Name:    right_shift 
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

module right_shift(clk,A,shift,R
    );
        input clk; 
        input [15:0]A;
        input [3:0]shift;
        output R;
        reg [15:0]R;
        always@(posedge clk) begin
                if(shift==0) begin
                        R<=A;
                end
                else if(shift==1) begin
                        R[14:0]<=A[15:1];
                        R[15]<=A[15];
                end
                else if(shift==2) begin
                        R[13:0]<=A[15:2];
                        R[15:14]<= {2{A[15]}};
                end
                else if(shift==3) begin
                        R[12:0]<=A[15:3];
                        R[15:13]<={3{A[15]}};
                end
                else if(shift==4) begin
                        R[11:0]<=A[15:4];
                        R[15:12]<={4{A[15]}};
                end
                else if(shift==5) begin
                        R[10:0]<=A[15:5];
                        R[15:11]<={5{A[15]}};
                end
                else if(shift==6) begin
                        R[9:0]<=A[15:6];
                        R[15:10]<={6{A[15]}};
                end
                else if(shift==7) begin
                        R[8:0]<=A[15:7];
                        R[15:9]<={7{A[15]}};
                end
                else if(shift==8) begin
                        R[7:0]<=A[15:8];
                        R[15:8]<={2{A[15]}};
                end
                else if(shift==9) begin
                        R[6:0]<=A[15:9];
                        R[15:7]<={8{A[15]}};
                end
                else if(shift==10) begin
                        R[5:0]<=A[15:10];
                        R[15:6]<={9{A[15]}};
                end
                else if(shift==11) begin
                        R[4:0]<=A[15:11];
                        R[15:5]<={10{A[15]}};
                end
                else if(shift==12) begin
                        R[3:0]<=A[15:12];
                        R[15:4]<={11{A[15]}};
                end
                else if(shift==13) begin
                        R[2:0]<=A[15:13];
                        R[15:3]<={12{A[15]}};
                end
                else if(shift==14) begin
                        R[1:0]<=A[15:14];
                        R[15:2]<={13{A[15]}};
                end
                else if(shift==15) begin
                        R[0]<=A[15];
                        R[15:1]<={14{A[15]}};
                end
        end
endmodule

