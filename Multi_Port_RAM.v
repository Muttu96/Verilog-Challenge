`timescale 1ns / 1ps

module multiport_ram (
    input clk,
    input [3:0] addr_a, addr_b, addr_c, addr_d,
    input [7:0] data_in_a, data_in_b, data_in_c, data_in_d,
    input we_a, we_b, we_c, we_d,
    output reg [7:0] data_out_a, data_out_b, data_out_c, data_out_d
);

    // Declare RAM
    reg [7:0] ram [15:0];
    integer i;
    
    initial begin
    for(i=0; i<4;i=i+1)begin
    ram[i]=0;
    end
    data_out_a=0;
    data_out_b=0;
    data_out_c=0;
    data_out_d=0;
    end
    
    always @(posedge clk) begin
        if (we_a) begin
            ram[addr_a] <= data_in_a;
            data_out_a <= data_in_a;  // Update output directly
        end else begin
            data_out_a <= ram[addr_a];
        end
    end

    always @(posedge clk) begin
        if (we_b) begin
            ram[addr_b] <= data_in_b;
            data_out_b <= data_in_b;  // Update output directly
        end else begin
            data_out_b <= ram[addr_b];
        end
    end

    always @(posedge clk) begin
        if (we_c) begin
            ram[addr_c] <= data_in_c;
            data_out_c <= data_in_c;  // Update output directly
        end else begin
            data_out_c <= ram[addr_c];
        end
    end

    always @(posedge clk) begin
        if (we_d) begin
            ram[addr_d] <= data_in_d;
            data_out_d <= data_in_d;  // Update output directly
        end else begin
            data_out_d <= ram[addr_d];
        end
    end
endmodule