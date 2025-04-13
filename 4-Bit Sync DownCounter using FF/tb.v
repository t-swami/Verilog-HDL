`timescale 1ns / 1ps
module tb;
reg t,clk,rst;
wire [3:0]q,q1;
wire [3:0]count;

syncDownCounter dut(.t(t), .clk(clk), .rst(rst), .q(q), .q1(q1), .count(count));

 initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %t,clk = %b, rst = %b, t = %b, q = %b, count = %b", $time,clk, rst, t, q, count);

        rst = 1; t = 1; #10;  
        rst = 0; t = 1; #180;
        rst = 1; #30 rst = 0;
        t =1; #150
          
        $finish;
    end
endmodule