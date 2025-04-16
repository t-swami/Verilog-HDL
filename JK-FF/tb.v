`timescale 1ns / 1ps

module tb;
    reg j,k, clk, rst;
    wire q, q1;

    jkff dut (.j(j), .k(k), .clk(clk), .rst(rst), .q(q), .q1(q1) );

    initial clk = 1'b0;
    always #5 clk = ~clk;
    
    initial begin
        $monitor("Time = %0t, rst = %b, clk = %b, j = %b, k =%b, q = %b, q1 = %b", 
                  $time, rst, clk, j,k, q, q1);

        rst = 1'b1; j= 1'b0; k = 1'd1; #10;  
        rst = 1'd0; j= 1'b0; k = 1'd0; #10
                    j= 1'b0; k = 1'd1; #10
                    j= 1'b1; k = 1'd0; #10
                    j= 1'b1; k = 1'd1; #10
        $stop;
    end

endmodule