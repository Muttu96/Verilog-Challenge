`timescale 1ns / 1ps

module EPROM(
    input wire clk,
    input wire [3:0] addr,
    input wire we,
    input wire [15:0] write_data,
    input wire erase,
    output reg [15:0] data
);

    reg [15:0] eprom [15:0];
    integer i;

    initial begin
        eprom[0]  = 16'h0001; eprom[1]  = 16'h0002; eprom[2]  = 16'h0003; eprom[3]  = 16'h0004;
        eprom[4]  = 16'h0005; eprom[5]  = 16'h0006; eprom[6]  = 16'h0007; eprom[7]  = 16'h0008;
        eprom[8]  = 16'h0009; eprom[9]  = 16'h000A; eprom[10] = 16'h000B; eprom[11] = 16'h000C;
        eprom[12] = 16'h000D; eprom[13] = 16'h000E; eprom[14] = 16'h000F; eprom[15] = 16'h0010;
    end

    always @(posedge clk) begin
        if (erase) begin
            for (i = 0; i < 16; i = i + 1) begin
                eprom[i] <= 16'h0000;
            end
        end else if (we) begin
            eprom[addr] <= write_data;
        end
    end

    always @(*) begin
        data = eprom[addr];
    end

endmodule
