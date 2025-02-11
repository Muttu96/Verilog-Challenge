module FIFO_memory #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 16
)(
    input Clk,
    input Rst,
    input WR,
    input RD,
    input [DATA_WIDTH-1:0] dataIn,
    output reg [DATA_WIDTH-1:0] dataOut,
    output EMPTY,
    output FULL
);

    reg [DATA_WIDTH-1:0] FIFO [0:FIFO_DEPTH-1];
    reg [3:0] readCounter = 0, writeCounter = 0;
    reg [4:0] Count = 0;

    assign EMPTY = (Count == 0);
    assign FULL = (Count == FIFO_DEPTH);

    always @(posedge Clk or posedge Rst) begin
        if (Rst) begin
            readCounter <= 0;
            writeCounter <= 0;
            Count <= 0;
            dataOut <= 0;
        end else begin
            if (WR && !FULL) begin
                FIFO[writeCounter] <= dataIn;
                writeCounter <= (writeCounter + 1) % FIFO_DEPTH;
                Count <= Count + 1;
            end
            if (RD && !EMPTY) begin
                dataOut <= FIFO[readCounter];
                readCounter <= (readCounter + 1) % FIFO_DEPTH;
                Count <= Count - 1;
            end
        end
    end
endmodule
