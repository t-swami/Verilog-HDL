`timescale 1ns / 1ps
module fibonacciSeries( input rst,clk,
                        output  [31:0]y
                        );
reg [31:0] previous,current;
always @(posedge clk or posedge rst)
begin
    if(rst)
        begin 
            previous <= 0;
            current <=1;
        end
    else
        begin 
            previous <= current;
            current <=y;
        end
end
assign y = previous +current;
endmodule
