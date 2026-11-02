module ba(
    output reg o,   // found output: 0 - not found, 1 - found
    input i,        // char input: 0 - 'a', 1 - 'b'
    input clk);     // clock input

    localparam S0 = 2'd0,   // no char read yet
               Sa = 2'd1,   // last char was 'a'
               Sb = 2'd2,   // last char was 'b'
               SA = 2'd3;   // last chars were 'b', 'a': found

    reg [1:0] state = S0;
    reg [1:0] next_state;

    always @(posedge clk)
        state <= next_state;

    always @(*) begin
        o = 0;
        case (state)
            S0: next_state = i ? Sb : Sa;
            Sa: next_state = i ? Sb : Sa;
            Sb: next_state = i ? Sb : SA;
            SA: begin
                o = 1;
                next_state = i ? Sb : Sa;
            end
            default: next_state = S0;
        endcase
    end

endmodule
