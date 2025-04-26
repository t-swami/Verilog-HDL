`timescale 1ns / 1ps
module lfsr_4Bit(
    input clk,
    input rst,
    output [3:0] q
);

wire feedback;
assign feedback = q[3] ^ q[2]; 

shift_register dut ( .clk(clk),
                            .rst(rst),
                            .in_bit(feedback),
                            .q(q)
                            );
endmodule



module shift_register(
    input clk,
    input rst,
    input in_bit,
    output [3:0] q);

dff d0(.d(in_bit), .clk(clk), .rst(rst), .q(q[0]));
dff d1(.d(q[0]), .clk(clk), .rst(rst), .q(q[1]));
dff d2(.d(q[1]), .clk(clk), .rst(rst), .q(q[2]));
dff d3(.d(q[2]), .clk(clk), .rst(rst), .q(q[3]));

endmodule

// Top module
module top(clk,sw,led);
input clk,sw;
output [3:0]led;
lfsr_4Bit t(.clk(clk), .rst(rst), .q(led));

endmodule