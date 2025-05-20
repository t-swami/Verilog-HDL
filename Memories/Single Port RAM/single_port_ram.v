`timescale 1ns / 1ps
module single_port_ram (
    input clk,                 
    input en,                  
    input we,      // write enable            
    input [2:0] address,       
    input [7:0] data_in,      
    output reg [7:0] data_out  
);

    reg [7:0] mem [0:7];
    integer i;
    initial begin
        
        for (i = 0; i < 8; i = i + 1)
            mem[i] = 8'h00;   // just keeping the memory to empty
        data_out = 8'h00;
    end

    always @(posedge clk) begin
        if (en) begin
            if (we)
                mem[address] <= data_in;        // Write
            else
                data_out <= mem[address];       // Read
        end
    end

endmodule

