`timescale 1ns / 1ps

module mux_8x1_tb;

  // Inputs to the DUT (Device Under Test)
  reg [7:0] I;
  reg [2:0] S;
  
  // Output from the DUT
  wire Y;
  
  // Instantiate the 8x1 MUX
  mux_8x1 uut (
    .I(I),
    .S(S),
    .Y(Y)
  );
  
  initial begin
    // Initialize Inputs
    I = 8'b00000000; 
    S = 3'b000;
    
    // Apply a comprehensive set of test vectors
    // Test all possible select lines for two different input patterns
    
    // First Input Pattern: 10101010
    #10 I = 8'b10101010; S = 3'b000; // Y = I[0] = 0
    #10 S = 3'b001;                  // Y = I[1] = 1
    #10 S = 3'b010;                  // Y = I[2] = 0
    #10 S = 3'b011;                  // Y = I[3] = 1
    #10 S = 3'b100;                  // Y = I[4] = 0
    #10 S = 3'b101;                  // Y = I[5] = 1
    #10 S = 3'b110;                  // Y = I[6] = 0
    #10 S = 3'b111;                  // Y = I[7] = 1
    
    // Second Input Pattern: 11110000
    #10 I = 8'b11110000; S = 3'b000; // Y = I[0] = 0
    #10 S = 3'b001;                   // Y = I[1] = 0
    #10 S = 3'b010;                   // Y = I[2] = 0
    #10 S = 3'b011;                   // Y = I[3] = 0
    #10 S = 3'b100;                   // Y = I[4] = 1
    #10 S = 3'b101;                   // Y = I[5] = 1
    #10 S = 3'b110;                   // Y = I[6] = 1
    #10 S = 3'b111;                   // Y = I[7] = 1

    // Additional Test Cases
    #10 I = 8'b00001111; S = 3'b010; // Y = I[2] = 0
    #10 S = 3'b101;                   // Y = I[5] = 1

    // Finish the simulation
    #10 $finish;
  end
  
  // Monitor the inputs and output
  initial begin
    $monitor("Time = %0t, I = %b, S = %b, Y = %b", $time, I, S, Y);
  end
  
endmodule
