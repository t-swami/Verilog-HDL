`timescale 1ns / 1ps
module binaryToGray( input [3:0]a,
                       output [3:0]y
    );
assign y[3] = a[3];
assign y[2] = a[3]^a[2];
assign y[1] = a[2]^a[1];
assign y[0] = a[1]^a[0];
endmodule

// for FPGA implementation

/* module top(sw,led);
input [3:0]sw;
output [3:0]led;
binaryToGray top(.a(sw[3:0], .y(led[3:0]));
endmodule
*/