`timescale 1ns / 1ps

module tb;
    reg s, r, clk, rst;
    wire q, q1;

    srff dut (.s(s), .r(r), .clk(clk), .rst(rst), .q(q), .q1(q1));

    initial clk = 1'b0;
    always #5 clk = ~clk;
    
    initial begin
        $monitor("Time = %0t, rst = %b, clk = %b, s = %b, r = %b, q = %b, q1 = %b", 
                  $time, rst, clk, s, r, q, q1);

        rst = 1'b1;  s = 1'b0; r = 1'b1; #10;  
        rst = 1'b0;  s = 1'b0; r = 1'b0; #10;
                     s = 1'b1; r = 1'b1; #10;
                     s = 1'b0; r = 1'b1; #10;
                     s = 1'b1; r = 1'b0; #10;
                     s = 1'b1; r = 1'b1; #10;
        $stop;
    end
endmodule
