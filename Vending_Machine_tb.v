`timescale 1ns / 1ps

module VENDING_MACHINE_TB();
reg clk;
reg reset;
reg [7:0] deposited_amount;
reg [3:0] item_code;
wire dispense;
wire [7:0] balance;
VENDING_MACHINE DM (
    .clk(clk),
    .reset(reset), 
    .deposited_amount(deposited_amount), 
    .item_code(item_code), 
    .dispense(dispense), 
    .balance(balance)
    );
    initial begin
    clk=0;
    reset=1;
    deposited_amount=0;
    item_code=0;
    
    #5 reset=0;
    
    deposited_amount=8'd10;
    item_code=4'b0001;
    #10;
    
    deposited_amount=8'd15;
    item_code=4'b0010;
    #10;
    
    deposited_amount=8'd60;
    item_code=4'b0011;
    #10;
    
    deposited_amount=8'd80;
    item_code=4'b0100;
    #10;
    
    deposited_amount=8'd110;
    item_code=4'b0101;
    #10;
    
    deposited_amount=8'd110;
    item_code=4'b0110;
    #10;
    
    deposited_amount=8'd150;
    item_code=4'b0111;
    #10;
    
    deposited_amount=8'd180;
    item_code=4'b1000;
    #10;
    
    deposited_amount=8'd230;
    item_code=4'b1001;
    #10;
    
    deposited_amount=8'd255;
    item_code=4'b1010;
    #10;
 
    $finish;
    end
    
    always #5 clk=~clk;
    
endmodule