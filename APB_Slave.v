`timescale 1ns / 1ps

module APB_SLAVE (
    input  wire        PCLK,      
    input  wire        PRESETn,   
    input  wire        PSEL,      
    input  wire        PENABLE,   
    input  wire        PWRITE,    
    input  wire [31:0] PADDR,     
    input  wire [31:0] PWDATA,    
    output reg  [31:0] PRDATA,    
    output reg         PREADY,    
    output reg  [1:0]  PSLVERR    
);

    reg [31:0] memory [0:255];  

    always @(posedge PCLK or negedge PRESETn) begin
        if (!PRESETn) begin
            PRDATA   <= 32'd0;
            PREADY   <= 1'b0;
            PSLVERR  <= 2'b00;
        end else begin
            PREADY <= 1'b0;
            PSLVERR <= 2'b00;

            if (PSEL && PENABLE) begin
                PREADY <= 1'b1;
                
                if (PWRITE) begin
                    if (PADDR[31:8] == 24'h400000) begin
                        memory[PADDR[7:0]] <= PWDATA;
                    end else begin
                        PSLVERR <= 2'b01;
                    end
                end else begin
                    if (PADDR[31:8] == 24'h400000) begin
                        PRDATA <= memory[PADDR[7:0]];
                    end else begin
                        PSLVERR <= 2'b10;
                    end
                end
            end
        end
    end
endmodule
