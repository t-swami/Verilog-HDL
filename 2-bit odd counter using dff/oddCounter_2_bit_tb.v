`timescale 1ns / 1ps
module oddCounter_2_bit_tb;
reg clk,rst;
wire [1:0] count;

oddCounter_2_bit uut( .clk(clk), .rst(rst), .count(count));

always #5 clk = ~clk;
initial begin
$monitor("Time = %t, count = %d",$time,count);
    clk = 0;
    rst = 1; #10 
    rst = 0; #100
    $stop;
end
endmodule
