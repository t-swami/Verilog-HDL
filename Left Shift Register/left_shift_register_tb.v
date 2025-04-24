`timescale 1ns / 1ps
module left_shift_register_tb;
reg clk,rst,in_bit;
wire [3:0]q;

left_shift_register dut(.clk(clk), .rst(rst), .in_bit(in_bit), .q(q));

always #5 clk = ~clk;
initial begin
$monitor ("Time = %t,cclock = %b, reset =%b, in_but = %b, q = %b", $time,clk,rst,in_bit,q);
    clk = 0;
    rst = 1;
    in_bit  = 1;#8
    rst = 0; 
    in_bit = 1;#10
    in_bit = 1;#10
    in_bit = 0;#10
    in_bit = 1;#10
    $stop;   
end
endmodule
