module nand_flash_memory (
    input wire clk,
    input wire we,  // Write enable
    input wire re,  // Read enable
    input wire [7:0] address,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] memory [255:0];
    integer i;

    initial begin
        data_out = 8'b0;
        for (i = 0; i < 256; i = i + 1) begin
            memory[i] = 8'b0;
        end
    end

    always @(posedge clk) begin
        if (we) begin
            memory[address] <= data_in;
        end
    end

    always @(posedge clk) begin
        if (re) begin
            data_out <= memory[address];
        end else begin
            data_out <= 8'b0;
        end
    end

endmodule
