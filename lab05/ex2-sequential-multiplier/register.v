module register #(parameter width = 8) (
	input clk,
	input rst_n,
	input oe,
	input we,
	input [width-1:0] in,
	output[width-1:0] out,
	output[width-1:0] disp_out
    );

	reg [width-1:0] data;

	// synchronous write, asynchronous reset (active low)
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			data <= 0;
		else if (we)
			data <= in;

	// oe acts immediately, without waiting for the clock
	assign out      = oe ? data : 0;
	assign disp_out = data;

endmodule
