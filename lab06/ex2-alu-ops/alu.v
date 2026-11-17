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

localparam ADC  = 4'd0,
           SBB1 = 4'd1,
           NOT  = 4'd3,
           OR   = 4'd5,
           XOR  = 4'd6,
           SHL  = 4'd7,
           SAR  = 4'd9;

reg [width-1:0] result;
reg             c;      // carry / borrow / bit shifted out
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
        SBB1: begin
            // the extra top bit is 1 when the subtraction borrows
            {c, result} = in1 - in2 - carry;
            // operands of different signs, result with a sign different from in1
            o = (in1[width-1] != in2[width-1]) && (result[width-1] != in1[width-1]);
        end
        // logic operations: C and O stay 0
        NOT: result = ~in1;
        OR:  result = in1 | in2;
        XOR: result = in1 ^ in2;
        SHL: begin
            // C gets the bit shifted out of the MSB
            {c, result} = {in1, 1'b0};
            // O is set only if the sign bit changed
            o = result[width-1] != in1[width-1];
        end
        SAR: begin
            // >>> replicates the sign bit only on a signed operand
            result = $signed(in1) >>> 1;
            // C gets the bit shifted out of the LSB, O stays 0
            c = in1[0];
        end
        default: ;
    endcase
end

// the result goes on the bus only while oe is active
assign out = oe ? result : {width{1'bz}};

// P = 1 for an even number of 1 bits (negated XOR of the result bits)
assign flags = {~^result, result[width-1], result == 0, o, c};

endmodule
