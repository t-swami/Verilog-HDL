`timescale 1ns / 1ps

module tff (
    input t, clk, rst,
    output reg q, q1
);
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0;  
            q1 <= 1'b1; 
        end 
        else if (t) begin
            q <= ~q;  
            q1 <= q; 
        end 
    end

endmodule
