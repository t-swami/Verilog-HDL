`timescale 1ns / 1ps
module Johnson_counter( input clk,rst,
                        output [3:0]q
                        );
wire feedback;
assign feedback = ~q[0];

right_shift_register top(.clk(clk), .rst(rst), .in_bit(feedback), .q(q));

endmodule
