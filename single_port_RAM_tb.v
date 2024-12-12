`timescale 1ns / 1ps

module SINGLE_PORT_RAM_TB();
parameter data_width=8;
parameter addr_width=4;
reg clk;
reg we;
reg [addr_width-1:0] addr;
reg [data_width-1:0] data_in;
wire [data_width-1:0] data_out;
SINGLE_PORT_RAM #(
            .data_width(data_width),
            .addr_width(addr_width)
            ) DM (
            .clk(clk),
            .we(we),
            .addr(addr),
            .data_in(data_in),
            .data_out(data_out)
            );
            
initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
we=0;
addr=0;
data_in=0;

#10;
we=1; addr=4'd0; data_in=8'h3C;

#10;
we=0; addr=4'd0;

#10;
we=1; addr=4'd1; data_in=8'h7E;

#10;
we=0; addr=4'd1;

#10;
we=1; addr=4'd3; data_in=8'hA1;

#10;
we=0; addr=4'd3;

#10;
we=1; addr=4'd4; data_in=8'hD5;

#10;
we=0; addr=4'd4;

#10;
we=1; addr=4'd5; data_in=8'h38;

#10;
we=0; addr=4'd5;

#10;
we=1; addr=4'd6; data_in=8'h75;

#10;
we=0; addr=4'd6;

#10;
we=1; addr=4'd7; data_in=8'hA9;

#10;
we=0; addr=4'd7;

#10;
we=1; addr=4'd8; data_in=8'h85;

#10;
we=0; addr=4'd8;

#10;
$stop;

end
endmodule
