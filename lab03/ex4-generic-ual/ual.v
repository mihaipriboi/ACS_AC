module ual #(
    parameter width = 6
    )(
    input  [width - 1 : 0]   a,
    input  [width - 1 : 0]   b,
    output [2*width - 1 : 0] ual_out,
    input sel
    );

    wire [2*width - 1 : 0] xor_out;
    wire [2*width - 1 : 0] max_out;

    assign xor_out = a ^ b;
    assign max_out = (a > b) ? a : b;

    assign ual_out = sel ? max_out : xor_out;   // sel = 0: a ^ b, sel = 1: max(a, b)

endmodule
