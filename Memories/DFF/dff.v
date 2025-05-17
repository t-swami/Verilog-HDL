`timescale 1ns / 1ps
module dff (
    input  d, clk, rst,
    output reg q, 
    output q1
);
assign q1 = ~q;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0; 
            end
        else
        begin
            q <= d;
        end
   end
endmodule
