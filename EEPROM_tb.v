`timescale 1ns / 1ps

module EEPROM_TB();
reg [3:0] addr;
reg we;
reg clk;
reg erase;
reg [15:0] data_in;
wire [15:0] data_out;

EEPROM MD (.addr(addr),
           .we(we),
           .clk(clk),
           .erase(erase),
           .data_in(data_in),
           .data_out(data_out)); 

initial clk = 0;
    always #5 clk = ~clk; 
initial begin
clk=1; 
we=0; 
erase=0; 
data_in=8'h00; 
addr=4'd0;

#10 addr = 4'd0;
#10 addr = 4'd1;
#10 addr = 4'd2;
#10 addr = 4'd3;
#10 addr = 4'd4;
#10 addr = 4'd5;
#10 addr = 4'd6;
#10 addr = 4'd7;
#10 addr = 4'd8;
#10 addr = 4'd9;
#10 addr = 4'd10;
#10 addr = 4'd11;
#10 addr = 4'd12;
#10 addr = 4'd13;
#10 addr = 4'd14;
#10 addr = 4'd15;

#10 erase=1; addr=4'd7;
#10 erase=0;
#10 we=1; addr=4'd7; data_in=16'haa;
#10 we=0;
#10 erase=1; addr=4'd9;
#10 erase=0;
#10 we=1; addr=4'd9; data_in=16'hbb;
#10 we=0;
#10 erase=1; addr=4'd11;
#10 erase=0;
#10 we=1; addr=4'd11; data_in=16'hcc;
#10 we=0;
#10 erase=1; addr=4'd13;
#10 erase=0;
#10 we=1; addr=4'd13; data_in=16'hdd;
#10 we=0;

#10 $finish;
end    
endmodule