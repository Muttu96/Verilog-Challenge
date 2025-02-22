`timescale 1ns / 1ps

module Enhanced_PC_tb;

    reg clk, reset, enable, hold, load;
    reg [7:0] load_value;
    reg [2:0] step_size;
    wire [7:0] pc_out;

    Enhanced_PC uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .hold(hold),
        .load_value(load_value),
        .load(load),
        .step_size(step_size),
        .pc_out(pc_out)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | PC=%d | Reset=%b | Enable=%b | Hold=%b | Load=%b | Load Value=%d | Step Size=%d", 
                 $time, pc_out, reset, enable, hold, load, load_value, step_size);

        clk = 0; reset = 1; enable = 0; hold = 0; load = 0; step_size = 3'b001; load_value = 8'b00000000;
        #10 reset = 0; enable = 1;

        #10 step_size = 3'b001;  
        #10 step_size = 3'b010;  
        #10 step_size = 3'b100;  

        #10 hold = 1;  
        #10 hold = 0;  

        #10 load = 1; load_value = 8'b01010101;  
        #10 load = 0;  

        #10 step_size = 3'b011;  
        #10 step_size = 3'b101;  
        #10 step_size = 3'b110;  

        #10 enable = 0;  
        #10 enable = 1;  
        #10 hold = 1;  
        #10 hold = 0;  

        #10 load = 1; load_value = 8'b11111111;  
        #10 load = 0;  

        #10 reset = 1;  
        #10 reset = 0;  

        #20 $finish;
    end

endmodule
