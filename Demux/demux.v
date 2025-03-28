`timescale 1ns / 1ps

module demux(
    input in4, in2,
    input [1:0] s4,
    input s2,
    output reg [1:0] y2,
    output reg [3:0] y4
);

always @(*) begin
    // Default values to prevent latches
    y2 = 2'b00;
    y4 = 4'b0000;
    
    // 1:2 demux
    if (in2) begin
        if (s2 == 1'b0)
            y2 = 2'b01;
        else
            y2 = 2'b10;
    end
    
    // 1:4 demux
    if (in4) begin
        case (s4)
            2'd0: y4 = 4'b0001;
            2'd1: y4 = 4'b0010;
            2'd2: y4 = 4'b0100;
            2'd3: y4 = 4'b1000; 
            default: y4 = 4'b0000;
        endcase
    end
end

endmodule


// top module
module top(sw,led);
input [4:0]sw;
output [5:0]led;

demux top(.in4(sw[0]),
            .in2(sw[3]),
            .s4(sw[2:1]),
            .s2(sw[4]),
            .y2(led[5:4]),
            .y4(led[3:0]));

endmodule
