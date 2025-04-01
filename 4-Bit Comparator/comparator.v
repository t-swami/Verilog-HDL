`timescale 1ns / 1ps
module comparator( input [3:0]a,
                    input [3:0]b,
                    output lt,Eq,gt
    );
 wire [18:1]w;
 comp_1bit c1(a[3],b[3],w[1],w[2],w[3]);
 comp_1bit c2(a[2],b[2],w[4],w[5],w[6]);
 comp_1bit c3(a[1],b[1],w[7],w[8],w[9]);
 comp_1bit c4(a[0],b[0],w[10],w[11],w[12]); 
 
 and equall(Eq,w[2],w[5],w[8],w[11]);
 
 and a0(w[13],w[4],w[2]);
 and a1(w[15],w[7],w[5],w[2]);
 and a2(w[17],w[8],w[5],w[2],w[10]);
 or lessthan(lt,w[1],w[13],w[15],w[17]);
 
 and a3(w[14],w[6],w[2]);
 and a4(w[16],w[9],w[5],w[2]);
 and a5(w[18],w[8],w[5],w[2],w[12]);
 or greaterthan(gt,w[3],w[14],w[16],w[18]);
endmodule
// 1-Bit comparator
module comp_1bit(input a,b,
                output lt,eq,gt
                );
wire w1,w2;
xnor (eq, a, b);
not (w1,a);
not (w2,b);
and (gt,a,w2);
and (lt,w1,b);
endmodule

/* Top module for implementing on FPGA
module top(sw,led);
input [7:0]sw;
output [2:0]led;
comparator dut(.a(sw[3:0]),
                .b(sw[7:4]),
                .Eq(led[0]),
                .gt(led[1]),
                .lt(led[2])
                );

endmodule

*/
