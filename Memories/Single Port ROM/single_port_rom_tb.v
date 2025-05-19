`timescale 1ns / 1ps

module single_port_rom_tb;

    reg clk;
    reg en;
    reg [2:0] addres;
    wire [7:0] data_out;

    single_port_rom uut (
        .clk(clk),
        .en(en),
        .addres(addres),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        en = 0;
        addres = 3'b000;
        #10;

        en = 1;

        addres = 3'b000; #10;
        addres = 3'b001; #10;
        addres = 3'b010; #10;
        addres = 3'b011; #10;
        addres = 3'b100; #10;
        addres = 3'b101; #10;
        addres = 3'b110; #10;
        addres = 3'b111; #10;
        addres = 3'b000; #10;
        
        en = 0; #10
        addres = 3'b111; #10;


        $finish;
    end

    initial begin
        $monitor("Time = %t | en = %b | addres = %b | data_out = %b", $time, en, addres, data_out);
    end

endmodule
