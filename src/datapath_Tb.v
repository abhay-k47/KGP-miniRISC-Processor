`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:24:19 11/09/2022
// Design Name:   datapath
// Module Name:   C:/Users/akabh/assgn_6_Grp60/datapath_Tb.v
// Project Name:  assgn_6_Grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module datapath_Tb;

	// Inputs
	reg clk;
	reg rst;
	reg [1:0] regDst;
	reg regWrite;
	reg [1:0] memToReg;
	reg memRead;
	reg memWrite;
	reg ALUsrc;
	reg [4:0] ALUop;
	reg ALUsel;
	reg isBranch;
	reg lblSel;
	reg branchAddrSel;

	// Outputs
	wire [5:0] opcode;
	wire [4:0] func;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.clk(clk), 
		.rst(rst), 
		.regDst(regDst), 
		.regWrite(regWrite), 
		.memToReg(memToReg), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.ALUsrc(ALUsrc), 
		.ALUop(ALUop), 
		.ALUsel(ALUsel), 
		.isBranch(isBranch), 
		.lblSel(lblSel), 
		.branchAddrSel(branchAddrSel), 
		.opcode(opcode), 
		.func(func)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		#5;
		rst=0;
		regDst = 0;
		regWrite = 1;
		memToReg = 0;
		memRead = 0;
		memWrite = 0;
		ALUsrc = 0;
		ALUop = 1;
		ALUsel = 0;
		isBranch = 0;
		lblSel = 0;
		branchAddrSel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   
	always #5 clk = ~clk;
endmodule

