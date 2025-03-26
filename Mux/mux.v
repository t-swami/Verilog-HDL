`timescale 1ns / 1ps

module mux(input [3:0]a,
            input [1:0]s,
            output y,y4);
// 2:1 mux using conditonal operator
assign y=((s[0])?a[1]:a[0]);

//for 4:1 mux using conditonal operator
assign y4=((s[1])?((s[0])?a[3]:a[2]):((s[0])?a[1]:a[0]));

endmodule

//top module
module top(sw,led);
input [5:0]sw;
output [1:0]led;
mux top(sw[3:0],sw[5:4],led[0],led[1]);

endmodule
