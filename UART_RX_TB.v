module uart_receiver_tb;

reg clk;
reg reset;
reg rx;
wire [7:0] data;
wire ready;

uart_receiver uut (
    .clk(clk),
    .reset(reset),
    .rx(rx),
    .data(data),
    .ready(ready)
);

always #5 clk = ~clk;

task send_uart_byte(input [7:0] tx_byte);
    integer i;
    begin
        rx = 0;
        #30;
        for (i = 0; i < 8; i = i + 1) begin
            rx = tx_byte[i];
            #30;
        end
        rx = 1;
        #30;
    end
endtask

initial begin
    clk = 0;
    reset = 1;
    rx = 1;
    #20;
    reset = 0;
    #20;
    
    send_uart_byte(8'b11010101);
    #60;
    send_uart_byte(8'b00110011);
    #60;
    
    #200;
    $finish;
end

initial begin
    $monitor("Time=%0t ns, RX=%b, Data=0x%h, Ready=%b", $time, rx, data, ready);
end

endmodule
