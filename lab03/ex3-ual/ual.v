module ual(
    input [3:0] a,
    input [3:0] b,
    output [7:0] ual_out,
    input sel
    );

    wire [7:0] sub_out;
    wire [7:0] min_out;

    assign sub_out = {4'b0, a} - {4'b0, b};
    assign min_out = (a < b) ? a : b;

    assign ual_out = sel ? min_out : sub_out;   // sel = 0: a - b, sel = 1: min(a, b)

endmodule
