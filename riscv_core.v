// RISC-V Single Cycle Processor
// RV32I Base Integer Instruction Set
// Supports: ADD, SUB (R-type instructions)
module riscv_core(
    input clk
);
    // Program Counter
    reg [31:0] pc;
    initial pc = 0;

    // FETCH: get instruction from memory
    wire [31:0] inst;
    inst_memory imem(.addr(pc), .inst(inst));

    // DECODE: extract fields
    wire [6:0] opcode = inst[6:0];
    wire [4:0] rd     = inst[11:7];
    wire [2:0] funct3 = inst[14:12];
    wire [4:0] rs1    = inst[19:15];
    wire [4:0] rs2    = inst[24:20];
    wire       funct7 = inst[30];

    // CONTROL UNIT
    wire reg_write, alu_src;
    wire [1:0] alu_op;
    control_unit cu(
        .opcode(opcode), .funct3(funct3), .funct7(funct7),
        .reg_write(reg_write), .alu_src(alu_src), .alu_op(alu_op)
    );

    // READ REGISTERS
    wire [31:0] rdata1, rdata2, alu_result;
    register_file rf(
        .clk(clk), .we(reg_write),
        .waddr(rd), .wdata(alu_result),
        .raddr1(rs1), .raddr2(rs2),
        .rdata1(rdata1), .rdata2(rdata2)
    );

    // EXECUTE: ALU
    alu_32bit alu(
        .a(rdata1), .b(rdata2),
        .op(alu_op), .result(alu_result)
    );

    // UPDATE PC
    always @(posedge clk)
        pc <= pc + 4;

endmodule

// Instruction Memory
module inst_memory(
    input  [31:0] addr,
    output [31:0] inst
);
    reg [31:0] mem [0:15];
    initial begin
        // ADD x1, x2, x3
        mem[0] = 32'b0000000_00011_00010_000_00001_0110011;
        // ADD x4, x1, x2
        mem[1] = 32'b0000000_00010_00001_000_00100_0110011;
        // SUB x5, x4, x3
        mem[2] = 32'b0100000_00011_00100_000_00101_0110011;
        mem[3] = 32'b0;
        mem[4] = 32'b0;
    end
    assign inst = mem[addr[5:2]];
endmodule

// Control Unit
module control_unit(
    input  [6:0] opcode,
    input  [2:0] funct3,
    input        funct7,
    output reg   reg_write,
    output reg   alu_src,