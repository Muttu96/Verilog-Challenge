`timescale 1ns / 1ps

module Universal_Shift_Register (
    input clk,
    input reset,
    input [1:0] select,
    input hold_data,
    input shift_right,
    input shift_left,
    input [3:0] parallel_in,
    output reg [3:0] data_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) 
            data_out <= 4'b0000;
        else begin
            case (select)
                2'b00: data_out <= data_out;                       
                2'b01: data_out <= {shift_right, data_out[3:1]}; 
                2'b10: data_out <= {data_out[2:0], shift_left}; 
                2'b11: data_out <= parallel_in;             
            endcase
        end
    end
endmodule

