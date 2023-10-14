`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:28:43 11/09/2022
// Design Name:   KGPRISC
// Module Name:   C:/Users/akabh/assgn_6_Grp60/KGPRISC_Tb.v
// Project Name:  assgn_6_Grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KGPRISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module KGPRISC_Tb;

	// Inputs
	reg clk;
	reg rst;
	// Instantiate the Unit Under Test (UUT)
	KGPRISC uut (
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
        #5 rst = 0;
		
   
       #25000 
        $display ("Content in register 19: %d", uut.DP.REGISTER_FILE.registerBank[19]);
        if (uut.DP.REGISTER_FILE.registerBank[19] == -1) begin
            $display("Element not found.");
        end else begin
            $display("Element found at index: %d", uut.DP.REGISTER_FILE.registerBank[19]);
        end
        $finish;
        
        
    end
    
//    always @ (*) begin
//            if (uut.DP.registerFile.registerBank[16] == 1) begin 
//                $finish;
//               end
//        end
    
    always begin
        #10 clk = ~clk;
    end
      
endmodule

