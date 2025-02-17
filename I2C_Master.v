`timescale 1ns / 1ps

module I2C_Master (
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    output reg scl,
    output reg sda
);
 
    parameter IDLE = 3'b000, START = 3'b001, ADDR = 3'b010, DATA = 3'b011, STOP = 3'b100;
    reg [2:0] state, next_state;
    reg [7:0] shift_reg;
    reg [2:0] bit_counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            scl <= 1'b1;
            sda <= 1'b1;
            bit_counter <= 3'b000;
            shift_reg <= 8'b0;
        end else begin
            state <= next_state;
            case (state)
                IDLE: begin
                    scl <= 1'b1;
                    sda <= 1'b1;
                end
                START: begin
                    scl <= 1'b1;
                    sda <= 1'b0;
                end
                ADDR: begin
                    if (bit_counter < 8) begin
                        scl <= ~scl;
                        if (scl) begin
                            sda <= shift_reg[7];
                            shift_reg <= {shift_reg[6:0], data_in[bit_counter]};
                            bit_counter <= bit_counter + 1;
                        end
                    end else begin
                        next_state <= DATA;
                    end
                end
                DATA: begin
                   
                end
                STOP: begin
                    scl <= 1'b1;
                    sda <= 1'b1;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            IDLE: next_state = START;
            START: next_state = ADDR;
            ADDR: if (bit_counter < 8) next_state = ADDR; else next_state = DATA;
            DATA: next_state = STOP;
            STOP: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end
endmodule