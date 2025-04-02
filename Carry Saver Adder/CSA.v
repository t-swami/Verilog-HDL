`timescale 1ns / 1ps

//Carry Save Adder of 3 which each of 5 bit.
module CSA(a, b, d, s, c,y);
  input [4:0] a, b, d;
  output [4:0] s, c;
  output [5:0]y;

  FA fa0(a[0], b[0], d[0], c[0], s[0]);
  FA fa1(a[1], b[1], d[1], c[1], s[1]);
  FA fa2(a[2], b[2], d[2], c[2], s[2]);
  FA fa3(a[3], b[3], d[3], c[3], s[3]);
  FA fa4(a[4], b[4], d[4], c[4], s[4]);
  
 assign y=s[4:0] + c[4:0];

endmodule

// Full adder 
module FA(a, b, cin, cout, sum);
  input a, b, cin;
  output cout, sum;
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (cin & a);
endmodule

// top module
/*module top(sw,led);
input [14:0]sw;
output [15:0]led;

CSA top(.a(sw[4:0]),
            .b(sw[9:5]),
            .d(sw[14:10]),
            .s(led[4:0]),
            .c(led[9:5]),
            .y(led[15:10])
            );
endmodule
*/