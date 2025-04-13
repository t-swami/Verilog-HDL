`timescale 1ns / 1ps
module syncDownCounter( input t,clk,rst,
                        output wire [3:0]q,q1,
                        output [3:0]count
                         );
wire w1,w2;

and a1(w1,q1[0],q1[1]);
and a2(w2,w1,q1[2]);

tff t1(.t(t), .clk(clk), .rst(rst), .q(q1[0]), .q1(q[0]));
tff t2(.t(q1[0]), .clk(clk), .rst(rst), .q(q1[1]), .q1(q[1]));
tff t3(.t(w1), .clk(clk), .rst(rst), .q(q1[2]), .q1(q[2]));
tff t4(.t(w2), .clk(clk), .rst(rst), .q(q1[3]), .q1(q[3]));

assign count = q;

endmodule