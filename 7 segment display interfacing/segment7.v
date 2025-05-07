`timescale 1ns / 1ps
module segment7( input [3:0]bcd,
                   output reg [6:0]seg 
                   );
always @(bcd)
begin
    case(bcd)
        0 : seg = 7'b1000000;
        1 : seg = 7'b1111001;
        2 : seg = 7'b0100100;
        3 : seg = 7'b0110000;
        4 : seg = 7'b0011001;
        5 : seg = 7'b0010010;
        6 : seg = 7'b0000010;
        7 : seg = 7'b1111000;
        8 : seg = 7'b0000000;
        9 : seg = 7'b0010000;
        default:seg = 7'b1111111;
        endcase    
end
endmodule

// For FPGA implemantation
module sevenSegment_top(an,sw,seg);
input [3:0]sw;
output [6:0]seg;
output reg [7:0]an =8'b11111110;
segment7 top(.bcd(sw), .seg(seg));
endmodule
