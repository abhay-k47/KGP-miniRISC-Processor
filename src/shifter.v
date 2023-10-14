`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:41:19 11/09/2022 
// Design Name: 
// Module Name:    shifter 
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
// Module to implement shift operations for the ALU
module shifter(
    input signed [31:0] in, 
    input [31:0] shamt, 
    input dir, 
    input aorl,
    output reg [31:0] out
);
    // aorl = 0 indicates logical shift and aorl = 1 indicates arithmetic shift
    // dir = 0 indicates right shift and dir = 1 indicates left shift
    always @(*) begin
        if (aorl) begin
            if (!dir) begin
                out = in >>> shamt;     // Arithmetic right shift
            end else begin
                out = in;
            end
        end else begin
            if (!dir) begin
                out = in >> shamt;      // Logical right shift
            end else begin
                out = in << shamt;      // Left shift
            end
        end
    end

endmodule
