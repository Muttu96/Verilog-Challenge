`timescale 1ns / 1ps

module Enhanced_PC (
    input clk,
    input reset,
    input enable,
    input hold,
    input [7:0] load_value,
    input load,
    input [2:0] step_size,
    output reg [7:0] pc_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) 
            pc_out <= 8'b00000000;
        else if (enable) begin
            if (hold) 
                pc_out <= pc_out;
            else if (load) 
                pc_out <= load_value;
            else 
                pc_out <= pc_out + step_size;
        end
    end

endmodule
