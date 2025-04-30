`timescale 1ns / 1ps

module clock_1MHz(
    input clk,              
    output reg clk_1Mhz        
);
    integer count;

    initial begin
        count = 0;
        clk_1Mhz = 0;
    end

    always @(posedge clk) begin
        if (count == 50000000) begin   
            clk_1Mhz <= ~clk_1Mhz;
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end
endmodule
