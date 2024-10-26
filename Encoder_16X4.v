`timescale 1ns / 1ps

module Encoder_16X4(
    input [15:0] X,
    output reg [3:0] Y
);

    wire [1:0] W1, W2, W3, W4;
    wire E0, E1, E2, E3;

    Encoder_4X2 M1 (.X(X[3:0]),   .Y(W1));
    Encoder_4X2 M2 (.X(X[7:4]),   .Y(W2));
    Encoder_4X2 M3 (.X(X[11:8]),  .Y(W3));
    Encoder_4X2 M4 (.X(X[15:12]), .Y(W4));

    assign E0 = |X[3:0];
    assign E1 = |X[7:4];
    assign E2 = |X[11:8];
    assign E3 = |X[15:12];

    always @(*) 
    begin
        casez ({E3, E2, E1, E0})
            4'b0001: Y = {2'b00, W1};
            4'b0010: Y = {2'b01, W2};
            4'b0100: Y = {2'b10, W3};
            4'b1000: Y = {2'b11, W4};
            default: Y = 4'b0000; 
        endcase
    end

endmodule


module Encoder_4X2(
    input [3:0] X,
    output [1:0] Y
);

    assign Y[0] = X[1] | X[3];
    assign Y[1] = X[2] | X[3];
    
endmodule
