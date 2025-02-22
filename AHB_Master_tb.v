`timescale 1ns / 1ps

module AHB_MASTER_TB;

    reg        HCLK;
    reg        HRESETn;
    reg        HREADY;
    reg  [1:0] HRESP;
    reg  [31:0] HRDATA;
    reg        request_write;
    reg        request_read;
    reg  [31:0] write_data;
    reg  [31:0] read_addr;
    reg  [31:0] write_addr;

    wire [31:0] HADDR;
    wire [31:0] HWDATA;
    wire        HWRITE;
    wire [2:0]  HSIZE;
    wire [2:0]  HBURST;
    wire [3:0]  HPROT;
    wire [1:0]  HTRANS;
    wire [31:0] read_data;
    wire        error_flag;

    AHB_MASTER uut (
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .HREADY(HREADY),
        .HRESP(HRESP),
        .HRDATA(HRDATA),
        .request_write(request_write),
        .request_read(request_read),
        .write_data(write_data),
        .read_addr(read_addr),
        .write_addr(write_addr),
        .HADDR(HADDR),
        .HWDATA(HWDATA),
        .HWRITE(HWRITE),
        .HSIZE(HSIZE),
        .HBURST(HBURST),
        .HPROT(HPROT),
        .HTRANS(HTRANS),
        .read_data(read_data),
        .error_flag(error_flag)
    );

    always #5 HCLK = ~HCLK;  

    initial begin
        HCLK         = 0;
        HRESETn      = 0;
        HREADY       = 1;
        HRESP        = 2'b00;
        HRDATA       = 32'h00000000;
        request_write = 0;
        request_read  = 0;
        write_data    = 32'hA5A5A5A5;
        read_addr     = 32'h40000004;
        write_addr    = 32'h40000000;

        #20 HRESETn = 1;
        #10;

        $display("Starting Write Transaction...");
        request_write = 1;
        #10 request_write = 0;
        #20;

        HREADY = 1;
        #10;

        $display("Starting Read Transaction...");
        request_read = 1;
        #10 request_read = 0;
        #20;

        HREADY = 1;
        HRDATA = 32'hDEADBEEF;
        #10;

        $display("Read Data Received: %h", read_data);

        #50;
        $finish;
    end

    initial begin
        $monitor("Time=%0t HADDR=%h HWDATA=%h HWRITE=%b HTRANS=%b HREADY=%b HRDATA=%h READ_DATA=%h ERROR=%b", 
                 $time, HADDR, HWDATA, HWRITE, HTRANS, HREADY, HRDATA, read_data, error_flag);
    end

endmodule
