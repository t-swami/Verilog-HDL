`timescale 1ns / 1ps

module clkDivBy2( input wire clk,
                  input wire rst,
                  output wire nclk
                  );
reg clk_temp;
always @(posedge clk or posedge rst)
begin
    if(rst) clk_temp <= 0;
    else clk_temp <= ~clk_temp;
end
assign nclk = clk_temp;
endmodule
