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

reg [1:0] attempts;           // Counter for incorrect attempts
reg [5:0] lock_timer;         // Timer for lock duration
reg lock_timer_active;        // Flag to indicate lock is active

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset the system
        access_granted <= 0;
        access_denied <= 0;
        attempts <= 0;
        lock_timer_active <= 0;
        lock_timer <= 0;
    end 
    else if (lock_timer_active) begin
        // Lock active, increment timer
        if (lock_timer < LOCK_DURATION) begin
            lock_timer <= lock_timer + 1;
        end else begin
            // Unlock system after timer expires
            lock_timer_active <= 0;
            lock_timer <= 0;
            attempts <= 0;  // Reset attempts after lock duration
            access_denied <= 0;
        end
    end 
    else begin
        // Normal operation
        if (pin_input == CORRECT_PIN) begin
            access_granted <= 1;
            access_denied <= 0;
            attempts <= 0;  // Reset attempts on successful entry
        end 
        else begin
            access_granted <= 0;
            if (attempts < MAX_ATTEMPTS) begin
                attempts <= attempts + 1;
            end
            if (attempts == MAX_ATTEMPTS - 1) begin
                // Trigger access denied on the 3rd incorrect attempt
                access_denied <= 1;
                lock_timer_active <= 1;
            end else begin
                access_denied <= 0;  // Do not deny access until max attempts reached
            end
        end
    end
end

endmodule