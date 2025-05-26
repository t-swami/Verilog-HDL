`timescale 1ns / 1ps
module negEdge_dff_using_mux2_1_tb;
reg clk , d;
wire q_slave , q_master;

negEdge_dff_using_mux2_1 DUT(.clk(clk), .d(d), .q_slave(q_slave), .q_master(q_master));

always #5 clk = ~clk;
initial begin
$monitor("Time = %t | clock = %b | d = %b | q_master = %b | q_slave = %b",$time,clk,d,q_master,q_slave);
    clk = 0;
    d = 1;# 5
    d = 0; #5
    d = 0; #8
    d = 1;#6
    d = 0; 
    #20
    
    $stop;
end
endmodule
