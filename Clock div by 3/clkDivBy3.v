`timescale 1ns / 1ps
module clkDivBy3 (
    input wire clk,
    input wire rst,
    output wire nclk
);
wire [2:0]d;
wire [2:0]q;

assign  d[1] = q[0];
assign d[0] = ~q[0] && ~q[1];
assign d[2] = q[1];

dff dff1(.d(d[0]), .clk(clk), .rst(rst), .q(q[0]));
dff dff2(.d(d[1]), .clk(clk), .rst(rst), .q(q[1]));
dff dff3(.d(d[2]), .clk(~clk), .rst(rst), .q(q[2]));

assign nclk = q[1] | q[2];
endmodule
