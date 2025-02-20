module can_controller (
    input clk,
    input reset,
    input [7:0] data_in,
    input tx_req,
    output reg [7:0] data_out,
    output reg tx_done,
    output reg can_tx,
    input can_rx
);

    reg [7:0] tx_buffer;
    reg [7:0] rx_buffer;
    reg [3:0] bit_cnt;
    reg tx_active;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tx_buffer <= 8'b0;
            rx_buffer <= 8'b0;
            tx_active <= 0;
            tx_done <= 0;
            bit_cnt <= 0;
            can_tx <= 1;
        end else begin
            if (tx_req && !tx_active) begin
                tx_buffer <= data_in;
                tx_active <= 1;
                tx_done <= 0;
                bit_cnt <= 0;
            end
            
            if (tx_active) begin
                if (bit_cnt < 8) begin
                    can_tx <= tx_buffer[bit_cnt];
                    bit_cnt <= bit_cnt + 1;
                end else begin
                    tx_done <= 1;
                    tx_active <= 0;
                    can_tx <= 1;
                end
            end
            
            if (!tx_active) begin
                rx_buffer <= {rx_buffer[6:0], can_rx};
                data_out <= rx_buffer;
            end
        end
    end
endmodule
