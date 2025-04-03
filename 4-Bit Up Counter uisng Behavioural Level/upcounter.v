`timescale 1ns / 1ps
module upcounter (
    input wire t, clk, rst,
    output reg [3:0] q

);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 4'b0000;
        end
        else if (t) begin
            q <= q + 1;
        end
    end
endmodule


/* top module for implementing on FPGA
module top(sw,led);
input [2:0]sw;
output [3:0]led;

upcounter top(.t(sw[2]), .clk(sw[1]), .rst(sw[0]), .q(led[3:0]));
endmodule
*/
