module alu(oe, opcode, in1, in2, carry, out, flags);

parameter width = 16;
parameter flags_width = 5;

input                           oe;
input [3:0]                     opcode;
input [width-1:0]               in1;
input [width-1:0]               in2;
input                           carry;
output [width-1:0]              out;
output [flags_width-1:0]        flags;  // P, S, Z, O, C

localparam ADC = 4'd0;

reg [width-1:0] result;
reg             c;      // carry / borrow
reg             o;      // signed overflow

always @(*) begin
    result = 0;
    c      = 0;
    o      = 0;
    case (opcode)
        ADC: begin
            // 16-bit full adder; the carry out of the MSB is C
            {c, result} = in1 + in2 + carry;
            // same-sign operands, result with a different sign
            o = (in1[width-1] == in2[width-1]) && (result[width-1] != in1[width-1]);
        end
        default: ;
    endcase
end

// the result goes on the bus only while oe is active
assign out = oe ? result : {width{1'bz}};

// P = 1 for an even number of 1 bits (negated XOR of the result bits)
assign flags = {~^result, result[width-1], result == 0, o, c};

endmodule
