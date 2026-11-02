module mux4_1(
    output out,
    input  i1,
    input  i2,
    input  i3,
    input  i4,
    input  s1,
    input  s2);

    // Logic equation from the truth table
    // assign out = (~s2 & ~s1 & ~i1) | (~s2 & s1 & ~i2) | (s2 & ~s1 & ~i3) | (s2 & s1 & ~i4);

    // Conditional operator
    assign out = s2 ? (s1 ? ~i4 : ~i3) : (s1 ? ~i2 : ~i1);

endmodule
