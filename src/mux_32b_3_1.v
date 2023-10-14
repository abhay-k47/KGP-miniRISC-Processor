`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:38:59 11/09/2022 
// Design Name: 
// Module Name:    mux_32b_3_1 
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

module mux_32b_3_1 (
    input [31:0] in0, 
    input [31:0] in1, 
    input [31:0] in2, 
    input [1:0] sel, 
    output reg [31:0] out
);

    always @(*) begin
        case (sel)
            2'b00 : out = in0;
            2'b01 : out = in1;
            2'b10 : out = in2;
            default : out = in2;
        endcase
    end
    
endmodule
