`timescale 1ns / 1ps
module syncUpCounter( input t,clk,rst,
                        output wire [3:0]q,q1,
                        output [3:0]count
                         );
wire w1,w2,w3;

and a1(w1,q[0],q[1]);
and a2(w2,w1,q[2]);

tff t1(.t(t), .clk(clk), .rst(rst), .q(q[0]), .q1(q1[0]));
tff t2(.t(q[0]), .clk(clk), .rst(rst), .q(q[1]), .q1(q1[1]));
tff t3(.t(w1), .clk(clk), .rst(rst), .q(q[2]), .q1(q1[2]));
tff t4(.t(w2), .clk(clk), .rst(rst), .q(q[3]), .q1(q1[3]));

assign count = q;
endmodule
