`timescale 1ns / 1ps

module Priority_Decoders (
    input E,
    input [1:0] Z,
    input [3:0] X,
    output reg [15:0] Y
);
    wire [3:0] A;
    wire [7:0] B;
    wire [15:0] C;

    Decoder_2X4 M1(.X(X[1:0]), .Y(A));
    Decoder_3X8 M2(.X(X[2:0]), .Y(B));
    Decoder_4X16 M3(.X(X), .Y(C));

    always @(*) begin
        if (!E) begin
            case (Z)
                2'b00: Y = {12'b0, A};
                2'b01: Y = {8'b0, B};
                2'b10: Y = C;
                default: Y = 16'b0;
            endcase
        end else begin
            Y = 16'b0;  
        end
    end
endmodule


module Decoder_2X4 (
    input [1:0] X,
    output reg [3:0] Y
);
    always @(*) begin
        Y = 4'b0000;
        Y[X] = 1'b1;
    end
endmodule


module Decoder_3X8 (
    input [2:0] X,
    output reg [7:0] Y
);
    always @(*) begin
        Y = 8'b00000000;
        Y[X] = 1'b1;
    end
endmodule


module Decoder_4X16 (
    input [3:0] X,
    output reg [15:0] Y
);
    always @(*) begin
        Y = 16'b0000000000000000;
        Y[X] = 1'b1;
    end
endmodule
