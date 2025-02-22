`timescale 1ns / 1ps

module AHB_MASTER (
    input  wire        HCLK,
    input  wire        HRESETn,
    input  wire        HREADY,
    input  wire [1:0]  HRESP,
    input  wire [31:0] HRDATA,
    input  wire        request_write,
    input  wire        request_read,
    input  wire [31:0] write_data,
    input  wire [31:0] read_addr,
    input  wire [31:0] write_addr,
    output reg  [31:0] HADDR,
    output reg  [31:0] HWDATA,
    output reg         HWRITE,
    output reg  [2:0]  HSIZE,
    output reg  [2:0]  HBURST,
    output reg  [3:0]  HPROT,
    output reg  [1:0]  HTRANS,
    output reg  [31:0] read_data,
    output reg         error_flag
);

parameter IDLE = 2'b00;
parameter BUSY = 2'b01;
parameter NONSEQ = 2'b10;
parameter SEQ = 2'b11;

reg [1:0] state;

always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        HADDR   <= 32'd0;
        HWDATA  <= 32'd0;
        HWRITE  <= 1'b0;
        HSIZE   <= 3'b010;
        HBURST  <= 3'b000;
        HPROT   <= 4'b0011;
        HTRANS  <= IDLE;
        state   <= IDLE;
        read_data <= 32'd0;
        error_flag <= 1'b0;
    end else begin
        case (state)
            IDLE: begin
                if (request_write) begin
                    HADDR  <= write_addr; 
                    HWDATA <= write_data;
                    HWRITE <= 1'b1;
                    HTRANS <= NONSEQ;
                    state  <= BUSY;
                end else if (request_read) begin
                    HADDR  <= read_addr;
                    HWRITE <= 1'b0;
                    HTRANS <= NONSEQ;
                    state  <= BUSY;
                end
            end
            
            BUSY: begin
                if (HREADY) begin
                    if (HRESP == 2'b00) begin
                        if (!HWRITE) begin
                            read_data <= HRDATA;
                        end
                        HTRANS <= IDLE;
                        state  <= IDLE;
                    end else begin
                        error_flag <= 1'b1;
                        HTRANS <= IDLE;
                        state  <= IDLE;
                    end
                end
            end
            
            default: state <= IDLE;
        endcase
    end
end

endmodule
