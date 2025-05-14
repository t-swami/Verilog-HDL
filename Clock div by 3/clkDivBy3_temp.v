`timescale 1ns / 1ps

module clkDivBy3_tb;
    reg clk;
    reg rst;
    wire clk_out;
   
    clkDivBy3 dut (
                    .clk(clk),
                    .rst(rst),
                    .nclk(clk_out)
                );


    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;

        #30;
        rst = 0;

        #100;

        $stop;
    end

endmodule
