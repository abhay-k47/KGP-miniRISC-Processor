`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:30:41 11/09/2022 
// Design Name: 
// Module Name:    adder_32_bit 
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
module adder_32_bit (
    input [31:0] a,
    input [31:0] b,
    input c_in,
    output [31:0] sum,
    output c_out
);

    wire c;          // Temp wire to be used as a ripple carry for CLA2
    
    cla_16_bit cla0 (.a(a[15:0]), .b(b[15:0]), .c_in(c_in), .s(sum[15:0]), .c_out(c), .p(), .g());
    cla_16_bit cla1 (.a(a[31:16]), .b(b[31:16]), .c_in(c), .s(sum[31:16]), .c_out(c_out), .p(), .g());
endmodule
