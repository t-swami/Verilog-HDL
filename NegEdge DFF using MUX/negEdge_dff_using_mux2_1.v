`timescale 1ns / 1ps
module negEdge_dff_using_mux2_1( input clk,d,
                                  output wire q_slave,
                                  output wire q_master
                                  );
wire clk_invert;
mux2_1 m1(.s(clk), .a(1), .b(0), .y(clk_invert));
mux2_1 m2(.s(clk), .a(q_master), .b(d), .y(q_master));
mux2_1 m3(.s(clk_invert), .a(q_slave), .b(q_master), .y(q_slave));

endmodule
