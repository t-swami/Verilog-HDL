`timescale 1ns / 1ps
module universalShiftReg #(parameter N = 8) (
    input clk,
    input rst,
    input [1:0] sel,            
    input [N-1:0] data_in,            
    output reg [N-1:0] data_out 
);

always @(posedge clk or posedge rst) begin
    if (rst)
        data_out <= 0;
    else begin
        case (sel)
            2'b00: data_out <= data_out;  // Hold
            2'b01: data_out <= {1'd0, data_out[N-1:1]}; // Shift Right
            2'b10: data_out <= {data_out[N-1:0], 1'd0};  // Shift Left
            2'b11: data_out <= data_in;    // Parallel Load
        endcase
    end
end

endmodule

