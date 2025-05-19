`timescale 1ns / 1ps

module single_port_rom (
    input clk,
    input en,
    input [2:0] addres,
    output reg [7:0] data_out
);

    reg [7:0] mem [0:7];
    reg [2:0] addr_reg;

    initial begin
        mem[0] = 8'b00000001;
        mem[1] = 8'b00000010;
        mem[2] = 8'b00000011;
        mem[3] = 8'b00000100;
        mem[4] = 8'b00000101;
        mem[5] = 8'b00000110;
        mem[6] = 8'b00000111;
        mem[7] = 8'b00001000;
        
        data_out = 8'b00000000;
    end

    always @(posedge clk) begin
        if (en) begin
            data_out <= mem[addres];  
        end
        else
            data_out <= data_out;
    end 
endmodule