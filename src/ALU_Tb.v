`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:18 11/09/2022
// Design Name:   ALU
// Module Name:   C:/Users/akabh/assgn_6_Grp60/ALU_Tb.v
// Project Name:  assgn_6_Grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_Tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg ALUsel;
	reg [4:0] ALUop;

	// Outputs
	wire [31:0] result;
	wire carry;
	wire zero;
	wire sign;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.ALUsel(ALUsel), 
		.ALUop(ALUop), 
		.result(result), 
		.carry(carry), 
		.zero(zero), 
		.sign(sign)
	);

	initial begin
		// Initialize Inputs
		a = 8;
		b = 9;
		ALUsel = 0;
		ALUop = 1;
		#10;
		a = 8;
		b = 9;
		ALUsel = 1;
		ALUop = 1;
		#10;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

