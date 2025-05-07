`timescale 1ns / 1ps
module segment7_tb;
reg [3:0]bcd;
wire [6:0]seg;

integer i;
segment7 dut(.bcd(bcd), .seg(seg));
initial begin
$monitor("bcd =%d, segment7 in Bin = %b, segment7 in HEX = %h",bcd,seg,seg);
    for(i=0;i<11;i=i+1)
    begin
        bcd = i; #10;
    end
    #50 $stop;
end
endmodule
