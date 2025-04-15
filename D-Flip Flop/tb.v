`timescale 1ns / 1ps

module tb_dff;
    reg d, clk, rst;
    wire q, q1;

    dff uut (.d(d), .clk(clk), .rst(rst), .q(q), .q1(q1) );

    initial clk = 1'b0;
    always #5 clk = ~clk;
    
    initial begin
        $monitor("Time = %0t | rst = %b | clk = %b | d = %b | q = %b | q1 = %b", 
                  $time, rst, clk, d, q, q1);

        rst = 1'b1; d = 1'b0; #10;
        rst = 1'b0; #10;  
        d = 1'b0; #10; 
        d = 1'b1; #10;
        d = 1'b0; #10;
        d = 1'b1; #10;
        $stop;
    end

endmodule
