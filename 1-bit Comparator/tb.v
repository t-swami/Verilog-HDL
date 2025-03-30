`timescale 1ns / 1ps

module tb;
reg a,b;
wire Eq,gt,lt;

comparator dut(.a(a),
                .b(b),
                .Eq(Eq),
                .gt(gt),
                .lt(lt)
                );
initial
    begin
$monitor("a = %b , b = %b , Equall = %b, a>b = %b , a<b = %b",a,b,Eq,gt,lt);
    a = 1'd0  ; b = 1'd0; #2
    a = 1'd0 ; b = 1'd1; #2
    a = 1'd1 ; b = 1'd0; #2
    a = 1'd1 ; b = 1'd1; #2
    $stop;
    end
    
endmodule
