`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:27:04 11/09/2022 
// Design Name: 
// Module Name:    KGPRISC 
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


module KGPRISC (
    input clk,
    input rst,
	 output out
);
	 assign out =1'b0;
    wire [5:0] opcode;
    wire [4:0] func;
    wire [1:0] regDst;
    wire regWrite;
    wire memRead;
    wire memWrite;
    wire [1:0] memToReg;
    wire ALUsrc;
    wire [4:0] ALUop;
    wire ALUsel;
    wire isBranch;
    wire branchAddrSel;
    wire lblSel;

    // Instantiate the control unit
    control_unit CU (
        .opcode(opcode),
        .func(func),
        .regDst(regDst),
        .regWrite(regWrite),
        .memRead(memRead),
        .memWrite(memWrite),
        .memToReg(memToReg),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .ALUsel(ALUsel),
        .isBranch(isBranch),
        .branchAddrSel(branchAddrSel),
        .lblSel(lblSel)
    );

    // Instantiate the datapath unit
    datapath DP (
		  .clk(clk),
        .rst(rst),
        .regDst(regDst),
        .regWrite(regWrite),
        .memRead(memRead),
        .memWrite(memWrite),
        .memToReg(memToReg),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .ALUsel(ALUsel),
        .isBranch(isBranch),
        .branchAddrSel(branchAddrSel),
        .lblSel(lblSel),
		  .opcode(opcode),
        .func(func)
    );
endmodule
