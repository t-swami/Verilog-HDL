`timescale 1ns / 1ps
module odd_or_even_counter_2_bit_tb;
reg clk,rst,select;
wire [1:0] count;

odd_or_even_counter_2_bit uut( .clk(clk), .rst(rst),.select(select), .count(count));

always #5 clk = ~clk;
initial begin
$monitor("Time = %t, count = %d",$time,count);
    clk = 0;
    rst = 1; #10
    rst = 0; 
    select = 0; #50
    select = 1; #80
    select = 0; 
     #40
    $stop;
end
endmodule