`timescale 1ns / 1ps
module tb;
reg [3:0]a,b;
wire Eq,gt,lt;

comparator dut(.a(a),
                .b(b),
                .Eq(Eq),
                .gt(gt),
                .lt(lt)
                );
initial
begin
    $monitor("a = %b , b = %b , Equal = %b, a>b = %b , a<b = %b", a, b, Eq, gt, lt);
    a = 4'd4; b = 4'd3; #2
    a = 4'd2; b = 4'd2; #2
    a = 4'd13; b = 4'd10; #2
    a = 4'd8; b = 4'd9; #2
    $finish;
end
endmodule
