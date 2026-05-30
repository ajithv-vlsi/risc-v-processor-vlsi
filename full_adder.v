// Full Adder
// Adds three 1-bit numbers (A, B, Carry-in)
// Built using two Half Adders
module full_adder(
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    wire sum1, carry1, carry2;

    // First Half Adder: A + B
    half_adder ha1(.a(a), .b(b), .sum(sum1), .carry(carry1));

    // Second Half Adder: Sum1 + Cin
    half_adder ha2(.a(sum1), .b(cin), .sum(sum), .carry(carry2));

    // Final carry
    assign cout = carry1 | carry2;
endmodule
