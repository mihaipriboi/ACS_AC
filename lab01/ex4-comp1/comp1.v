module comp1(
    output o1,      // a < b
    output o2,      // a == b
    output o3,      // a != b
    input  a,
    input  b);

    wire na;

    not n0(na, a);
    and a0(o1, na, b);  // only a=0, b=1
    xnor x0(o2, a, b);
    xor x1(o3, a, b);

endmodule
