`timescale 1ns / 1ps


module spi_slave_tb;

reg clk;
reg rst;
reg sclk;
reg cs;
reg mosi;
wire miso;
reg [7:0] data_in;
wire [7:0] data_out;

spi_slave uut (
    .clk(clk),
    .rst(rst),
    .sclk(sclk),
    .cs(cs),
    .mosi(mosi),
    .miso(miso),
    .data_out(data_out),
    .data_in(data_in)
);

always #5 clk = ~clk;

initial begin
 
    clk = 0;
    rst = 1;
    sclk = 0;
    cs = 1;
    mosi = 0;
    data_in = 8'h5A;

   
    #10 rst = 0;
    #10 rst = 1;
    #10 rst = 0;
    
    #10 cs = 0;

    repeat (8) begin
        #20 sclk = 1; mosi = data_in[7];
        #20 sclk = 0; data_in = {data_in[6:0], data_in[7]};
    end

   
    #20 cs = 1;

    #100 $finish;
end

endmodule