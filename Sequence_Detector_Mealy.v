`timescale 1ns / 1ps

module Sequence_Detector(
    input X,
    input clk,
    input rst,
    output reg Y
    );

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: begin
                if (X)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (X)
                    next_state = S2;
                else
                    next_state = S0;
            end

            S2: begin
                if (X)
                    next_state = S2;
                else
                    next_state = S3;
            end

            S3: begin
                if (X)
                    next_state = S1;
                else
                    next_state = S0;
            end

            default: next_state = S0;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            Y <= 1'b0;
        else if (state == S3 && X)
            Y <= 1'b1;
        else
            Y <= 1'b0;
    end

endmodule
