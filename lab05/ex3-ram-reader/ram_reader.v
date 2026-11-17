module ram_reader(
    input clk,
    input rst,
    input read,
    input  [9:0]  am_out,
    output [15:0] ram_out
    );

    parameter width = 16;

    wire disp_clk;
    wire [9:0]  disp_addr;
    wire [15:0] disp_data;

    reg                ram_oe;
    reg                ram_we;
    reg  [width-1 : 0] ram_in;
    wire [width-1 : 0] ram_tmp;

	ram ram (
	  .clka(clk),               // input clka
	  .rsta(ram_oe),            // input rsta
	  .wea(ram_we),             // input [0 : 0] wea
	  .addra(am_out[9:0]),      // input [9 : 0] addra
	  .dina(ram_in),            // input [15 : 0] dina
	  .douta(ram_tmp),          // output [15 : 0] douta
	  .clkb(disp_clk),          // input clkb
	  .web(1'b0),               // input [0 : 0] web
	  .addrb(disp_addr[9:0]),   // input [9 : 0] addrb
	  .dinb(16'b0),             // input [15 : 0] dinb
	  .doutb(disp_data)         // output [15 : 0] doutb
	);

    localparam S_IDLE = 1'd0,
               S_READ = 1'd1;     // drive the RAM data on ram_out

    reg state;
    reg next_state;

    // the RAM data shows up on ram_out only while reading
    assign ram_out = ram_oe ? ram_tmp : 0;

    // asynchronous reset, active low (the testbench holds rst = 1 while running)
    always @(posedge clk or negedge rst)
        if (!rst)
            state <= S_IDLE;
        else
            state <= next_state;

    always @(*) begin
        ram_oe = 0;
        ram_we = 0;     // read only
        ram_in = 0;
        case (state)
            S_IDLE: next_state = read ? S_READ : S_IDLE;
            S_READ: begin
                ram_oe = 1;
                next_state = read ? S_READ : S_IDLE;
            end
            default: next_state = S_IDLE;
        endcase
    end

endmodule

