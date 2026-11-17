`timescale 1ns / 1ps

module alu_test;
    reg oe;
    reg [3:0] opcode;
    reg [15:0] in1, in2;
    reg carry;
    wire [15:0] out;
    wire [4:0] flags;   // {P, S, Z, O, C}

    alu uut(.oe(oe), .opcode(opcode), .in1(in1), .in2(in2), .carry(carry), .out(out), .flags(flags));

    task show;
        begin
            #10;
            $display("op=%0d in1=%h in2=%h carry=%b -> out=%h flags{P,S,Z,O,C}=%b", opcode, in1, in2, carry, out, flags);
        end
    endtask

    initial begin
        oe = 1; opcode = 0;   // ADC
        in1 = 16'h0001; in2 = 16'h0001; carry = 0; show;
        in1 = 16'hFFFF; in2 = 16'h0001; carry = 0; show;   // transport
        in1 = 16'h7FFF; in2 = 16'h0001; carry = 0; show;   // depășire cu semn
        in1 = 16'h8000; in2 = 16'h8000; carry = 0; show;
        in1 = 16'h0000; in2 = 16'h0000; carry = 1; show;
        // Adăugați alte cazuri.
        // expected out and flags{P,S,Z,O,C} in the comments
        in1 = 16'hFFFF; in2 = 16'h0000; carry = 1; show;   // 0000, 10101: the input carry propagates out
        in1 = 16'h7FFF; in2 = 16'h0000; carry = 1; show;   // 8000, 01010: overflow caused by the carry
        in1 = 16'h8000; in2 = 16'hFFFF; carry = 0; show;   // 7fff, 00011: negative overflow
        in1 = 16'hFFFF; in2 = 16'hFFFF; carry = 1; show;   // ffff, 11001: carry, no overflow
        in1 = 16'h1234; in2 = 16'h4321; carry = 1; show;   // 5556, 10000
        oe = 0;
        in1 = 16'h0001; in2 = 16'h0001; carry = 0; show;   // zzzz, 00000: flags are still computed
    end
endmodule
