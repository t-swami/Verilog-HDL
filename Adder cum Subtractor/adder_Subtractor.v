`timescale 1ns / 1ps
module adder_Subtractor(input [3:0]a,b,
                        input ctrl,
                        output [3:0]q,
                        output [3:0]cout,
                        output cFinal
                        );
                        
wire [3:0]w;
xor x1(w[0],b[0],ctrl);  // if ctrl = 1 then it performs the subtractor else adder
xor x2(w[1],b[1],ctrl);
xor x3(w[2],b[2],ctrl);
xor x4(w[3],b[3],ctrl);

FA f1(.a(a[0]), .b(w[0]), .c(ctrl), . s(q[0]), .cout(cout[0]));
FA f2(.a(a[1]), .b(w[1]), .c(cout[0]), . s(q[1]), .cout(cout[1]));
FA f3(.a(a[2]), .b(w[2]), .c(cout[1]), . s(q[2]), .cout(cout[2]));
FA f4(.a(a[3]), .b(w[3]), .c(cout[2]), . s(q[3]), .cout(cout[3]));
 
assign cFinal = cout[3];
endmodule
// Full Adder
module FA(input a,b,c,
            output s,cout
            );

assign s = a ^ b ^ c;
assign cout = (a&&b) || (b&&c) || (c&&a);
endmodule

/* for FPGA Implemantation
module top(sw,led);
input [8:0]sw;
output [8:0]led;
adder_Subtractor t(.a(sw[4:1]),
                       .b(sw[8:5]),
                       .ctrl(sw[0]),
                       .q(led[3:0]),
                       .cout(led[7:0]),
                       .cFinal(led[8])
                       );
endmodule
*/