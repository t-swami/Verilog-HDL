`timescale 1ns/1ps

module single_port_ram_tb;

    reg clk;
    reg en;
    reg we;
    reg [2:0] address;
    reg [7:0] data_in;
    wire [7:0] data_out;

    single_port_ram uut (
        .clk(clk),
        .en(en),
        .we(we),
        .address(address),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    integer i;

    initial begin
        $display("Time\tEn\tWe\tAddr\tData In\tData Out");
        $monitor("%0t\t%b\t%b\t%0d\t\t%h\t\t%h", $time, en, we, address, data_in, data_out);

        clk = 0;
        en = 0;
        we = 0;
        address = 3'd0;
        data_in = 8'd0;

        #10;

        en = 1;
        we = 1;

        for (i = 0; i < 8; i = i + 1) begin
            address = i[2:0];
            data_in = 8'hA0 + i;
            #10;
        end

        we = 0;

        for (i = 0; i < 8; i = i + 1) begin
            address = i[2:0];
            #10;
        end

        en = 0;
        #10;

        $finish;
    end

endmodule
