`timescale 1ns / 1ps
module tb;
reg [2:0]a;
wire [7:0]y;

integer i;
decoder dut(.a(a), .y(y));
initial begin
$monitor("a = %b, y = %b",a,y);
    for (i = 0 ; i<=3'd7; i=i+1)
    begin
        a = i; #3;
    end
    $stop;
end
endmodule
