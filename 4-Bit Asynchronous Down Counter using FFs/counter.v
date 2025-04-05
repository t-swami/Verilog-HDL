`timescale 1ns / 1ps
module counter4Bit (
    input wire t, clk, rst,
    output wire [3:0] q,
    output wire [3:0] count
);
    // First flip-flop gets the main clock
    counter c1 (.t(t), .clk(clk),   .rst(rst), .q(q[0]));
    counter c2 (.t(t), .clk(q[0]),  .rst(rst), .q(q[1]));
    counter c3 (.t(t), .clk(q[1]),  .rst(rst), .q(q[2]));
    counter c4 (.t(t), .clk(q[2]),  .rst(rst), .q(q[3]));

    assign count = q;
endmodule



module counter (
    input wire t, clk, rst,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;  // Reset the flip-flop correctly
        else if (t)
            q <= ~q;  // Toggle on clock edge when t=1
    end
endmodule


/*top module for implementing onFPPGA

module top(sw,led);
input [2:0]sw;
output [7:0]led;

counter4Bit top(.t(sw[2]), .clk(sw[1]), .rst(sw[0]), .q(led[3:0]), .count(led[7:4]));
endmodule

*/