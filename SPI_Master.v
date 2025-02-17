`timescale 1ns / 1ps

module spi_master (
    input wire clk,
    input wire rst,
    input wire start,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output reg sclk,
    output reg mosi,
    input wire miso,
    output reg cs
);

reg [2:0] bit_cnt;
reg [7:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        sclk <= 0;
        mosi <= 0;
        cs <= 1;
        bit_cnt <= 0;
        shift_reg <= 0;
        data_out <= 0;
    end else if (start) begin
        cs <= 0;
        sclk <= ~sclk;
        if (sclk == 0) begin
            mosi <= data_in[7 - bit_cnt];
            shift_reg <= {shift_reg[6:0], miso};
            bit_cnt <= bit_cnt + 1;
            if (bit_cnt == 7) begin
                cs <= 1;
                data_out <= shift_reg;
                bit_cnt <= 0;
            end
        end
    end
end

endmodule