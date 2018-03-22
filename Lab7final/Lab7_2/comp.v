`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:58 03/20/2018 
// Design Name: 
// Module Name:    comp 
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


module one_bit_comparator(prev_less, prev_greater, prev_eq, a, b,
                          this_less, this_greater, this_eq);

	input prev_less, prev_greater, prev_eq, a, b;
	output this_less, this_greater, this_eq;
	wire this_less, this_greater, this_eq;
	
	assign this_less = prev_less | (prev_eq & ~a & b);
	assign this_greater = prev_greater | (prev_eq & a & ~b);
	assign this_eq = prev_eq & ((~a & ~b) | (a & b));

endmodule

module comp( A,B,out
    );
	 input [15:0] A,B;
    output wire [15:0] out;
	 wire less, greater, equality;
	 
	 wire [14:0] less_array;
	 wire [14:0] greater_array;
	 wire [14:0] equality_array;
	 assign out[15:1] = 0;
	 
	 
	 
	 one_bit_comparator COMP15 (1'b0, 1'b0, 1'b1, A[15], B[15],
						less_array[14], greater_array[14], equality_array[14]);
	 one_bit_comparator COMP14 (less_array[14], greater_array[14], equality_array[14],
						A[14], B[14], less_array[13], greater_array[13], equality_array[13]);
	 one_bit_comparator COMP13 (less_array[13], greater_array[13], equality_array[13],
						A[13], B[13], less_array[12], greater_array[12], equality_array[12]);
	 one_bit_comparator COMP12 (less_array[12], greater_array[12], equality_array[12],
						A[12], B[12], less_array[11], greater_array[11], equality_array[11]);
	 one_bit_comparator COMP11 (less_array[11], greater_array[11], equality_array[11],
						A[11], B[11], less_array[10], greater_array[10], equality_array[10]);
	 one_bit_comparator COMP10 (less_array[10], greater_array[10], equality_array[10],
						A[10], B[10], less_array[9], greater_array[9], equality_array[9]);
	 one_bit_comparator COMP9 (less_array[9], greater_array[9], equality_array[9],
						A[9], B[9], less_array[8], greater_array[8], equality_array[8]);
	 one_bit_comparator COMP8 (less_array[8], greater_array[8], equality_array[8],
						A[8], B[8], less_array[7], greater_array[7], equality_array[7]);
	 one_bit_comparator COMP7 (less_array[7], greater_array[7], equality_array[7],
						A[7], B[7], less_array[6], greater_array[6], equality_array[6]);
	 one_bit_comparator COMP6 (less_array[6], greater_array[6], equality_array[6],
						A[6], B[6], less_array[5], greater_array[5], equality_array[5]);
	 one_bit_comparator COMP5 (less_array[5], greater_array[5], equality_array[5],
						A[5], B[5], less_array[4], greater_array[4], equality_array[4]);
	 one_bit_comparator COMP4 (less_array[4], greater_array[4], equality_array[4],
						A[4], B[4], less_array[3], greater_array[3], equality_array[3]);
	 one_bit_comparator COMP3 (less_array[3], greater_array[3], equality_array[3],
						A[3], B[3], less_array[2], greater_array[2], equality_array[2]);
	 one_bit_comparator COMP2 (less_array[2], greater_array[2], equality_array[2],
						A[2], B[2], less_array[1], greater_array[1], equality_array[1]);
	 one_bit_comparator COMP1 (less_array[1], greater_array[1], equality_array[1],
						A[1], B[1], less_array[0], greater_array[0], equality_array[0]);
	 one_bit_comparator COMP0 (less_array[0], greater_array[0], equality_array[0],
						A[0], B[0], less, greater, equality);	 
	 

    assign out[0]=less;

endmodule
