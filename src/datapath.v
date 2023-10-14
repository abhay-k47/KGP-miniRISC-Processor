`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:34:09 11/09/2022 
// Design Name: 
// Module Name:    datapath 
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
module datapath (
    input clk,
    input rst,
    input [1:0] regDst,
    input regWrite,
	 input [1:0] memToReg,
    input memRead,
    input memWrite,
    input ALUsrc,
    input [4:0] ALUop,
    input ALUsel,
    input isBranch,
    input lblSel,
	 input branchAddrSel,
    output [5:0] opcode,
    output [4:0] func
);
    parameter ra = 5'b11111;    // Register ra

    wire enable;
    wire carry, zero, sign, validJump, lastCarry;
    wire [31:0] nextInstrAddr, instruction, writeData, readData1, instrAddr, result, nextPC, readData2, SE1out, b, dataMemReadData;
    wire [25:0] label0;
    wire [15:0] label1, imm;
    wire [4:0] rs, rt, shamt, writeReg;
    wire [31:0] offset;
    
    assign enable = memRead | memWrite;         // Enable signal for the data memory module
    assign offset = nextInstrAddr >>> 2'b10;    // Read address for the instruction memory module
    
    dff DFF (
        .clk(clk),
        .rst(rst),
        .d(carry),
        .q(lastCarry)
    );
    
    mux_5b_3_1 MUX_1 (
        .in0(rs),
        .in1(rt),
        .in2(ra),
        .sel(regDst),
        .out(writeReg)
    );

    mux_32b_2_1 MUX_2 (
        .in0(readData2),
        .in1(SE1out),
        .sel(ALUsrc), 
        .out(b)
    );
	 
    mux_32b_3_1 MUX_3 (
        .in0(nextPC),
        .in1(dataMemReadData),
        .in2(result),
        .sel(memToReg),
        .out(writeData)
    );
	 
    program_counter PC (
        .nextInstrAddr(nextInstrAddr),
        .clk(clk),
        .rst(rst),
        .instrAddr(instrAddr)
    );
	
    PC_increment PC_INCREMENT (
        .instrAddr(instrAddr),
        .nextPC(nextPC)
    );
	 
    bram_instr_mem INSTRUCTION_MEMORY (
        .clka(clk),
        .addra(offset[9:0]),
        .douta(instruction)
    );

    instruction_decode INSTRUCTION_DECODER (
        .instruction(instruction),
        .opcode(opcode),
        .func(func),
        .label0(label0),
        .label1(label1),
        .rs(rs),
        .rt(rt),
        .shamt(shamt),
        .imm(imm)
    );

    
    register_file REGISTER_FILE (
        .rs(rs),
        .rt(rt),
        .regWrite(regWrite),
        .writeReg(writeReg),
        .writeData(writeData),
        .clk(clk),
        .rst(rst),
        .readData1(readData1),
        .readData2(readData2)
    );

    immediate_sign_extend SIGN_EXTEND (
        .opcode(opcode),
        .instr(imm),
        .extendImm(SE1out)
    );

    ALU ALU_UNIT (
        .a(readData1),
        .b(b),
        .ALUsel(ALUsel),
        .ALUop(ALUop),
        .carry(carry),
        .zero(zero), 
        .sign(sign),
        .result(result)
    );
	
	bram_data_mem DATA_MEMORY(
        .clka(~clk),
        .ena(enable),
        .wea(memWrite),
        .addra(result[9:0] >>> 2'b10),
        .dina(readData2),
        .douta(dataMemReadData)
    );
	 
	BranchControl BRANCH_CONTROL (
        .opcode(opcode),
        .sign(sign),
        .carry(lastCarry),
        .zero(zero),
        .out(validJump)
   );

    branch_unit BRANCH_UNIT (
        .nextPC(nextPC),
        .label0(label0),
        .label1(label1),
        .rsAddr(readData1),
        .lblSel(lblSel),
        .branchAddrSel(branchAddrSel),
        .isBranch(isBranch),
        .validJump(validJump),
        .nextAddr(nextInstrAddr)
    );

endmodule
