module FIFO_memory_tb;

    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 16;

    reg Clk;
    reg Rst;
    reg WR;
    reg RD;
    reg [DATA_WIDTH-1:0] dataIn;

    wire [DATA_WIDTH-1:0] dataOut;
    wire EMPTY;
    wire FULL;

    FIFO_memory #(DATA_WIDTH, FIFO_DEPTH) uut (
        .Clk(Clk),
        .Rst(Rst),
        .WR(WR),
        .RD(RD),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .EMPTY(EMPTY),
        .FULL(FULL)
    );

    always #5 Clk = ~Clk;

    initial begin
        Clk = 0;
        Rst = 0;
        WR = 0;
        RD = 0;
        dataIn = 0;

        #10;
        
        Rst = 1;
        #10;
        Rst = 0;
        #10;

        WR = 1;
        for (integer i = 0; i < FIFO_DEPTH; i = i + 1) begin
            dataIn = i;
            #10;
        end
        WR = 0;

        RD = 1;
        for (integer i = 0; i < FIFO_DEPTH; i = i + 1) begin
            #10;
        end
        RD = 0;

        $finish;
    end

    initial begin
        $monitor("Time: %d, Rst: %b, WR: %b, RD: %b, dataIn: %h, dataOut: %h, EMPTY: %b, FULL: %b",
                 $time, Rst, WR, RD, dataIn, dataOut, EMPTY, FULL);
    end
endmodule
