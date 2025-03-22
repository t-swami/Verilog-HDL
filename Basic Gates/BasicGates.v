`timescale 1ns / 1ps
module BasicGates(
  input a, b,
  output x_and, x_or, x_not, x_nand, x_nor, x_xor, x_xnor
);

  assign x_and  = a & b;   // AND Gate
  assign x_or   = a | b;   // OR Gate
  assign x_not  = ~a;      // NOT Gate (only for 'a')
  assign x_nand = ~(a & b); // NAND Gate
  assign x_nor  = ~(a | b); // NOR Gate
  assign x_xor  = a ^ b;   // XOR Gate
  assign x_xnor = ~(a ^ b); // XNOR Gate

endmodule


module top(sw,led);
input [1:0]sw;
output [6:0]led;
BasicGates top(.a(sw[0]),
                .b(sw[1]),
                .x_and(led[0]), 
                .x_or(led[1]),
                .x_not(led[2]),
                .x_nand(led[3]),
                .x_nor(led[4]),
                .x_xor(led[5]),
                .x_xnor(led[6]));

endmodule