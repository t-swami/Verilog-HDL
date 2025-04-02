`timescale 1ns / 1ps
module comparator(input a,b,
                    output Eq,gt,lt
                );
wire w1,w2;

xnor (Eq, a, b);
not (w1,a);
not (w2,b);

and (gt,a,w2);
and (lt,w1,b);


endmodule

// top module for FPGA implementation
/*module top (sw,led);
input [1:0]sw;
output [2:0]led;
comparator top(.a(sw[0]),
                .b(sw[1]),
                .Eq(led[0]),
                .gt(led[1]),
                .lt(led[2])
                );
endmodule
*/