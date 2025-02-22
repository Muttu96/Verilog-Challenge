`timescale 1ns / 1ps

module BRIDGE (
    input hclk, hresetn, hselapb, hwrite,
    input [1:0] htrans,
    input [31:0] haddr,
    input [31:0] hwdata,
    input [31:0] prdata,
    output reg [31:0] paddr, pwdata,
    output reg psel, penable, pwrite,
    output reg hresp, hready,
    output reg [31:0] hrdata
);

    parameter idle     = 3'b000;
    parameter read     = 3'b001;
    parameter renable  = 3'b010;
    parameter wwait    = 3'b011;
    parameter write    = 3'b100;
    parameter write_p  = 3'b101;
    parameter wenable  = 3'b110;
    parameter wenable_p = 3'b111;

    reg [2:0] present_state, next_state;
    reg [31:0] haddr_temp, hwdata_temp;
    reg valid, hwrite_temp;

    always @(*) begin
        valid = (hselapb == 1'b1) && (htrans == 2'b10 || htrans == 2'b11);
    end

    always @(posedge hclk or negedge hresetn) begin
        if (!hresetn)
            present_state <= idle;
        else
            present_state <= next_state;
    end

    always @(*) begin
        next_state = present_state;
        psel = 1'b0;
        penable = 1'b0;
        pwrite = 1'b0;
        hready = 1'b1;
        hresp = 1'b0;
        paddr = 32'b0;
        pwdata = 32'b0;
        hrdata = 32'b0;

        case (present_state)
            idle: begin
                hready = 1'b1;
                if (valid) begin
                    if (hwrite == 1'b0)
                        next_state = read;
                    else
                        next_state = wwait;
                end
            end

            read: begin
                psel = 1'b1;
                paddr = haddr;
                pwrite = 1'b0;
                hready = 1'b0;
                next_state = renable;
            end

            renable: begin
                penable = 1'b1;
                hrdata = prdata;
                hready = 1'b1;
                if (valid) begin
                    if (hwrite == 1'b0)
                        next_state = read;
                    else
                        next_state = wwait;
                end else
                    next_state = idle;
            end

            wwait: begin
                haddr_temp = haddr;
                hwdata_temp = hwdata;
                hwrite_temp = hwrite;
                if (valid)
                    next_state = write_p;
                else
                    next_state = write;
            end

            write: begin
                psel = 1'b1;
                paddr = haddr_temp;
                pwdata = hwdata_temp;
                pwrite = 1'b1;
                hready = 1'b0;
                if (valid)
                    next_state = wenable_p;
                else
                    next_state = wenable;
            end

            write_p: begin
                psel = 1'b1;
                paddr = haddr_temp;
                pwdata = hwdata_temp;
                pwrite = 1'b1;
                hready = 1'b0;
                next_state = wenable_p;
            end

            wenable: begin
                penable = 1'b1;
                hready = 1'b1;
                if (valid) begin
                    if (hwrite == 1'b0)
                        next_state = read;
                    else
                        next_state = wwait;
                end else
                    next_state = idle;
            end

            wenable_p: begin
                penable = 1'b1;
                hready = 1'b1;
                if (valid) begin
                    if (hwrite == 1'b1)
                        next_state = write_p;
                    else
                        next_state = read;
                end else if (hwrite == 1'b0)
                    next_state = read;
            end

            default: next_state = idle;
        endcase
    end

endmodule