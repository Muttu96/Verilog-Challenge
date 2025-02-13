module memory_controller (
    input clk,
    input reset,
    input [2:0] req,             // 3 requestors
    output reg [2:0] grant,      // granted request
    output reg [1:0] arbiter_state // debug: current state
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            arbiter_state <= 2'b00;
            grant <= 3'b000;
        end else begin
            case (arbiter_state)
                2'b00: begin
                    if (req[0]) begin
                        grant <= 3'b001;
                        arbiter_state <= 2'b01;
                    end else if (req[1]) begin
                        grant <= 3'b010;
                        arbiter_state <= 2'b10;
                    end else if (req[2]) begin
                        grant <= 3'b100;
                        arbiter_state <= 2'b11;
                    end else begin
                        grant <= 3'b000;
                    end
                end
                2'b01: begin
                    if (req[1]) begin
                        grant <= 3'b010;
                        arbiter_state <= 2'b10;
                    end else if (req[2]) begin
                        grant <= 3'b100;
                        arbiter_state <= 2'b11;
                    end else begin
                        grant <= 3'b000;
                        arbiter_state <= 2'b00;
                    end
                end
                2'b10: begin
                    if (req[2]) begin
                        grant <= 3'b100;
                        arbiter_state <= 2'b11;
                    end else if (req[0]) begin
                        grant <= 3'b001;
                        arbiter_state <= 2'b01;
                    end else begin
                        grant <= 3'b000;
                        arbiter_state <= 2'b00;
                    end
                end
                2'b11: begin
                    if (req[0]) begin
                        grant <= 3'b001;
                        arbiter_state <= 2'b01;
                    end else if (req[1]) begin
                        grant <= 3'b010;
                        arbiter_state <= 2'b10;
                    end else begin
                        grant <= 3'b000;
                        arbiter_state <= 2'b00;
                    end
                end
                default: begin
                    arbiter_state <= 2'b00;
                    grant <= 3'b000;
                end
            endcase
        end
    end
endmodule
