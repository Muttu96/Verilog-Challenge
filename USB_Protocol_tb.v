`timescale 1ns / 1ps

module tb_usb_device();

    reg clk;
    reg rst;
    reg usb_dp;
    reg usb_dm;
    wire usb_en;
    wire [7:0] data_out;
    
    // Instantiate the USB device module
    usb_device uut (
        .clk(clk),
        .rst(rst),
        .usb_dp(usb_dp),
        .usb_dm(usb_dm),
        .usb_en(usb_en),
        .data_out(data_out)
    );
    
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        usb_dp = 0;
        usb_dm = 0;
        
        // Apply reset
        rst = 1;
        #5 rst = 0;
        
        // Test case 1: No data activity
        #10 usb_dp = 0;
        usb_dm = 0;
        
        // Test case 2: Single data pulse on usb_dp
        #20 usb_dp = 1;
        #10 usb_dp = 0;
        
        // Test case 3: Single data pulse on usb_dm
        #20 usb_dm = 1;
        #10 usb_dm = 0;
        
        // Test case 4: Alternating pulses on usb_dp and usb_dm
        #20 usb_dp = 1; usb_dm = 0;
        #10 usb_dp = 0; usb_dm = 1;
        #10 usb_dp = 1; usb_dm = 0;
        #10 usb_dp = 0; usb_dm = 1;
        
        // Test case 5: Continuous data high on usb_dp
        #20 usb_dp = 1;
        #40 usb_dp = 0;
        
        // Test case 6: Continuous data high on usb_dm
        #20 usb_dm = 1;
        #40 usb_dm = 0;
        
        // Test case 7: Simultaneous pulses on usb_dp and usb_dm
        #20 usb_dp = 1; usb_dm = 1;
        #10 usb_dp = 0; usb_dm = 0;
        
        // Test case 8: Random data pattern
        #20 usb_dp = 1; usb_dm = 0;
        #10 usb_dp = 0; usb_dm = 1;
        #20 usb_dp = 1; usb_dm = 1;
        #10 usb_dp = 0; usb_dm = 0;
        
        // Finish simulation
        #50 $finish;
    end
    
    // Clock generation
    always #5 clk = ~clk;
    
endmodule