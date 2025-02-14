module multi_bank_memory #(
    parameter DATA_WIDTH = 8,   
    parameter ADDR_WIDTH = 4,   
    parameter NUM_BANKS  = 4    
)(
    input wire clk,
    input wire we,                    
    input wire [ADDR_WIDTH-1:0] addr,  
    input wire [DATA_WIDTH-1:0] din,   
    input wire [1:0] bank_sel,         
    output reg [DATA_WIDTH-1:0] dout   
);

    reg [DATA_WIDTH-1:0] mem [NUM_BANKS-1:0] [2**ADDR_WIDTH-1:0];

    /*
    Memory Initialization:
    - All memory locations are set to zero at the beginning.
    - dout is also initialized to zero to prevent undefined values.
    */
    integer i, j;
    initial begin
        dout = 0; 
        for (i = 0; i < NUM_BANKS; i = i + 1) begin
            for (j = 0; j < 2**ADDR_WIDTH; j = j + 1) begin
                mem[i][j] = 0;
            end
        end
    end

    /*
    Memory Operations:
    - If write enable is active, the input data is stored in the selected memory bank.
    - dout always holds a defined value, preventing undefined behavior.
    */
    always @(posedge clk) begin
        if (we) begin
            mem[bank_sel][addr] <= din;
        end 
        dout <= mem[bank_sel][addr];
    end

endmodule
