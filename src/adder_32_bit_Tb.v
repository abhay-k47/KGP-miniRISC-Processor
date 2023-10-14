`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:32:59 11/09/2022
// Design Name:   adder_32_bit
// Module Name:   C:/Users/akabh/assgn_6_Grp60/adder_32_bit_Tb.v
// Project Name:  assgn_6_Grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder_32_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_32_bit_Tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg c_in;

	// Outputs
	wire [31:0] sum;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	adder_32_bit uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.sum(sum), 
		.c_out(c_out)
	);

	initial begin
		// Initialize Inputs
		a = 8;
		b = 12;
		c_in = 0;
		#10;
		a = 8;
		b = -12;
		c_in = 1;
		#10;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

