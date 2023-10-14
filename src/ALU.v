`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:25:43 11/09/2022 
// Design Name: 
// Module Name:    ALU 
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


module ALU (
    input signed [31:0] a, 
    input signed [31:0] b, 
    input ALUsel, 
    input [4:0] ALUop, 
	 output reg [31:0] result,
    output reg carry, 
    output reg zero, 
    output reg sign
);

    wire cy;
    wire [31:0] notOut, adderOut, andOut, xorOut, diffOut, shifterOut, mux_1Out, mux_2Out;

	 assign notOut = ~b;
    assign andOut = mux_1Out & mux_2Out;
    assign xorOut = mux_1Out ^ mux_2Out;
	 
    mux_32b_2_1 MUX_1 (.in0(a), .in1(32'd1), .sel(ALUsel), .out(mux_1Out));
    mux_32b_2_1 MUX_2 (.in0(b), .in1(notOut), .sel(ALUsel), .out(mux_2Out));
    adder_32_bit ADDER (.a(mux_1Out), .b(mux_2Out), .c_in(1'b0), .c_out(cy), .sum(adderOut));
    shifter SHIFTER (.in(mux_1Out), .shamt(mux_2Out), .dir(ALUop[1]), .out(shifterOut), .aorl(ALUop[0]));
	 Diff DIFF(.a(mux_1Out), .b(mux_2Out), .out(diffOut));

    always @(*) 
	 begin
        if (ALUop == 5'b00000) 
		  begin
            result = mux_1Out;
        end 
		  else if (ALUop == 5'b00001) 
		  begin
            carry = cy;
            result = adderOut;
        end 
		  else if (ALUop == 5'b00101) 
		  begin
            result = adderOut;
        end 
		  else if (ALUop == 5'b10101) 
		  begin
            result = adderOut;
        end 
		  else if (ALUop == 5'b00010) 
		  begin
            result = andOut;
        end 
		  else if (ALUop == 5'b00011) 
		  begin
            result = xorOut;
		  end 
		  else if (ALUop == 5'b00100) 
		  begin
				result = diffOut;
        end 
		  else if (ALUop[4:2] == 3'b010) 
		  begin
            result = shifterOut;
		  end 
		  else 
		  begin
            result = 32'd0;
        end
    end

    always @(result)
	 begin
		  sign = result[31];
        if (!result)
		  begin
            zero = 1'b1;
        end
		  else 
		  begin
            zero = 1'b0;
        end
    end
    
endmodule