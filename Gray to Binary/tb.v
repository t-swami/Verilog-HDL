`timescale 1ns / 1ps
module tb;
reg [3:0]a;
wire [3:0]y;
grayToBinary dut(.a(a), .y(y));

initial begin
$monitor(" a = %b, Gray code = %b",a,y);
    a = 4'd4; #3;
    a = 4'd8; #3;
    a = 4'd15; #3;
    $finish;
end
endmodule
