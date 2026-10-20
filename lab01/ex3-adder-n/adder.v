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

module adder4(
    output [3:0] sum,
    output c_out,
    input[3:0] a, b);

    wire c1, c2, c3;    // carries between stages

    full_adder fa0(.sum(sum[0]), .c_out(c1), .a(a[0]), .b(b[0]), .c_in(1'b0));
    full_adder fa1(.sum(sum[1]), .c_out(c2), .a(a[1]), .b(b[1]), .c_in(c1));
    full_adder fa2(.sum(sum[2]), .c_out(c3), .a(a[2]), .b(b[2]), .c_in(c2));
    full_adder fa3(.sum(sum[3]), .c_out(c_out), .a(a[3]), .b(b[3]), .c_in(c3));

endmodule

module adder(
    output [11:0] sum,  // 11 bits + carry
    input [10:0] a, b);

    wire [10:4] c;      // c[i] = carry into bit i

    adder4 add0(.sum(sum[3:0]), .c_out(c[4]), .a(a[3:0]), .b(b[3:0]));

    full_adder fa4(.sum(sum[4]), .c_out(c[5]), .a(a[4]), .b(b[4]), .c_in(c[4]));
    full_adder fa5(.sum(sum[5]), .c_out(c[6]), .a(a[5]), .b(b[5]), .c_in(c[5]));
    full_adder fa6(.sum(sum[6]), .c_out(c[7]), .a(a[6]), .b(b[6]), .c_in(c[6]));
    full_adder fa7(.sum(sum[7]), .c_out(c[8]), .a(a[7]), .b(b[7]), .c_in(c[7]));
    full_adder fa8(.sum(sum[8]), .c_out(c[9]), .a(a[8]), .b(b[8]), .c_in(c[8]));
    full_adder fa9(.sum(sum[9]), .c_out(c[10]), .a(a[9]), .b(b[9]), .c_in(c[9]));
    full_adder fa10(.sum(sum[10]), .c_out(sum[11]), .a(a[10]), .b(b[10]), .c_in(c[10]));

endmodule
