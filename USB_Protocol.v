`timescale 1ns / 1ps

module usb_device (
    input wire clk,
    input wire rst,
    input wire usb_dp,
    input wire usb_dm,
    output reg usb_en,
    output reg [7:0] data_out
);

    reg [7:0] data_buffer;
    reg data_ready;
    
    // Simple state machine to emulate USB data handling
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            usb_en <= 0;
            data_buffer <= 0;
            data_ready <= 0;
            data_out <= 0;
        end else begin
            if (usb_dp && usb_dm) begin
                usb_en <= 1;
                data_buffer <= data_buffer + 1;
                data_ready <= 1;
            end else begin
                usb_en <= 0;
                data_ready <= 0;
            end
            
            if (data_ready) begin
                data_out <= data_buffer;
            end
        end
    end
endmodule