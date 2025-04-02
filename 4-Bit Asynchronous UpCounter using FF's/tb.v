`timescale 1ns / 1ps
module tb;
    reg t, clk, rst;
    wire [3:0] q;
    wire [3:0] count;

    counter4Bit dut(.t(t), .clk(clk), .rst(rst), .q(q), .count(count));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("clk = %b, rst = %b, t = %b, q = %b, count = %b", clk, rst, t, q, count);

        rst = 1; t = 1; #10;  
        rst = 0; t = 1; #300;  
        $finish;
    end
endmodule
