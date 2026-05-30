// Half Adder
// Adds two 1-bit numbers
// Sum = XOR, Carry = AND
module half_adder(
    input  a,
    input  b,
    output sum,
    output carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule