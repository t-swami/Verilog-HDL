`timescale 1ns / 1ps

// Test bench:
module tb;
  reg [4:0] a, b, d;
  wire [4:0] s, c;
  wire [5:0]y;

  CSA DUT(a, b, d, s, c,y);

  initial begin
    a = 5'd19;    b = 5'd25;    d = 5'd11; #10
    a = 5'd10;    b = 5'd3;     d = 5'd5;  #10 
    $stop;
  end
endmodule
