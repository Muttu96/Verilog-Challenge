`timescale 1ns / 1ps

module shift_register_pipeline_operations (
    input clk, reset,
    input [7:0] data_in, 
    output reg [7:0] data_out 
);

    reg [7:0] stage1, stage2, stage3, stage4;
    reg [7:0] processed_data;  

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            stage1 <= 8'b0;
            stage2 <= 8'b0;
            stage3 <= 8'b0;
            stage4 <= 8'b0;
            data_out <= 8'b0;
        end else begin
            processed_data = (data_in ^ 8'hAA) & 8'hF0;  
            stage1 <= processed_data;  
            stage2 <= stage1;          
            stage3 <= stage2;       
            stage4 <= stage3;         
            data_out <= stage4;       
        end
    end
endmodule