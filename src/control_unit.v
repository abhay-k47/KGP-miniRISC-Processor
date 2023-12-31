`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:33:29 11/09/2022 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(
    input [5:0] opcode,
    input [4:0] func,
    output reg [1:0] regDst,
    output reg regWrite,
    output reg memRead,
    output reg memWrite,
    output reg [1:0] memToReg,
    output reg ALUsrc,
    output reg [4:0] ALUop,
    output reg ALUsel,
    output reg isBranch,
    output reg branchAddrSel,
    output reg lblSel
);

    always @(opcode or func) begin
        case (opcode)
            6'b000000 : begin
                case (func)
                    5'b00000 : begin        // add
                        regDst = 2'b00;
                        regWrite = 1'b1;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 5'b00001;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end 
                    5'b00001 : begin        // comp
                        regDst = 2'b00;
                        regWrite = 1'b1;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 5'b00101;
                        ALUsel = 1'b1;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end
                    default: begin          
                        regDst = 2'b00;
                        regWrite = 1'b0;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b00;
                        ALUsrc = 1'b0;
                        ALUop = 5'b00000;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end
                endcase
            end
            6'b000001 : begin
                case (func)
                    5'b00000 : begin        // and
                        regDst = 2'b00;
                        regWrite = 1'b1;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 5'b00010;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end 
                    5'b00001 : begin        // xor
                        regDst = 2'b00;
                        regWrite = 1'b1;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 5'b00011;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end
                    default: begin          
                        regDst = 2'b00;
                        regWrite = 1'b0;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b00;
                        ALUsrc = 1'b0;
                        ALUop = 5'b00000;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end
                endcase
            end
            6'b000010 : begin
                case (func)
                    5'b00000 : begin        // shll
                        regDst = 2'b00;
                        regWrite = 1'b1;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b10;
                        ALUsrc = 1'b1;
                        ALUop = 5'b01010;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end 
                    5'b00001 : begin        // shrl
                        regDst = 2'b00;
                        regWrite = 1'b1;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b10;
                        ALUsrc = 1'b1;
                        ALUop = 5'b01000;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end
                    5'b00010 : begin        // shllv
                        regDst = 2'b00;
                        regWrite = 1'b1;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 5'b01010;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end 
                    5'b00011 : begin        // shrlv
                        regDst = 2'b00;
                        regWrite = 1'b1;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 5'b01000;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end
                    5'b00100 : begin        // shra
                        regDst = 2'b00;
                        regWrite = 1'b1;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b10;
                        ALUsrc = 1'b1;
                        ALUop = 5'b01001;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end 
                    5'b00101 : begin        // shrav
                        regDst = 2'b00;
                        regWrite = 1'b1;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 5'b01001;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end
                    default: begin          
                        regDst = 2'b00;
                        regWrite = 1'b0;
                        memRead = 1'b0;
                        memWrite = 1'b0;
                        memToReg = 2'b00;
                        ALUsrc = 1'b0;
                        ALUop = 5'b00000;
                        ALUsel = 1'b0;
                        isBranch = 1'b0;
                        branchAddrSel = 1'b0;
                        lblSel = 1'b0;
                    end
                endcase
            end
            6'b000011 : begin               // addi
                regDst = 2'b00;
                regWrite = 1'b1;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b10;
                ALUsrc = 1'b1;
                ALUop = 5'b00001;
                ALUsel = 1'b0;
                isBranch = 1'b0;
                branchAddrSel = 1'b0;
                lblSel = 1'b0;
            end
            6'b000100 : begin               // compi
                regDst = 2'b00;
                regWrite = 1'b1;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b10;
                ALUsrc = 1'b1;
                ALUop = 5'b00101;
                ALUsel = 1'b1;
                isBranch = 1'b0;
                branchAddrSel = 1'b0;
                lblSel = 1'b0;
            end
            6'b000101 : begin               // lw
                regDst = 2'b01;
                regWrite = 1'b1;
                memRead = 1'b1;
                memWrite = 1'b0;
                memToReg = 2'b01;
                ALUsrc = 1'b1;
                ALUop = 5'b10101;
                ALUsel = 1'b0;
                isBranch = 1'b0;
                branchAddrSel = 1'b0;
                lblSel = 1'b0;
            end
            6'b000110 : begin               // sw
                regDst = 2'b00;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b1;
                memToReg = 2'b00;
                ALUsrc = 1'b1;
                ALUop = 5'b10101;
                ALUsel = 1'b0;
                isBranch = 1'b0;
                branchAddrSel = 1'b0;
                lblSel = 1'b0;
            end
            6'b000111 : begin               // bltz
                regDst = 2'b00;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                ALUsel = 1'b0;
                isBranch = 1'b1;
                branchAddrSel = 1'b0;
                lblSel = 1'b1;
            end
            6'b001000 : begin               // bz
                regDst = 2'b00;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                ALUsel = 1'b0;
                isBranch = 1'b1;
                branchAddrSel = 1'b0;
                lblSel = 1'b1;
            end
            6'b001001 : begin               // bnz
                regDst = 2'b00;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                ALUsel = 1'b0;
                isBranch = 1'b1;
                branchAddrSel = 1'b0;
                lblSel = 1'b1;
            end
            6'b001010 : begin               // br
                regDst = 2'b00;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                ALUsel = 1'b0;
                isBranch = 1'b1;
                branchAddrSel = 1'b1;
                lblSel = 1'b0;
            end
            6'b001011 : begin               // b
                regDst = 2'b00;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                ALUsel = 1'b0;
                isBranch = 1'b1;
                branchAddrSel = 1'b0;
                lblSel = 1'b0;
            end
            6'b001100 : begin               // bl
                regDst = 2'b10;
                regWrite = 1'b1;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                ALUsel = 1'b0;
                isBranch = 1'b1;
                branchAddrSel = 1'b0;
                lblSel = 1'b0;
            end
            6'b001101 : begin               // bcy
                regDst = 2'b00;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                ALUsel = 1'b0;
                isBranch = 1'b1;
                branchAddrSel = 1'b0;
                lblSel = 1'b0;
            end
            6'b001110 : begin               // bncy
                regDst = 2'b00;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                ALUsel = 1'b0;
                isBranch = 1'b1;
                branchAddrSel = 1'b0;
                lblSel = 1'b0;
            end
            default: begin              
                regDst = 2'b00;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                memToReg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                ALUsel = 1'b0;
                isBranch = 1'b0;
                branchAddrSel = 1'b0;
                lblSel = 1'b0;
            end
        endcase
    end
endmodule