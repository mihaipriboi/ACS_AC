module half_adder(
    output sum,
    output c_out,   // carry out
    input  a,
    input  b);

    xor x0(sum, a, b);
    and a0(c_out, a, b);

endmodule

module full_adder(
    output sum,
    output c_out,   // carry out
    input  a,
    input  b,
    input  c_in);    // carry in

    wire s0, c0, c1;    // partial sum, carries from the two half adders

    half_adder ha0(.sum(s0), .c_out(c0), .a(a), .b(b));
    half_adder ha1(.sum(sum), .c_out(c1), .a(s0), .b(c_in));
    or o0(c_out, c0, c1);

endmodule
