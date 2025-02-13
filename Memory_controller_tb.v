`timescale 1ns / 1ps

module memory_controller_tb;

    reg clk;
    reg reset;
    reg [2:0] req;
    wire [2:0] grant;
    wire [1:0] arbiter_state; // debug: current state

    // Instantiate the Unit Under Test (UUT)
    memory_controller uut (
        .clk(clk),
        .reset(reset),
        .req(req),
        .grant(grant),
        .arbiter_state(arbiter_state)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Stimulus Process
    initial begin
        // Initialize Inputs
        reset = 1;
        req = 3'b000;
        #10 reset = 0; // Release reset after 10ns

        // Apply Test Vectors
        #10 req = 3'b001; // Request from source 0
        #10 req = 3'b010; // Request from source 1
        #10 req = 3'b100; // Request from source 2
        #10 req = 3'b011; // Request from source 0 and 1
        #10 req = 3'b101; // Request from source 0 and 2
        #10 req = 3'b110; // Request from source 1 and 2
        #10 req = 3'b111; // Request from all sources
        #10 req = 3'b000; // No request

        #20 $finish; // End simulation
    end

    // Monitor Outputs
    initial begin
        $monitor("Time: %0t | clk: %b | reset: %b | req: %b | grant: %b | arbiter_state: %b",
                 $time, clk, reset, req, grant, arbiter_state);
    end
endmodule
