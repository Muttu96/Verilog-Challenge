module CAM #(parameter WIDTH = 8, DEPTH = 16) (
    input [WIDTH-1:0] data_in,
    input wr_en, clk, rst,
    output reg [DEPTH-1:0] match
);

reg [WIDTH-1:0] memory [0:DEPTH-1];
integer i;
reg data_written;

// Writing data into CAM memory
always @(posedge clk or posedge rst) begin
    if (rst) begin
        for (i = 0; i < DEPTH; i = i + 1)
            memory[i] <= 0; // Initialize memory on reset
    end
    else if (wr_en) begin
        data_written = 0;
        for (i = 0; i < DEPTH && !data_written; i = i + 1) begin
            if (memory[i] == 0) begin // Store in the first available slot
                memory[i] <= data_in;
                data_written = 1;
            end
        end
    end
end

// Searching for data in CAM memory
always @(*) begin
    match = 0; // Default no match
    for (i = 0; i < DEPTH; i = i + 1) begin
        if (memory[i] == data_in)
            match[i] = 1;
    end
end

endmodule
