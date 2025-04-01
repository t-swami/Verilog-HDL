`timescale 1ns / 1ps
// Test bench
module testbench;
reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire [3:0]c;

RCA DUT(a,b,cin,c,s);
initial
begin 

    a=4'd4;b=4'd9;cin=0;
    #10 a=4'd5;b=4'd10;  
    #10 a=4'd10;b=4'd10;
   
  #10 $stop;

  end  
   endmodule

