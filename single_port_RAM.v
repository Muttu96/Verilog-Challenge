`timescale 1ns / 1ps

module SINGLE_PORT_RAM #(parameter data_width=8,
                         parameter addr_width=4)
    (
    input clk,we,
    input [addr_width-1:0] addr,
    input [data_width-1:0] data_in,
    output reg [data_width-1:0] data_out
    );
    
    reg [data_width-1:0] ram [0:(1<<addr_width)-1];
    integer i;
    
    initial begin
    for(i=0; i<(1<<addr_width); i=i+1) begin
    ram[i]=0;
    end
    data_out=0;
    end
    
    always @ (posedge clk) begin
        if(we) begin
            ram[addr] <= data_in;
        end
        else begin
            data_out <= ram[addr];
        end
    end 
endmodule