`timescale 1ns / 1ps

module odd_or_even_counter_2_bit( input clk,rst,select,
                                    output [1:0] count
                                    );
wire d0,d1;
wire n0,n1;

assign count = {n1,n0};

assign d0 = (select == 1)?1'd1:1'd0; // if select = 1- odd else even
assign d1 = ~n1;

dff dff1(.d(d0), .clk(clk), .rst(rst), .q(n0));
dff dff2(.d(d1), .clk(clk), .rst(rst), .q(n1));


endmodule