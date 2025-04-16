`timescale 1ns / 1ps


`timescale 1ns / 1ps
module jkff (
    input wire j,k, clk, rst,
    output reg q,q1
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0;
            q1<= 1'd1; 
            end
        else if(j == 1'd0 && k == 1'd0) begin
            q <= q;
            q1 <= q1;
        end
        else if(j == 1'd0 && k == 1'd1) begin
            q <= k;
            q1 <= ~q1;
        end
           else if(j == 1'd1 && k == 1'd0) begin
            q <= j;
            q1 <= ~q;
        end
        else begin
            q <= ~q;
            q1 <= q;
            end
      end
endmodule

