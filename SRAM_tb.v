`timescale 1ns / 1ps

module SRAM_tb;

    reg clk;
    reg we_a, we_b;
    reg enable_a, enable_b;
    reg [3:0] addr_a, addr_b;
    reg [15:0] data_in_a, data_in_b;
    wire [15:0] data_out_a, data_out_b;

    SRAM uut (
        .clk(clk),
        .we_a(we_a),
        .we_b(we_b),
        .enable_a(enable_a),
        .enable_b(enable_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .data_in_a(data_in_a),
        .data_in_b(data_in_b),
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time: %0t | clk=%b | we_a=%b | addr_a=%h | data_in_a=%h | data_out_a=%h | we_b=%b | addr_b=%h | data_in_b=%h | data_out_b=%h",
                 $time, clk, we_a, addr_a, data_in_a, data_out_a, we_b, addr_b, data_in_b, data_out_b);
    end

    initial begin
        we_a = 0; we_b = 0;
        enable_a = 0; enable_b = 0;
        addr_a = 0; addr_b = 0;
        data_in_a = 0; data_in_b = 0;

        #10;

        we_a = 1;
        addr_a = 4;
        data_in_a = 16'hA5A5;
        #10 we_a = 0;
        enable_a = 1;
        #10 enable_a = 0;

        we_b = 1;
        addr_b = 8;
        data_in_b = 16'h5A5A;
        #10 we_b = 0;
        enable_b = 1;
        #10 enable_b = 0;

        we_a = 1; we_b = 1;
        addr_a = 2; addr_b = 6;
        data_in_a = 16'hFACE;
        data_in_b = 16'hDEAD;
        #10 we_a = 0; we_b = 0;

        enable_a = 1; addr_a = 2;
        enable_b = 1; addr_b = 6;
        #10 enable_a = 0; enable_b = 0;

        we_a = 1; we_b = 1;
        addr_a = 10; addr_b = 15;
        data_in_a = 16'hC0FF;
        data_in_b = 16'hEE00;
        #10 we_a = 0; we_b = 0;

        enable_a = 1; addr_a = 10;
        #10 enable_a = 0;
        enable_b = 1; addr_b = 15;
        #10 enable_b = 0;      
        
        we_a = 1;
        addr_a = 10;
        data_in_a = 16'hA5A5;
        #10 we_a = 0;
        enable_a = 1;
        #10 enable_a = 0;

        we_b = 1;
        addr_b = 12;
        data_in_b = 16'h5A5A;
        #10 we_b = 0;
        enable_b = 1;
        #10 enable_b = 0;

        #10 $finish;
    end

endmodule
