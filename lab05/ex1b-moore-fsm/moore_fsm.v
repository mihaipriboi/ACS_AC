module moore_fsm (
    output reg y,
    input x,
    input rst_n,
    input clk);

    localparam S0 = 2'd0,
               S1 = 2'd1,
               S2 = 2'd2;

    reg [1:0] state;
    reg [1:0] next_state;

    // asynchronous reset, active low
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            state <= S0;
        else
            state <= next_state;

    always @(*) begin
        y = 0;
        case (state)
            S0: next_state = x ? S1 : S0;
            S1: next_state = S2;
            S2: begin
                y = 1;
                next_state = x ? S0 : S1;
            end
            default: next_state = S0;
        endcase
    end

endmodule
