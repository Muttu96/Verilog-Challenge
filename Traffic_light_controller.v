module traffic_light_controller(
input clk,
input rst,
output reg[2:0]east,south,west,north
);
    
reg [2:0] count;
reg [2:0] state;

parameter GREEN = 3'd1;
parameter YELLOW = 3'd2;
parameter RED = 3'd3;

parameter east_green=3'b000;
parameter east_yellow=3'b001;
parameter south_green=3'b010;
parameter south_yellow=3'b011;
parameter west_green=3'b100;
parameter west_yellow=3'b101;
parameter north_green=3'b110;
parameter north_yellow=3'b111;

always@(posedge(clk)) begin
if(rst==1) begin
    count<=0;
    state<=east_green;
end
else case(state) 
east_green:  begin      
if (count==3'd7) begin
    count<=0;
    state<=east_yellow; 
end else begin
    count<=count+1;
    state<=east_green;  
end
end
east_yellow: begin
if(count==3'd4) begin
    count<=0;
    state<=south_green; 
end else begin
    count<=count+1;
    state<=east_yellow;
end
end
south_green: begin
if (count==3'd7) begin
    count<=0;
    state<=south_yellow; 
end else begin
    count<=count+1;
    state<=south_green;
end
end
south_yellow: begin
if(count==3'd4) begin
    count<=0;
    state<=west_green; 
end else begin
    count<=count+1;
    state<=south_yellow;
end
end  
west_green: begin
if(count==3'd7) begin
    count<=0;
    state<=west_yellow;  
end else begin
    count<=count+1;
    state<=west_green;
end
end
west_yellow: begin
if (count==3'd4) begin
    count<=0;
    state<=north_green; 
end else begin
    count<=count+1;
    state<=west_yellow;
end
end
north_green: begin
if (count==3'd7) begin
    count<=0;
    state<=north_yellow; 
end else begin
    count<=count+1;
    state<=north_green;
end
end
north_yellow: begin
if(count==3'd4) begin
    count<=0;
    state<=east_green;
end else begin
    count<=count+1;
    state<=north_yellow;
end
end
endcase
end
always @(state) begin
case (state)
east_green: begin
east = GREEN;
south = RED;
west = RED;
north = RED;
end
east_yellow: begin
east = YELLOW;
south = YELLOW;
west = RED;
north = RED;
end
south_green: begin
east = RED;
south = GREEN;
west = RED;
north = RED;
end
south_yellow: begin
east = RED;
south = YELLOW;
west = YELLOW;
north = RED;
end
west_green: begin
east = RED;
south = RED;
west = GREEN;
north = RED;
end
west_yellow: begin
east = RED;
south = RED;
west = YELLOW;
north = YELLOW;
end
north_green: begin
east = RED;
south = RED;
west = RED;
north = GREEN;
end
north_yellow: begin
east = YELLOW;
south = RED;
west = RED;
north = YELLOW;
end
endcase
end
endmodule