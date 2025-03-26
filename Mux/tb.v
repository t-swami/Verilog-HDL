`timescale 1ns / 1ps
module tb;
  reg [3:0] a;
  reg [1:0] s;
  wire y,y4;
  mux dut (.a(a), .s(s), .y(y),.y4(y4));

  initial begin
    $monitor("Time=%0t | a=%b | s=%b | y=%b", $time, a, s, y);

    a = 4'd2;  s = 2'd2; #2;
    a = 4'd7;  s = 2'd3; #2;
    a = 4'd2;  s = 2'd0; #2;
    a = 4'd12; s = 2'd1; #2;

    $stop;
  end
endmodule
