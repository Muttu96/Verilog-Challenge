`timescale 1ns / 1ps

module Phone_security_system(
    input [15:0] pin_input,
    input clk,
    input reset,
    output reg access_granted,
    output reg access_denied
);

parameter [15:0] CORRECT_PIN = 16'b1000_0110_0100_0010;
parameter MAX_ATTEMPTS = 3;
parameter LOCK_DURATION = 5;

reg [1:0] attempts;          
reg [5:0] lock_timer;      
reg lock_timer_active;      

always @(posedge clk or posedge reset) begin
    if (reset) begin

        access_granted <= 0;
        access_denied <= 0;
        attempts <= 0;
        lock_timer_active <= 0;
        lock_timer <= 0;
    end 
    else if (lock_timer_active) begin
        
        if (lock_timer < LOCK_DURATION) begin
            lock_timer <= lock_timer + 1;
        end else begin

            lock_timer_active <= 0;
            lock_timer <= 0;
            attempts <= 0;  
            access_denied <= 0;
        end
    end 
    else begin

        if (pin_input == CORRECT_PIN) begin
            access_granted <= 1;
            access_denied <= 0;
            attempts <= 0;  
        end 
        else begin
            access_granted <= 0;
            if (attempts < MAX_ATTEMPTS) begin
                attempts <= attempts + 1;
            end
            if (attempts == MAX_ATTEMPTS - 1) begin
            
                access_denied <= 1;
                lock_timer_active <= 1;
            end else begin
                access_denied <= 0;  
            end
        end
    end
end

endmodule
