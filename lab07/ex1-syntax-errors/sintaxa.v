module circuit96_rom(
    input [2:0] addr,
    output reg [4:0] data       // fix 1: assigned in always, so it must be reg
);
    always @(*) begin
        case (addr)
            3'd0: data = 5'd25;
            3'd1: data = 5'd20;
            3'd2: data = 5'd11;
            3'd3: data = 5'd28;
            3'd4: data = 5'd4;
            3'd5: data = 5'd28;
            default: data = 5'd0;
        endcase
    end
endmodule                       // fix 2: missing endmodule

module circuit96(
    input clk,
    input rst,                  // fix 3: missing comma
    input start,
    output [7:0] sum,
    output [4:0] maxv,
    output done
);
    parameter IDLE = 2'd0, READ = 2'd1, FIN = 2'd2;
    reg [1:0] state;
    reg [2:0] addr;
    reg [7:0] acc;
    reg [4:0] best;
    wire [4:0] data;
    circuit96_rom rom(.addr(addr), .data(data));
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE; addr <= 0; acc <= 0; best <= 0;
        end else begin
            case (state)
                IDLE: if (start) begin
                    addr <= 0;
                    acc <= 0; best <= 0; state <= READ;
                end
                READ: begin
                    acc <= acc + data;
                    if (data > best) best <= data;
                    if (addr == 3'd5) state <= FIN;
                    else addr <= addr + 1;
                end
                FIN: state <= IDLE;
                default: state <= IDLE;
            endcase
        end                     // fix 4: missing end of the else block
    end
    assign sum = acc;
    assign maxv = best;         // fix 5: missing semicolon
    assign done = (state == FIN);
endmodule
