`timescale 1ns / 1ps

module uart_tx (
    input wire clk,
    input wire reset,
    input wire tx_start,
    input wire [7:0] tx_data,
    output wire tx,
    output wire tx_busy
);

    parameter CLKS_PER_BIT = 10416; // For a baud rate of 9600 with a 100MHz clock

    reg [13:0] clk_count = 0;
    reg [3:0] bit_index = 0;
    reg [9:0] tx_shift_reg = 0;
    reg tx_reg = 1;
    reg tx_busy_reg = 0;

    assign tx = tx_reg;
    assign tx_busy = tx_busy_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            clk_count <= 0;
            bit_index <= 0;
            tx_shift_reg <= 10'b1111111111;
            tx_reg <= 1;
            tx_busy_reg <= 0;
        end else begin
            if (tx_start && !tx_busy_reg) begin
                tx_shift_reg <= {1'b1, tx_data, 1'b0}; // Start bit (0), data, Stop bit (1)
                tx_busy_reg <= 1;
                clk_count <= 0;
                bit_index <= 0;
            end else if (tx_busy_reg) begin
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                    tx_reg <= tx_shift_reg[bit_index];
                    bit_index <= bit_index + 1;
                    if (bit_index == 9) begin
                        tx_busy_reg <= 0;
                    end
                end
            end
        end
    end
endmodule