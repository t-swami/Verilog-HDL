`timescale 1ns / 1ps
module grayToBinary( input [3:0]a,
                       output [3:0]y
    );
assign y[3] = a[3];
assign y[2] = y[3]^a[2];
assign y[1] = y[2]^a[1];
assign y[0] = y[1]^a[0];
endmodule

// for FPGA implementation

/* module top(sw,led);
input [3:0]sw;
output [3:0]led;
grayToBinary top(.a(sw[3:0], .y(led[3:0]));
endmodule
*/