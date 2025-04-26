`timescale 1ns / 1ps
module lfsr_4Bit_tb;

reg clk;
reg rst;
wire [3:0] q;


lfsr_4Bit uut ( .clk(clk),
                .rst(rst),
                .q(q)
                );
            
always #10 clk = ~clk;

initial begin
    $monitor("Time: %t | q = %b ", $time, q);
    clk = 0;
    rst = 1;
    #25;

    rst = 0;
    #500;
    $stop;
end
endmodule
