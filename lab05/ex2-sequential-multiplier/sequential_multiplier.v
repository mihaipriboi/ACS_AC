module sequential_multiplier(
     input                      clk,
     input                      rst_n,
     input                      write,
     input                      multiply,
     input                      display,
     input [a_width-1:0]        a,
     input [b_width-1:0]        b,
     output [product_width-1:0] out
     );

     parameter a_width = 8;
     parameter b_width = 4;
     parameter product_width = a_width + b_width;

    localparam S_IDLE     = 2'd0,
               S_WRITE    = 2'd1,     // store a and b
               S_MULTIPLY = 2'd2,     // store a * b in the product register
               S_DISPLAY  = 2'd3;     // drive the product on out

    reg [1:0] state;
    reg [1:0] next_state;

    // register controls
    reg we_ab;      // write enable for the a and b registers
    reg oe_ab;      // output enable for the a and b registers
    reg we_p;       // write enable for the product register
    reg oe_p;       // output enable for the product register

    wire [a_width-1:0]       a_out;
    wire [b_width-1:0]       b_out;
    wire [product_width-1:0] product = a_out * b_out;

    register #(.width(a_width)) reg_a (
        .clk(clk), .rst_n(rst_n), .oe(oe_ab), .we(we_ab),
        .in(a), .out(a_out), .disp_out());

    register #(.width(b_width)) reg_b (
        .clk(clk), .rst_n(rst_n), .oe(oe_ab), .we(we_ab),
        .in(b), .out(b_out), .disp_out());

    register #(.width(product_width)) reg_p (
        .clk(clk), .rst_n(rst_n), .oe(oe_p), .we(we_p),
        .in(product), .out(out), .disp_out());

    // asynchronous reset, active low
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            state <= S_IDLE;
        else
            state <= next_state;

    // priority: write > multiply > display
    always @(*)
        if (write)
            next_state = S_WRITE;
        else if (multiply)
            next_state = S_MULTIPLY;
        else if (display)
            next_state = S_DISPLAY;
        else
            next_state = S_IDLE;

    // the register controls depend only on the current state
    always @(*) begin
        we_ab = 0;
        oe_ab = 0;
        we_p  = 0;
        oe_p  = 0;
        case (state)
            S_WRITE:    we_ab = 1;
            S_MULTIPLY: begin
                oe_ab = 1;
                we_p  = 1;
            end
            S_DISPLAY:  oe_p = 1;
            default: ;
        endcase
    end

endmodule
