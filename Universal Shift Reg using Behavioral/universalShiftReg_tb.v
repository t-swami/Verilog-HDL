`timescale 1ns/1ps
module universalShiftReg_tb;

    parameter N = 8;

    reg clk, rst;
    reg [1:0] sel;
    reg [N-1:0] data_in;
    
    wire [N-1:0] data_out;

    universalShiftReg #(N) uut (
        .clk(clk),
        .rst(rst),
        .sel(sel),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        sel = 2'b00;
        data_in = 4'b0000;

        #10 rst = 0;

        data_in = 8'b10101010;
        sel = 2'b11;
        #10;

        sel = 2'b00;
        #10;

        sel = 2'b01;
        #40;

        sel = 2'b10;

        #30;

        $stop;
    end

endmodule
