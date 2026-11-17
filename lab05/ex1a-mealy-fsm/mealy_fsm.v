module mealy_fsm (
    output reg y,
    input [1:0] x,
    input rst_n,
    input clk);

    localparam S0 = 2'd0,
               S1 = 2'd1,
               S2 = 2'd2,
               S3 = 2'd3;

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
            S0: case (x)
                    2'b00: next_state = S0;
                    2'b01: next_state = S1;
                    2'b10: next_state = S2;
                    default: next_state = S0;   // 2'b11
                endcase
            S1: case (x)
                    2'b00: next_state = S2;
                    2'b01: next_state = S0;
                    2'b10: next_state = S3;
                    default: next_state = S1;   // 2'b11
                endcase
            S2: begin
                y = (x == 2'b00);
                case (x)
                    2'b00: next_state = S3;
                    2'b01: next_state = S0;
                    2'b10: next_state = S1;
                    default: next_state = S2;   // 2'b11
                endcase
            end
            S3: begin
                y = (x == 2'b00) || (x == 2'b10);
                case (x)
                    2'b00: next_state = S1;
                    2'b01: next_state = S0;
                    2'b10: next_state = S3;
                    default: next_state = S0;   // 2'b11
                endcase
            end
            default: next_state = S0;
        endcase
    end

endmodule
