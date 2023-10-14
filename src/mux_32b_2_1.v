`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:38:21 11/09/2022 
// Design Name: 
// Module Name:    mux_32b_2_1 
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

module mux_32b_2_1 (
    input [31:0] in0, 
    input [31:0] in1, 
    input sel, 
    output [31:0] out
);
    
    assign out = (sel) ? in1 : in0;

endmodule
