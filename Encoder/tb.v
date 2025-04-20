`timescale 1ns / 1ps
module tb;
reg [7:0]a;
wire [2:0]y;
encoder dut( .a(a),
         .y(y)
          );
integer i;  // for itteration
initial begin
$monitor("a = %b, y = %b",a,y);
for( i=0;i<=8'd50;i=i+1)
begin
    a = i; #3;
end

  #100 $finish;  
end
endmodule
