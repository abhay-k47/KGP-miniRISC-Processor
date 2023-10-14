`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:03 11/09/2022 
// Design Name: 
// Module Name:    BranchControl 
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
module BranchControl(
    input [5:0] opcode,
    input sign,
    input carry,
    input zero,
    output reg out
);
    
    always @(*) begin
        case (opcode)
            6'b000111 : begin           // bltz
                if (sign && !zero)
                    out = 1;
                else 
                    out = 0;
            end
            6'b001000 : begin           // bz
                if (!sign && zero)
                    out = 1;
                else 
                    out = 0;
            end
            6'b001001 : begin           // bnz
                if (!zero)
                    out = 1;
                else 
                    out = 0;
            end
            6'b001010 : begin           // br
                    out = 1;
                end
            6'b001011 : begin           // b
                    out = 1;
                end
            6'b001100 : begin           // bl
                    out = 1;
                end
            6'b001101 : begin           // bcy
                if (carry)
                    out = 1;
                else 
                    out = 0;
            end
            6'b001110 : begin           // bncy
                if (!carry)
                    out = 1;
                else 
                    out = 0;
            end
            default : out = 0;
        endcase
    end

endmodule
