`timescale 1ns / 1ps
/// Main Module
module RCA(a,b,cin,c,s);
input [3:0]a,b;
input cin;
output [3:0]c,s;

FA h1(s[0],c[0],a[0],b[0],cin);
FA h2(s[1],c[1],a[1],b[1],c[0]);
FA h3(s[2],c[2],a[2],b[2],c[1]);
FA h4(s[3],c[3],a[3],b[3],c[2]);

initial
    begin
  $monitor("Sum : %b%b",c[3],s[3:0]);
    end
endmodule
// Full Adder Module
module FA(s,c,a,b,cin);
input a,b,cin;
output s,c;
wire w0,w1,w2,w3,w4,w5;
xor (w0,a,b);
xor (s,w0,cin);
and (w1,a,b);
and (w2,b,cin);
and (w3,cin,a);
or (c,w1,w2,w3);
endmodule


//top module for to implement on FPGA
module top(sw,led);
input [8:0]sw;
output [7:0]led;
RCA(sw[3:0],sw[7:4],sw[8],led[3:0],led[7:4]);
endmodule