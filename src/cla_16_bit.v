`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:32:06 11/09/2022 
// Design Name: 
// Module Name:    cla_16_bit 
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
module cla_16_bit(
    input [15:0] a,
    input [15:0] b,
    input c_in,
    output [15:0] s,
    output c_out,
    output p,
    output g
);

wire [3:0] P,G,C;

cla_4_bit cla0(.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .s(s[3:0]), .p(P[0]), .g(G[0]));
cla_4_bit cla1(.a(a[7:4]), .b(b[7:4]), .c_in(C[1]), .s(s[7:4]), .p(P[1]), .g(G[1]));
cla_4_bit cla2(.a(a[11:8]), .b(b[11:8]), .c_in(C[2]), .s(s[11:8]), .p(P[2]), .g(G[2]));
cla_4_bit cla3(.a(a[15:12]), .b(b[15:12]), .c_in(C[3]), .s(s[15:12]), .p(P[3]), .g(G[3]));

lookahead_carry_unit lcu(.P(P), .G(G), .c_in(c_in), .carry(C), .c_out(c_out), .P_out(p), .G_out(g));

endmodule
