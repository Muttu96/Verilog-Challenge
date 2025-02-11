module LIFO_memory_tb;

    parameter DATA_WIDTH = 8;
    parameter LIFO_DEPTH = 16;

    reg Clk;
    reg Rst;
    reg PUSH;
    reg POP;
    reg [DATA_WIDTH-1:0] dataIn;

    wire [DATA_WIDTH-1:0] dataOut;
    wire EMPTY;
    wire FULL;

    LIFO_memory #(DATA_WIDTH, LIFO_DEPTH) uut (
        .Clk(Clk),
        .Rst(Rst),
        .PUSH(PUSH),
        .POP(POP),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .EMPTY(EMPTY),
        .FULL(FULL)
    );

    always #5 Clk = ~Clk;

    initial begin
        Clk = 0;
        Rst = 0;
        PUSH = 0;
        POP = 0;
        dataIn = 0;

        #10;
        
        Rst = 1;
        #10;
        Rst = 0;
        #10;

        PUSH = 1;
        for (integer i = 0; i < LIFO_DEPTH; i = i + 1) begin
            dataIn = i;
            #10;
        end
        PUSH = 0;

        POP = 1;
        for (integer i = 0; i < LIFO_DEPTH; i = i + 1) begin
            #10;
        end
        POP = 0;

        $finish;
    end

    initial begin
        $monitor("Time: %d, Rst: %b, PUSH: %b, POP: %b, dataIn: %h, dataOut: %h, EMPTY: %b, FULL: %b",
                 $time, Rst, PUSH, POP, dataIn, dataOut, EMPTY, FULL);
    end
endmodule
