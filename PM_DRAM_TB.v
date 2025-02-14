`timescale 1ns / 1ps

module tb_page_mode_dram;

    reg clk;
    reg cs;
    reg we;
    reg [3:0] row;
    reg [3:0] col;
    reg [7:0] data_in;
    wire [7:0] data_out;

    page_mode_dram uut (
        .clk(clk),
        .cs(cs),
        .we(we),
        .row(row),
        .col(col),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        cs = 0;
        we = 0;
        row = 0;
        col = 0;
        data_in = 0;

        #10 cs = 1; we = 1; row = 4'd3; col = 4'd2; data_in = 8'hA5;
        #10 cs = 0;
        #10 cs = 1; we = 0; row = 4'd3; col = 4'd2;
        #10 cs = 0;
        #10 if (data_out != 8'hA5) $display("Test Case 1 failed: expected A5, got %h", data_out);
            else $display("Test Case 1 passed: got %h", data_out);

        #10 cs = 1; we = 1; row = 4'd5; col = 4'd10; data_in = 8'hB6;
        #10 cs = 0;
        #10 cs = 1; we = 0; row = 4'd5; col = 4'd10;
        #10 cs = 0;
        #10 if (data_out != 8'hB6) $display("Test Case 2 failed: expected B6, got %h", data_out);
            else $display("Test Case 2 passed: got %h", data_out);

        #10 cs = 1; we = 1; row = 4'd0; col = 4'd0; data_in = 8'hC7;
        #10 cs = 0;
        #10 cs = 1; we = 0; row = 4'd0; col = 4'd0;
        #10 cs = 0;
        #10 if (data_out != 8'hC7) $display("Test Case 3 failed: expected C7, got %h", data_out);
            else $display("Test Case 3 passed: got %h", data_out);

        #10 cs = 1; we = 1; row = 4'd15; col = 4'd15; data_in = 8'hD8;
        #10 cs = 0;
        #10 cs = 1; we = 0; row = 4'd15; col = 4'd15;
        #10 cs = 0;
        #10 if (data_out != 8'hD8) $display("Test Case 4 failed: expected D8, got %h", data_out);
            else $display("Test Case 4 passed: got %h", data_out);

        #10 cs = 1; we = 1; row = 4'd8; col = 4'd8; data_in = 8'hE9;
        #10 cs = 0;
        #10 cs = 1; we = 0; row = 4'd8; col = 4'd8;
        #10 cs = 0;
        #10 if (data_out != 8'hE9) $display("Test Case 5 failed: expected E9, got %h", data_out);
            else $display("Test Case 5 passed: got %h", data_out);

        $stop;
    end
endmodule
