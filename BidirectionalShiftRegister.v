`timescale 1ns / 1ps

module BidirectionalShiftRegister (
    input clk,
    input reset,
    input direction,
    input shift_in,
    output reg [3:0] data_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            data_out <= 4'b0000;
        else begin
            if (direction)
                data_out <= {data_out[2:0], shift_in};
            else
                data_out <= {shift_in, data_out[3:1]};
        end
    end
endmodule

