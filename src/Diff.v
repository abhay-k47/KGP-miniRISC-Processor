`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:25:39 11/09/2022 
// Design Name: 
// Module Name:    Diff 
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
module Diff(
    input [31:0] a,
    input [31:0] b,
    output [31:0] out
    );
	 wire [31:0] c, d, in;
	 assign c = a^b;
	 assign in = c&d;
	 adder_32_bit NOT(.a(32'd0), .b(~c), .c_in(1'b1), .sum(d), .c_out());
	 Decoder D(.in(in), .out(out));
endmodule
