`timescale 1ns / 1ps

module BRIDGE_TB;

    reg hclk;
    reg hresetn;
    reg hselapb;
    reg hwrite;
    reg [1:0] htrans;
    reg [31:0] haddr;
    reg [31:0] hwdata;
    reg [31:0] prdata;

    wire [31:0] paddr;
    wire [31:0] pwdata;
    wire psel;
    wire penable;
    wire pwrite;
    wire hresp;
    wire hready;
    wire [31:0] hrdata;

    BRIDGE DUT (
        .hclk(hclk),
        .hresetn(hresetn),
        .hselapb(hselapb),
        .hwrite(hwrite),
        .htrans(htrans),
        .haddr(haddr),
        .hwdata(hwdata),
        .prdata(prdata),
        .paddr(paddr),
        .pwdata(pwdata),
        .psel(psel),
        .penable(penable),
        .pwrite(pwrite),
        .hresp(hresp),
        .hready(hready),
        .hrdata(hrdata)
    );

    always #5 hclk = ~hclk;

    initial begin
        hclk = 0;
        hresetn = 0;
        hselapb = 0;
        hwrite = 0;
        htrans = 2'b00;
        haddr = 32'b0;
        hwdata = 32'b0;
        prdata = 32'b0;

        #10 hresetn = 1;
        #10 hselapb = 0; htrans = 2'b00; haddr = 32'h0; hwdata = 32'h0;
        #20 hselapb = 1; hwrite = 0; htrans = 2'b10; haddr = 32'hA000_0000;
        #10 prdata = 32'hDEAD_BEEF;
        #20 hselapb = 1; hwrite = 1; htrans = 2'b10; haddr = 32'hB000_0000; hwdata = 32'hCAFE_BABE;
        #20 hselapb = 1; hwrite = 0; htrans = 2'b10; haddr = 32'hC000_0000;
        #10 prdata = 32'h1234_5678;
        #20 hselapb = 0; hwrite = 0; htrans = 2'b00;
        #50 $stop;
    end

    initial begin
        $monitor("Time: %0dns | hclk: %b | hresetn: %b | hselapb: %b | hwrite: %b | htrans: %b | haddr: %h | hwdata: %h | prdata: %h | paddr: %h | pwdata: %h | psel: %b | penable: %b | pwrite: %b | hready: %b | hrdata: %h",
                 $time, hclk, hresetn, hselapb, hwrite, htrans, haddr, hwdata, prdata, paddr, pwdata, psel, penable, pwrite, hready, hrdata);
    end

endmodule