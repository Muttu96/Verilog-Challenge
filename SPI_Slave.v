`timescale 1ns / 1ps

module spi_slave (
    input wire clk,
    input wire rst,
    input wire sclk,
    input wire cs,
    input wire mosi,
    output reg miso,
    output reg [7:0] data_out,
    input wire [7:0] data_in
);

reg [2:0] bit_cnt;
reg [7:0] shift_reg;

always @(posedge sclk or posedge rst) begin
    if (rst) begin
        bit_cnt <= 0;
        shift_reg <= 0;
        data_out <= 0;
    end else if (cs == 0) begin
        shift_reg <= {shift_reg[6:0], mosi};
        bit_cnt <= bit_cnt + 1;
        if (bit_cnt == 7) begin
            data_out <= shift_reg;
            bit_cnt <= 0;
        end
    end
end

always @(negedge sclk or posedge rst) begin
    if (rst) begin
        miso <= 0;
    end else if (cs == 0) begin
        miso <= data_in[7 - bit_cnt];
    end
end

endmodule