`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:31:26 11/09/2022
// Design Name:   shifter
// Module Name:   C:/Users/akabh/assgn_6_Grp60/shifter_Tb.v
// Project Name:  assgn_6_Grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shifter_Tb;

	// Inputs
	reg [31:0] in;
	reg [31:0] shamt;
	reg dir;
	reg aorl;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	shifter uut (
		.in(in), 
		.shamt(shamt), 
		.dir(dir), 
		.aorl(aorl), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 7;
		shamt = 2;
		dir = 1;
		aorl = 0;
		#10;
		in = 7;
		shamt = 2;
		dir = 0;
		aorl = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

