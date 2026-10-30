module multiplier(
    output reg [7:0] prod,
    input      [3:0] a,
    input      [3:0] b);

    integer i;

    always @(*) begin
        prod = 0;
        for (i = 0; i < 4; i = i + 1)
            if (b[i])
                prod = prod + ({4'b0, a} << i);
    end

endmodule
