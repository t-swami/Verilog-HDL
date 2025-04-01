`timescale 1ns / 1ps

module tb; 
  reg a, b, bin;
  wire bh,ch,bf,cf;
  integer i;
  Subtractor dut (
                .a(a),
                .b(b),
                .bin(bin),
                .bh(bh),
                .ch(ch),
                .bf(bf),
                .cf(cf)
                );
  initial
   begin
   $monitor("a = %b, b = %b, bin = %b,",a,b,bin);
   $monitor(" halfSubBorrow = %b, halfSubBorrwOut = %b,FullSubBorrow = %b, FullSubBorrwOut = %b",bh,ch,bf,cf);
   
   
    for (i = 0; i <= 3'd7; i=i+1) 
    begin
      {a,b,bin} = i;
      #10;  
    end
    #10 $finish;
  end
endmodule


