`timescale 1ns / 1ps

module i2c_slave (
    input wire clk,
    input wire rst,
    input wire scl,  
    inout wire sda, 
    output reg [7:0] data_out,
    input wire [7:0] data_in, 
    input wire [6:0] slave_addr 
);
    reg [7:0] data_reg;
    reg [3:0] bit_cnt;
    reg ack;
    reg rw;
    reg sda_out, sda_en; 

    parameter IDLE = 3'b000, ADDRESS = 3'b001, RECEIVE = 3'b010, ACK = 3'b011, STOP = 3'b100, SEND = 3'b101;
    reg [2:0] state;

  
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            bit_cnt <= 4'b0000;
            data_reg <= 8'b00000000;
            ack <= 1'b0;
            rw <= 1'b0;
            sda_out <= 1'b1;
            sda_en <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (scl && !sda) 
                        state <= ADDRESS;
                end
                ADDRESS: begin
                    if (!scl) begin  
                        data_reg <= {data_reg[6:0], sda};
                        bit_cnt <= bit_cnt + 1;
                        if (bit_cnt == 4'b0111) begin
                            if (data_reg[7:1] == slave_addr) begin 
                                rw = data_reg[0];
                                state <= ACK;
                            end else begin
                                state <= IDLE;
                            end
                        end
                    end
                end
                RECEIVE: begin
                    if (!scl) begin 
                        data_reg <= {data_reg[6:0], sda};
                        bit_cnt <= bit_cnt + 1;
                        if (bit_cnt == 4'b0111) state <= ACK;
                    end
                end
                ACK: begin
                    if (scl) begin 
                        sda_out <= 1'b0; 
                        sda_en <= 1'b1;
                        if (rw == 1'b0) begin
                            state <= RECEIVE;
                        end else begin
                            state <= SEND;
                        end
                    end else begin
                        sda_en <= 1'b0;
                    end
                end
                SEND: begin
                    if (!scl) begin
                        sda_out <= data_in[7-bit_cnt];
                        sda_en <= 1'b1;
                        bit_cnt <= bit_cnt + 1;
                        if (bit_cnt == 4'b0111) state <= STOP;
                    end else begin
                        sda_en <= 1'b0;
                    end
                end
                STOP: begin
                    if (scl && sda) 
                        state <= IDLE;
                end
            endcase
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            data_out <= 8'b00000000;
        else if (ack && !rw)
            data_out <= data_reg; 
    end

  
    assign sda = sda_en ? sda_out : 1'bz;
endmodule