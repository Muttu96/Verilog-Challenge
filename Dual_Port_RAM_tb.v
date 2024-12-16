`timescale 1ns / 1ps

module DUAL_PORT_RAM_TB();
parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 4;
reg clk;
reg we_a, we_b;
reg [ADDR_WIDTH-1:0] addr_a, addr_b;
reg [DATA_WIDTH-1:0] data_in_a, data_in_b;
wire [DATA_WIDTH-1:0] data_out_a, data_out_b;
DUAL_PORT_RAM #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
        ) uut (
        .clk(clk),
        .we_a(we_a),
        .we_b(we_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .data_in_a(data_in_a),
        .data_in_b(data_in_b),
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    );

always begin
#5 clk = ~clk; 
end

initial begin
clk = 0;
we_a = 0;
we_b = 0;
addr_a = 0;
addr_b = 0;
data_in_a = 0;
data_in_b = 0;

#10;
we_a = 1; 
addr_a = 4'b0001;
data_in_a = 8'hab;
#10;  
we_a = 0; 

#10;
we_a = 1; 
addr_a = 4'b0010;
data_in_a = 8'hcd; 
#10; 
we_a = 0; 

#10;
we_a = 1; 
addr_a = 4'b0011;
data_in_a = 8'hef; 
#10; 
we_a = 0; 

#10;
addr_a = 4'b0001;
addr_a = 4'b0010;
addr_a = 4'b0011;

#10;
we_b = 1;
addr_b = 4'b0100;
data_in_b = 8'h12;
#10; 
we_b = 0;  

#10;
we_b = 1;
addr_b = 4'b0101;
data_in_b = 8'h34;
#10; 
we_b = 0;

#10;
we_b = 1;
addr_b = 4'b0110;
data_in_b = 8'h56;
#10;  
we_b = 0;

#10;
addr_b = 4'b0100; 
addr_b = 4'b0101;
addr_b = 4'b0110;

#20;
$finish;
end

endmodule