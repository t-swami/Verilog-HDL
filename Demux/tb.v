`timescale 1ns / 1ps
module tb;
reg in4,in2;
reg [1:0]s4;
reg s2;
wire[1:0]y2;
wire [3:0]y4;

demux dut (.in4(in4), .in2(in2), .s4(s4), .s2(s2), .y2(y2), .y4(y4));

initial 
    begin
    //for 1:2 demux                 //for 1:4 demux   
    in2=1'd0;  s2=1'd0;             in4 = 1'd0; s4=2'd0; #2
    in2=1'd1;  s2=1'd0;             in4 = 1'd1; s4=2'd0; #2
    in2=1'd1;  s2=1'd1;             in4 = 1'd1; s4=2'd1; #2
                                    in4 = 1'd1; s4=2'd2; #2
                                    in4 = 1'd1; s4=2'd3; #2
    $stop;   
    end 
endmodule
