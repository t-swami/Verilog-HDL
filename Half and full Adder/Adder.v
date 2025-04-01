`timescale 1ns / 1ps
module Adder (
input a,b,cin,
output sh,ch,sf,cf );

wire w1,w2,w3,w4;
//For Half Adder
xor (sh,a,b);
and (ch,a,b);  

// For full Adder
 xor (w1,a,b);
 xor (sf,w1,cin);
 and (w2,a,b);
 and (w3,b,cin);
 and (w4,cin,a);
 or (cf,w2,w3,w4);
endmodule

// For FPGA Implementation 
/*
module top(sw,led);
input [2:0]sw;
output [3:0]led;
Adder top(.a(sw[0]),
            .b(sw[1]),
            .cin(sw[2]),
            .sh(led[0]),
            .ch(led[1]),
            .sf(led[2]),
            .cf(led[3])
            );
endmodule
*/
