`timescale 1ns / 1ps

module tb_uart_tx;

    reg clk;
    reg reset;
    reg tx_start;
    reg [7:0] tx_data;
    wire tx;
    wire tx_busy;

    uart_tx uut (
        .clk(clk),
        .reset(reset),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    initial begin
        reset = 1;
        tx_start = 0;
        tx_data = 8'b00000000;
        #20 reset = 0;
        #20 tx_data = 8'b10101010; // Example data
        tx_start = 1;
        #10 tx_start = 0;
        #104160; // Wait for one frame
        #20 $finish;
    end
endmodule