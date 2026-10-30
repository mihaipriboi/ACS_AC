module seven_seg(
    output reg [6:0] seven_seq,
    input      [3:0] number);

    always @(*) begin
        case (number)
            4'd0:    seven_seq = 7'b011_1111;
            4'd1:    seven_seq = 7'b000_0110;
            4'd2:    seven_seq = 7'b101_1011;
            4'd3:    seven_seq = 7'b100_1111;
            4'd4:    seven_seq = 7'b110_0110;
            4'd5:    seven_seq = 7'b110_1101;
            4'd6:    seven_seq = 7'b111_1101;
            4'd7:    seven_seq = 7'b000_0111;
            4'd8:    seven_seq = 7'b111_1111;
            4'd9:    seven_seq = 7'b110_0111;
            default: seven_seq = 7'b100_0000;
        endcase
    end

endmodule
