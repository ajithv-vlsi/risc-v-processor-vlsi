// AND Gate
// Basic logic gate - foundation of all digital circuits
module and_gate(
    input  a,
    input  b,
    output y
);
    assign y = a & b;
endmodule