`timescale 1ns / 1ps

module tb_i2c_slave;
    reg clk;
    reg rst;
    reg scl;
    wire sda;
    reg [6:0] slave_addr;
    reg [7:0] data_in;
    wire [7:0] data_out;
    reg sda_tb;
    reg sda_dir;

    
    i2c_slave uut (
        .clk(clk),
        .rst(rst),
        .scl(scl),
        .sda(sda),
        .data_out(data_out),
        .data_in(data_in),
        .slave_addr(slave_addr)
    );

   
    always #5 clk = ~clk;

   
    assign sda = sda_dir ? sda_tb : 1'bz;

    initial begin
       
        clk = 0;
        rst = 1;
        scl = 1;
        sda_tb = 1;
        sda_dir = 0;
        slave_addr = 7'b1010101;  
        data_in = 8'b11001100;  
        
       
        #20 rst = 0;
        
       
        #20 sda_tb = 0; scl = 1;
        
       
        #40 scl = 0; sda_tb = slave_addr[6]; sda_dir = 1; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = slave_addr[5]; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = slave_addr[4];
        #40 scl = 1;
        #40 scl = 0; sda_tb = slave_addr[3]; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = slave_addr[2]; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = slave_addr[1];
        #40 scl = 1;
        #40 scl = 0; sda_tb = slave_addr[0]; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = 0;
        #40 scl = 1;

        
        #40 scl = 0; sda_tb = data_in[7]; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = data_in[6]; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = data_in[5]; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = data_in[4]; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = data_in[3]; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = data_in[2]; 
        #40 scl = 1;
        #40 scl = 0; sda_tb = data_in[1];
        #40 scl = 1;
        #40 scl = 0; sda_tb = data_in[0]; 
        #40 scl = 1;

        
        #40 scl = 1; sda_tb = 1; sda_dir = 0;

       
        #20;

        $stop;
    end
endmodule