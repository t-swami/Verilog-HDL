`timescale 1ns / 1ps

module clkDivBy2_tb;
reg clk,rst;
wire nclk;

clkDivBy2 uut(.clk(clk), .rst(rst), .nclk(nclk));
always #5 clk = ~clk ;
initial begin
clk = 0;
rst = 1; #10 
rst = 0; #200
$stop;
end
endmodule
