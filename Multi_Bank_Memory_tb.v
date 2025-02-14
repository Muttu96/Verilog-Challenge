`timescale 1ns / 1ps

module tb_multi_bank_memory;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;
    parameter NUM_BANKS  = 4;

    reg clk;
    reg we;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;
    reg [1:0] bank_sel;
    wire [DATA_WIDTH-1:0] dout;

    multi_bank_memory #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .NUM_BANKS(NUM_BANKS)
    ) uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .bank_sel(bank_sel),
        .dout(dout)
    );

    always #5 clk = ~clk;

    /*
    Test Sequence:
    - Initialize all signals.
    - Perform multiple write operations across different banks.
    - Read back stored values to verify memory operations.
    */
    initial begin
        clk = 0;
        we = 0;
        addr = 0;
        din = 0;
        bank_sel = 0;

        #10 we = 1; addr = 4'h2; din = 8'hA5; bank_sel = 2'b00;
        #10 we = 1; addr = 4'h3; din = 8'h5A; bank_sel = 2'b01;
        #10 we = 1; addr = 4'h4; din = 8'hB3; bank_sel = 2'b10;
        #10 we = 1; addr = 4'h5; din = 8'h7E; bank_sel = 2'b11;
        #10 we = 0;

        #10 addr = 4'h2; bank_sel = 2'b00;
        #10 addr = 4'h3; bank_sel = 2'b01;
        #10 addr = 4'h4; bank_sel = 2'b10;
        #10 addr = 4'h5; bank_sel = 2'b11;

        #10 we = 1; addr = 4'h6; din = 8'hC7; bank_sel = 2'b00;
        #10 we = 1; addr = 4'h7; din = 8'hD9; bank_sel = 2'b01;
        #10 we = 1; addr = 4'h8; din = 8'hE2; bank_sel = 2'b10;
        #10 we = 1; addr = 4'h9; din = 8'hF4; bank_sel = 2'b11;
        #10 we = 0;

        #10 addr = 4'h6; bank_sel = 2'b00;
        #10 addr = 4'h7; bank_sel = 2'b01;
        #10 addr = 4'h8; bank_sel = 2'b10;
        #10 addr = 4'h9; bank_sel = 2'b11;

        #20 $finish;
    end

    initial begin
        $monitor("Time = %0t | WE = %b | Bank = %b | Addr = %h | Data In = %h | Data Out = %h",
                 $time, we, bank_sel, addr, din, dout);
    end

endmodule
