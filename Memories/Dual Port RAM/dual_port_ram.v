`timescale 1ns / 1ps

module dual_port_ram(
    input clka,
    input clkb,
    input ena,
    input wea,
    input enb,
    input web,
    input [2:0] ada,
    input [2:0] adb,
    input [7:0] ina,
    input [7:0] inb,
    output reg [7:0] outa,
    output reg [7:0] outb
);
    reg [7:0] mem [0:7]; // 8x8 memory array

    // Initialize memory and outputs
    integer i;
    initial begin
        outa = 0;
        outb = 0;
        for (i = 0; i < 8; i = i + 1)
            mem[i] = 0;
    end

    // Port A Operations
    always @(posedge clka) begin
        if (ena) begin
            if (wea) mem[ada] <= ina;  // Synchronous write
            else     outa      <= mem[ada]; // Synchronous read
        end
    end

    // Port B Operations
    always @(posedge clkb) begin
        if (enb) begin
            if (web) mem[adb] <= inb;  // Synchronous write
            else     outb     <= mem[adb]; // Synchronous read
        end
    end

endmodule