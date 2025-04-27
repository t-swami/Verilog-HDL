`timescale 1ns / 1ps
module parity_generator_tb;
reg [7:0]in;
wire evenParity,oddParity;

parity_generator dut(.in(in), .evenParity(evenParity), .oddParity(oddParity));
initial begin
$monitor("in = %b, Even Parity = %b, Odd Parity = %b",in, evenParity, oddParity);
    in = 8'd255; #5
    in = 8'd100; #5
    in = 8'd88; #5
    in = 8'd111; #5
    $stop;
end
endmodule
