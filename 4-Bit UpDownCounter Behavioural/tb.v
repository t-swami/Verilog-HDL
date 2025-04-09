`timescale 1ns / 1ps
module tb;
    reg t, clk, rst;
    wire [3:0] q;

    upDown dut(.t(t), .clk(clk), .rst(rst), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("clk = %b, rst = %b, t = %b, q = %b", clk, rst, t, q);

        rst = 1; t = 1; #10  
        rst = 0; t = 1; #200
        rst = 1;#50
        rst = 0; t = 0; #200 
        $finish;
    end
endmodule
