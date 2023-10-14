`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:31:34 11/09/2022 
// Design Name: 
// Module Name:    branch_unit 
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
module branch_unit (
    input [31:0] nextPC,
    input [25:0] label0,
    input [15:0] label1,
    input [31:0] rsAddr,
    input lblSel,
    input branchAddrSel,
    input isBranch,
    input validJump,
    output [31:0] nextAddr
);

    wire [31:0] extendLabel0, extendLabel1;

    wire [31:0] M1out, M2out;
	 
    wire isJump;

    assign extendLabel0 = {{6{label0[25]}}, label0};
    assign extendLabel1 = {{16{label1[15]}}, label1};

    and AND1 (isJump, isBranch, validJump);

    mux_32b_2_1 MUX_1 (.in0(extendLabel0), .in1(extendLabel1), .sel(lblSel), .out(M1out));
    mux_32b_2_1 MUX_2 (.in0(M1out), .in1(rsAddr), .sel(branchAddrSel), .out(M2out));
    mux_32b_2_1 MUX_3 (.in0(nextPC), .in1(M2out), .sel(isJump), .out(nextAddr));
    
endmodule
