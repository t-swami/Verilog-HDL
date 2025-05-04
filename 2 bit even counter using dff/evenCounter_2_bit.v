`timescale 1ns / 1ps

module evenCounter_2_bit( input clk,rst,
                          output [1:0] count
                        );
wire d0,d1;
wire n0,n1;

assign count = {n1,n0};

assign d0 = 1'd0;
assign d1 = ~n1;

dff dff1(.d(d0), .clk(clk), .rst(rst), .q(n0));
dff dff2(.d(d1), .clk(clk), .rst(rst), .q(n1));


endmodule