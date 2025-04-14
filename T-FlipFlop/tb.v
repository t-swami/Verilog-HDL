`timescale 1ns / 1ps
module tb;
    reg t, clk, rst;
    wire q, q1;
    
    tff dut (.t(t), .clk(clk), .rst(rst), .q(q), .q1(q1));

    initial clk = 1'b0;
    always #2 clk = ~clk;  

    initial begin
        $monitor("Time = %0t | rst = %b, T = %b, q = %b, q1 = %b", $time, rst, t, q, q1);
        
        rst = 1'b1; t = 1'b0; #5  
        rst = 1'b0; t = 1'b1; #6 
        t = 1'b0; #4
        t = 1'b1; #6
        t = 1'b0; #4
        $stop;
    end

endmodule
