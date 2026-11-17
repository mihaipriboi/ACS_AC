`timescale 1ns / 1ps

// Fișier de test pentru modulul alu (completați-l).
// Codurile operațiilor: ADC=0 SBB1=1 SBB2=2 NOT=3 AND=4 OR=5 XOR=6 SHL=7 SHR=8 SAR=9
module alu_test;
    reg oe;
    reg [3:0] opcode;
    reg [15:0] in1, in2;
    reg carry;
    wire [15:0] out;
    wire [4:0] flags;   // {P, S, Z, O, C}

    integer errors;

    alu uut(.oe(oe), .opcode(opcode), .in1(in1), .in2(in2), .carry(carry), .out(out), .flags(flags));

    // applies one operation and compares out and flags with the expected values
    task check(input [3:0] op, input [15:0] a, input [15:0] b, input c,
               input [15:0] exp_out, input [4:0] exp_flags);
        begin
            opcode = op; in1 = a; in2 = b; carry = c;
            #10;
            if (out === exp_out && flags === exp_flags)
                $display("[OK]    op=%0d in1=%h in2=%h carry=%b -> out=%h flags{P,S,Z,O,C}=%b",
                         opcode, in1, in2, carry, out, flags);
            else begin
                $display("[ERROR] op=%0d in1=%h in2=%h carry=%b -> out=%h flags{P,S,Z,O,C}=%b, expected out=%h flags=%b",
                         opcode, in1, in2, carry, out, flags, exp_out, exp_flags);
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        oe = 1; opcode = 0; in1 = 0; in2 = 0; carry = 0;
        errors = 0;
        #10;

        // ADC
        check(0, 16'h7FFF, 16'h0001, 0, 16'h8000, 5'b01010);   // signed overflow
        check(0, 16'hFFFF, 16'h0001, 0, 16'h0000, 5'b10101);   // carry out, zero

        // SBB1: in1 - in2 - carry
        check(1, 16'h0005, 16'h0007, 0, 16'hFFFE, 5'b01001);   // borrow
        check(1, 16'h0007, 16'h0005, 1, 16'h0001, 5'b00000);
        check(1, 16'h0005, 16'h0004, 1, 16'h0000, 5'b10100);   // zero
        check(1, 16'h8000, 16'h0001, 0, 16'h7FFF, 5'b00010);   // -32768 - 1: overflow
        check(1, 16'h7FFF, 16'hFFFF, 0, 16'h8000, 5'b01011);   // 32767 - (-1): overflow and borrow
        check(1, 16'h0000, 16'h0000, 1, 16'hFFFF, 5'b11001);   // only the borrow

        // NOT: C and O are always 0
        check(3, 16'h0000, 16'h0000, 0, 16'hFFFF, 5'b11000);
        check(3, 16'hFFFF, 16'h0000, 0, 16'h0000, 5'b10100);
        check(3, 16'h1234, 16'h0000, 1, 16'hEDCB, 5'b01000);   // carry is ignored

        // OR
        check(5, 16'h00F0, 16'h0F00, 0, 16'h0FF0, 5'b10000);
        check(5, 16'h0000, 16'h0000, 0, 16'h0000, 5'b10100);
        check(5, 16'h8000, 16'h0001, 1, 16'h8001, 5'b11000);

        // XOR
        check(6, 16'hFFFF, 16'hFFFF, 0, 16'h0000, 5'b10100);
        check(6, 16'hAAAA, 16'h5555, 0, 16'hFFFF, 5'b11000);
        check(6, 16'h1234, 16'h00FF, 1, 16'h12CB, 5'b00000);   // odd number of 1 bits

        // SHL: C = bit shifted out, O = sign bit changed
        check(7, 16'h0001, 16'h0000, 0, 16'h0002, 5'b00000);
        check(7, 16'h8000, 16'h0000, 0, 16'h0000, 5'b10111);
        check(7, 16'h4000, 16'h0000, 0, 16'h8000, 5'b01010);
        check(7, 16'hC000, 16'h0000, 0, 16'h8000, 5'b01001);   // sign kept: no overflow

        // SAR: sign extension, C = bit shifted out, O = 0
        check(9, 16'h8000, 16'h0000, 0, 16'hC000, 5'b11000);
        check(9, 16'h0003, 16'h0000, 0, 16'h0001, 5'b00001);
        check(9, 16'h0001, 16'h0000, 0, 16'h0000, 5'b10101);
        check(9, 16'hFFFF, 16'h0000, 0, 16'hFFFF, 5'b11001);
        check(9, 16'h7FFE, 16'h0000, 0, 16'h3FFF, 5'b10000);

        if (errors == 0)
            $display("[INFO] All checks passed.");
        else
            $display("[INFO] %0d check(s) failed.", errors);
    end
endmodule
