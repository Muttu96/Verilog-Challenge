module tb_CAM;
parameter WIDTH = 8;
parameter DEPTH = 16;

reg [WIDTH-1:0] data_in;
reg wr_en, clk, rst;
wire [DEPTH-1:0] match;

// Instantiate the CAM module
CAM #(WIDTH, DEPTH) cam_inst (
    .data_in(data_in),
    .wr_en(wr_en),
    .clk(clk),
    .rst(rst),
    .match(match)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    wr_en = 0;
    data_in = 0;
    
    // Reset the CAM
    #10 rst = 0;

    // Write data into CAM
    #10 wr_en = 1; data_in = 8'h3F; #10;
    #10 wr_en = 1; data_in = 8'h7A; #10;
    #10 wr_en = 1; data_in = 8'hC3; #10;
    #10 wr_en = 1; data_in = 8'h4B; #10;
    
    // Disable write enable
    #10 wr_en = 0;

    // Search for data in CAM
    #10 data_in = 8'h3F;
    #10 data_in = 8'hC3;
    #10 data_in = 8'hAA; // Not stored in CAM, should return no match

    // Finish simulation
    #20 $finish;
end

// Monitor outputs
initial begin
    $monitor("Time=%0t, data_in=%h, wr_en=%b, match=%b", $time, data_in, wr_en, match);
end

endmodule
