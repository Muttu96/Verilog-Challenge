module Dual_port_register_file_tb;
    reg clk;
    reg reset;
    reg we;
    reg [4:0] ra1, ra2, wa;
    reg [31:0] wd;
    wire [31:0] rd1, rd2;

    Dual_port_register_file uut (
        .clk(clk),
        .reset(reset),
        .we(we),
        .ra1(ra1),
        .ra2(ra2),
        .wa(wa),
        .wd(wd),
        .rd1(rd1),
        .rd2(rd2)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 1;
        we = 0;
        ra1 = 5'b00000;
        ra2 = 5'b00001;
        wa = 5'b00010;
        wd = 32'hA5A5A5A5;
        
        #5 reset = 0;
        
        #10 we = 1;
        #10 we = 0;
        
        ra1 = 5'b00010;
        ra2 = 5'b00001;
        
        #10 we = 1;
        wa = 5'b00100;
        wd = 32'h14321432;
        
        #10 we = 1;
        wa = 5'b01100;
        wd = 32'h12345678;
        
        #10 we = 0;
        ra1 = 5'b00100;
        ra2 = 5'b01100;
        
        #10 reset = 1;
        #10 reset = 0;
        
        #10 we = 1;
        wa = 5'b01000;
        wd = 32'h11223344;
        
        #10 we = 1;
        wa = 5'b01001;
        wd = 32'h55667788;
        
        #10 we = 0;
        #10 ra1 = 5'b01001;
        ra2 = 5'b01000;
        
        #10 we = 1;
        wa = 5'b01001;
        wd = 32'hDEADBEEF;
        
        #10 we = 1;
        wa = 5'b01111;
        wd = 32'h88884444;
        
        #10 we = 0;
        ra1 = 5'b01001;
        ra2 = 5'b01111;
        
        #10 we = 1;
        wa = 5'b11001;
        wd = 32'hDA1234EF;
        
        #10 we = 1;
        wa = 5'b11111;
        wd = 32'hFEDCBA98;
        
        #10 ra1 = 5'b11111;
        ra2 = 5'b11001;
        
        $stop;
    end
endmodule
