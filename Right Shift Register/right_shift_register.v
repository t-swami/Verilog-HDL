`timescale 1ns / 1ps
module right_shift_register(input clk,
                            input rst,
                            input in_bit,
                            output [3:0] q
                                );

dff d0(.d(in_bit), .clk(clk), .rst(rst), .q(q[3]));
dff d1(.d(q[3]), .clk(clk), .rst(rst), .q(q[2]));
dff d2(.d(q[2]), .clk(clk), .rst(rst), .q(q[1]));
dff d3(.d(q[1]), .clk(clk), .rst(rst), .q(q[0]));

endmodule

