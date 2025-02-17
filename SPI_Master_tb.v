`timescale 1ns / 1ps

module spi_master_tb;

reg clk;
reg rst;
reg start;
reg [7:0] data_in;
wire [7:0] data_out;
wire sclk;
wire mosi;
reg miso;
wire cs;

spi_master uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .data_out(data_out),
    .sclk(sclk),
    .mosi(mosi),
    .miso(miso),
    .cs(cs)
);

always #5 clk = ~clk; 

initial begin
  
    clk = 0;
    rst = 1;
    start = 0;
    data_in = 8'hA5;
    miso = 0;

   
    #10 rst = 0;
    #10 rst = 1;
    #10 rst = 0;
    
   
    #10 start = 1;

  
    #20 miso = 1;
    #20 miso = 0;
    #20 miso = 1;
    #20 miso = 0;
    #20 miso = 1;
    #20 miso = 0;
    #20 miso = 1;
    #20 miso = 0;

    #100 $finish;
end

endmodule