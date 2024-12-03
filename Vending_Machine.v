`timescale 1ns / 1ps

module VENDING_MACHINE(
    input clk,reset,
    input [7:0] deposited_amount,
    input [3:0] item_code,
    output reg dispense,
    output reg [7:0] balance
    );
    
    parameter item_1_price=8'd10;
    parameter item_2_price=8'd20;
    parameter item_3_price=8'd50;
    parameter item_4_price=8'd80;
    parameter item_5_price=8'd100;
    parameter item_6_price=8'd120;
    parameter item_7_price=8'd150;
    parameter item_8_price=8'd200;
    parameter item_9_price=8'd220;
    parameter item_10_price=8'd250;
    
    reg [7:0] item_price;
    
    always @(*) begin
      case(item_code)
        4'b0001: item_price = item_1_price;
        4'b0010: item_price = item_2_price;
        4'b0011: item_price = item_3_price;
        4'b0100: item_price = item_4_price;
        4'b0101: item_price = item_5_price;
        4'b0110: item_price = item_6_price;
        4'b0111: item_price = item_7_price;
        4'b1000: item_price = item_8_price;
        4'b1001: item_price = item_9_price;
        4'b1010: item_price = item_10_price;
        default: item_price = 4'b0000;
      endcase
    end
    
    always @(posedge clk or posedge reset) begin
       if(reset) begin
          dispense <= 0;
          balance <= 8'd0;
       end else begin
         if(deposited_amount >= item_price) begin
            dispense <= 1;
            balance <= deposited_amount - item_price;
         end else begin
            dispense <= 0;
            balance <= deposited_amount;
         end
       end
    end
endmodule