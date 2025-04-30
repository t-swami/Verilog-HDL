`timescale 1ns / 1ps

module clock_1Mhz_tb;

    reg clk;
    wire clk_1Mhz;

    clock_1MHz uut (
        .clk(clk),
        .clk_1Mhz(clk_1Mhz)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        #2000000000;

        $finish;
    end
endmodule
