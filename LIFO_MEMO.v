module LIFO_memory #(
    parameter DATA_WIDTH = 8,
    parameter LIFO_DEPTH = 16
)(
    input Clk,
    input Rst,
    input PUSH,
    input POP,
    input [DATA_WIDTH-1:0] dataIn,
    output reg [DATA_WIDTH-1:0] dataOut,
    output EMPTY,
    output FULL
);

    reg [DATA_WIDTH-1:0] LIFO [0:LIFO_DEPTH-1];
    reg [4:0] stackPointer = 0;

    assign EMPTY = (stackPointer == 0);
    assign FULL = (stackPointer == LIFO_DEPTH);

    always @(posedge Clk or posedge Rst) begin
        if (Rst) begin
            stackPointer <= 0;
            dataOut <= 0;
        end else begin
            if (PUSH && !FULL) begin
                LIFO[stackPointer] <= dataIn;
                stackPointer <= stackPointer + 1;
            end
            if (POP && !EMPTY) begin
                stackPointer <= stackPointer - 1;
                dataOut <= LIFO[stackPointer];
            end
        end
    end
endmodule
