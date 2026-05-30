// 4-bit ALU
// Operations: ADD, SUB, AND, OR
// Uses Ripple Carry Adder + 2's Complement Subtraction
module alu_4bit(
    input  [3:0] a,
    input  [3:0] b,
    input  [1:0] opcode,
    output [3:0] result,
    output       carry
);
    wire [3:0] sum;
    wire [3:0] sub;
    wire [2:0] c;

    // ADD: Ripple Carry Adder
    full_adder fa0(.a(a[0]),.b(b[0]),.cin(1'b0),.sum(sum[0]),.cout(c[0]));
    full_adder fa1(.a(a[1]),.b(b[1]),.cin(c[0]),.sum(sum[1]),.cout(c[1]));
    full_adder fa2(.a(a[2]),.b(b[2]),.cin(c[1]),.sum(sum[2]),.cout(c[2]));
    full_adder fa3(.a(a[3]),.b(b[3]),.cin(c[2]),.sum(sum[3]),.cout(carry));

    // SUB: A - B = A + (~B) + 1
    wire [3:0] b_inv = ~b;
    wire sc0, sc1, sc2;
    full_adder fs0(.a(a[0]),.b(b_inv[0]),.cin(1'b1),.sum(sub[0]),.cout(sc0));
    full_adder fs1(.a(a[1]),.b(b_inv[1]),.cin(sc0),.sum(sub[1]),.cout(sc1));
    full_adder fs2(.a(a[2]),.b(b_inv[2]),.cin(sc1),.sum(sub[2]),.cout(sc2));
    full_adder fs3(.a(a[3]),.b(b_inv[3]),.cin(sc2),.sum(sub[3]),.cout());

    // MUX: select operation
    assign result = (opcode==2'b00) ? sum     :
                    (opcode==2'b01) ? sub     :
                    (opcode==2'b10) ? (a & b) :
                                      (a | b) ;
endmodule