`timescale 1ns / 1ps
module fibnocciSeries_tb;
reg clk,rst;
wire [31:0]y;

fibonacciSeries uut(.clk(clk), .rst(rst), .y(y));

always #5 clk = ~clk;
initial begin
$monitor ("Time = %t,y = %d",$time,y);
    clk = 0; rst =1;#10
    rst = 0;
    #100;
    $stop;
end
endmodule
