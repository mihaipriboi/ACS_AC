module comp4(
    output              o1,     // a < b
    output              o2,     // a == b
    output              o3,     // a >= b
    input  signed [3:0] a,
    input  signed [3:0] b);

    assign o1 = a < b;
    assign o2 = a == b;
    assign o3 = a >= b;

endmodule
