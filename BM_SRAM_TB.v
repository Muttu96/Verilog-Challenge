`timescale 1ns / 1ps

module tb_burst_mode_sram;

    reg clk;
    reg cs;
    reg we;
    reg [3:0] addr;
    reg [3:0] burst_len;
    reg [7:0] data_in;
    wire [7:0] data_out;

    burst_mode_sram uut (
        .clk(clk),
        .cs(cs),
        .we(we),
        .addr(addr),
        .burst_len(burst_len),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        cs = 0;
        we = 0;
        addr = 0;
        burst_len = 4;
        data_in = 0;

        #10 cs = 1; we = 1; addr = 4'd3; data_in = 8'hA5;
        #10 cs = 0;

        #10 cs = 1; we = 0; addr = 4'd3;
        #10 cs = 0;

        #10 if (data_out != 8'hA5) $display("Test failed: expected A5, got %h", data_out);
        else $display("Test passed: got %h", data_out);

        #10 cs = 1; we = 1; addr = 4'd2; burst_len = 4'd2; data_in = 8'hB6;
        #10 cs = 0;
        #10 cs = 1; we = 0; addr = 4'd2;
        #10 cs = 0;
        #10 if (data_out != 8'hB6) $display("Test Case 1 failed: expected B6, got %h", data_out);
        else $display("Test Case 1 passed: got %h", data_out);

        #10 cs = 1; we = 1; addr = 4'd4; burst_len = 4'd4; data_in = 8'hC7;
        #10 cs = 0;
        #10 cs = 1; we = 0; addr = 4'd4;
        #10 cs = 0;
        #10 if (data_out != 8'hC7) $display("Test Case 2 failed: expected C7, got %h", data_out);
        else $display("Test Case 2 passed: got %h", data_out);

        #10 cs = 1; we = 1; addr = 4'd6; burst_len = 4'd8; data_in = 8'hD8;
        #10 cs = 0;
        #10 cs = 1; we = 0; addr = 4'd6;
        #10 cs = 0;
        #10 if (data_out != 8'hD8) $display("Test Case 3 failed: expected D8, got %h", data_out);
        else $display("Test Case 3 passed: got %h", data_out);

        #10 cs = 1; we = 1; addr = 4'd8; burst_len = 4'd1; data_in = 8'hE9;
        #10 cs = 0;
        #10 cs = 1; we = 0; addr = 4'd8;
        #10 cs = 0;
        #10 if (data_out != 8'hE9) $display("Test Case 4 failed: expected E9, got %h", data_out);
        else $display("Test Case 4 passed: got %h", data_out);

        #10 cs = 1; we = 1; addr = 4'd10; burst_len = 4'd3; data_in = 8'hFA;
        #10 cs = 0;
        #10 cs = 1; we = 0; addr = 4'd10;
        #10 cs = 0;
        #10 if (data_out != 8'hFA) $display("Test Case 5 failed: expected FA, got %h", data_out);
        else $display("Test Case 5 passed: got %h", data_out);

        #10 cs = 1; we = 1; addr = 4'd12; burst_len = 4'd6; data_in = 8'hAB;
        #10 cs = 0;
        #10 cs = 1; we = 0; addr = 4'd12;
        #10 cs = 0;
        #10 if (data_out != 8'hAB) $display("Test Case 6 failed: expected AB, got %h", data_out);
        else $display("Test Case 6 passed: got %h", data_out);

        #10 cs = 1; we = 1; addr = 4'd14; burst_len = 4'd5; data_in = 8'hBC;
        #10 cs = 0;
        #10 cs = 1; we = 0; addr = 4'd14;
        #10 cs = 0;
        #10 if (data_out != 8'hBC) $display("Test Case 7 failed: expected BC, got %h", data_out);
        else $display("Test Case 7 passed: got %h", data_out);

        #10 cs = 1; we = 1; addr = 4'd1; burst_len = 4'd7; data_in = 8'hCD;
        #10 cs = 0;
        #10 cs = 1; we = 0; addr = 4'd1;
        #10 cs = 0;
        #10 if (data_out != 8'hCD) $display("Test Case 8 failed: expected CD, got %h", data_out);
        else $display("Test Case 8 passed: got %h", data_out);

        #10 cs = 1; we = 1; addr = 4'd9; burst_len = 4'd9; data_in = 8'hDE;
        #10 cs = 0;
        #10 cs = 1; we = 0; addr = 4'd9;
        #10 cs = 0;
        #10 if (data_out != 8'hDE) $display("Test Case 9 failed: expected DE, got %h", data_out);
        else $display("Test Case 9 passed: got %h", data_out);

        $stop;
    end
endmodule
