`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:40:44 11/09/2022 
// Design Name: 
// Module Name:    register_file 
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

module register_file (
    input [4:0] rs,
    input [4:0] rt,
    input regWrite,
    input [4:0] writeReg,
    input [31:0] writeData,
    input clk,
    input rst,
    output reg [31:0] readData1,
    output reg [31:0] readData2
);

    reg signed [31:0] registerBank [31:0];
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            registerBank[0] <= 32'd0;    
				registerBank[1] <= 32'd0;    
				registerBank[2] <= 32'd0;    
				registerBank[3] <= 32'd0;  
				registerBank[4] <= 32'd0;    
				registerBank[5] <= 32'd0;    
				registerBank[6] <= 32'd0;    
				registerBank[7] <= 32'd0;  
				registerBank[8] <= 32'd0;    
				registerBank[9] <= 32'd0;    
				registerBank[10] <= 32'd0;    
				registerBank[11] <= 32'd0;  
				registerBank[12] <= 32'd0;    
				registerBank[13] <= 32'd0;    
				registerBank[14] <= 32'd0;    
				registerBank[15] <= 32'd0;  
				registerBank[16] <= 32'd0;    
				registerBank[17] <= 32'd0;    
				registerBank[18] <= 32'd0;    
				registerBank[19] <= 32'd0;  
				registerBank[20] <= 32'd0;    
				registerBank[21] <= 32'd0;    
				registerBank[22] <= 32'd0;    
				registerBank[23] <= 32'd0;  
				registerBank[24] <= 32'd0;    
				registerBank[25] <= 32'd0;    
				registerBank[26] <= 32'd0;    
				registerBank[27] <= 32'd0;  
				registerBank[28] <= 32'd0;    
				registerBank[29] <= 32'd0;    
				registerBank[30] <= 32'd0;    
				registerBank[31] <= 32'd0;  
        end else if (regWrite) begin
            registerBank[writeReg] <= writeData;    
        end 
    end

    always @(*) begin

        readData1 = registerBank[rs];
        readData2 = registerBank[rt];
    end

endmodule
