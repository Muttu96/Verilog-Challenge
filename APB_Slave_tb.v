`timescale 1ns / 1ps

module APB_SLAVE_TB;

    reg        PCLK;
    reg        PRESETn;
    reg        PSEL;
    reg        PENABLE;
    reg        PWRITE;
    reg [31:0] PADDR;
    reg [31:0] PWDATA;

    wire [31:0] PRDATA;
    wire        PREADY;
    wire [1:0]  PSLVERR;

    APB_SLAVE uut (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PREADY(PREADY),
        .PSLVERR(PSLVERR)
    );

    always #5 PCLK = ~PCLK;  

    initial begin
        PCLK    = 0;
        PRESETn = 0;
        PSEL    = 0;
        PENABLE = 0;
        PWRITE  = 0;
        PADDR   = 32'd0;
        PWDATA  = 32'd0;

        #20 PRESETn = 1;
        #10;

        $display("Starting Write Transaction...");
        PSEL    = 1;
        PWRITE  = 1;
        PADDR   = 32'h40000004;
        PWDATA  = 32'hDEADBEEF;
        PENABLE = 1;
        #10 PENABLE = 0;
        #20;

        PSEL    = 0;
        PWRITE  = 0;
        #10;

        $display("Starting Read Transaction...");
        PSEL    = 1;
        PWRITE  = 0;
        PADDR   = 32'h40000004;
        PENABLE = 1;
        #10 PENABLE = 0;
        #20;

        $display("Read Data Received: %h", PRDATA);

        #50;
        $finish;
    end

    initial begin
        $monitor("Time=%0t PADDR=%h PWDATA=%h PWRITE=%b PREADY=%b PRDATA=%h PSLVERR=%b", 
                 $time, PADDR, PWDATA, PWRITE, PREADY, PRDATA, PSLVERR);
    end

endmodule
