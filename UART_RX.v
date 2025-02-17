module uart_receiver(
    input wire clk,
    input wire reset,
    input wire rx,
    output reg [7:0] data,
    output reg ready
);

parameter TICKS_PER_BIT = 30;

reg [15:0] clk_count = 0;
reg [3:0] bit_count = 0;
reg [7:0] rx_shift = 0;
reg rx_d1, rx_d2;
reg receiving = 0;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        clk_count <= 0;
        bit_count <= 0;
        rx_shift <= 0;
        data <= 0;
        ready <= 0;
        receiving <= 0;
    end else begin
        rx_d1 <= rx;
        rx_d2 <= rx_d1;

        if (!receiving) begin
            if (!rx_d2) begin  // Start bit detected
                receiving <= 1;
                clk_count <= 0;
                bit_count <= 0;
                ready <= 0;
            end
        end else begin
            clk_count <= clk_count + 1;
            if (clk_count == TICKS_PER_BIT - 1) begin
                clk_count <= 0;
                bit_count <= bit_count + 1;

                if (bit_count >= 1 && bit_count <= 8) begin  // Capture data bits
                    rx_shift <= {rx_d2, rx_shift[7:1]};
                end

                if (bit_count == 9) begin  // Stop bit
                    receiving <= 0;
                    data <= rx_shift;
                    ready <= 1;
                end
            end
        end
    end
end

endmodule
