// Register File
// 32 registers, each 32-bit wide
// 2 read ports, 1 write port
// x0 hardwired to 0
module register_file(
    input         clk,
    input         we,
    input  [4:0]  waddr,
    input  [31:0] wdata,
    input  [4:0]  raddr1,
    input  [4:0]  raddr2,
    output [31:0] rdata1,
    output [31:0] rdata2
);
    reg [31:0] regs [0:31];

    integer i;
    initial begin
        for(i=0; i<32; i=i+1)
            regs[i] = 32'b0;
    end

    // Write: synchronous
    always @(posedge clk) begin
        if(we && waddr != 5'b0)
            regs[waddr] <= wdata;
    end

    // Read: combinational
    assign rdata1 = regs[raddr1];
    assign rdata2 = regs[raddr2];

endmodule