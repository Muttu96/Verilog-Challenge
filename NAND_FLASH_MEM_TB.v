module testbench;

    reg clk;
    reg we;
    reg re;
    reg [7:0] address;
    reg [7:0] data_in;
    wire [7:0] data_out;

    nand_flash_memory uut (
        .clk(clk),
        .we(we),
        .re(re),
        .address(address),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        $dumpfile("nand_flash_memory.vcd");
        $dumpvars(0, testbench);

        clk = 0;
        we = 0;
        re = 0;
        address = 8'h00;
        data_in = 8'h00;

        #10 we = 1; address = 8'h01; data_in = 8'hAB; re = 0;
        #10 we = 0; re = 1; address = 8'h01;
        #10 re = 0;
        #10 we = 1; address = 8'h02; data_in = 8'hCD; re = 0;
        #10 we = 0; re = 1; address = 8'h02;
        #10 re = 0;
        #10 we = 1; address = 8'h03; data_in = 8'hEF; re = 0;
        #10 we = 0; re = 1; address = 8'h03;
        #10 re = 0;
        #10 we = 1; address = 8'h04; data_in = 8'h12; re = 0;
        #10 we = 0; re = 1; address = 8'h04;
        #10 re = 0;
        #10 we = 1; address = 8'h05; data_in = 8'h34; re = 0;
        #10 we = 0; re = 1; address = 8'h05;
        #10 re = 0;
        #10 we = 1; address = 8'h06; data_in = 8'h56; re = 0;
        #10 we = 0; re = 1; address = 8'h06;
        #10 re = 0;
        #10 we = 1; address = 8'h07; data_in = 8'h78; re = 0;
        #10 we = 0; re = 1; address = 8'h07;
        #10 re = 0;
        #10 $finish;
    end

    always #5 clk = ~clk;

endmodule
