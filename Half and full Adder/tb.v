`timescale 1ns / 1ps

module tb; 
  reg a, b, cin;
  wire sh,ch,sf,cf;
  integer i;
  Adder dut (
            .a(a),
            .b(b),
            .cin(cin),
            .sh(sh),
            .ch(ch),
            .sf(sf),
            .cf(cf)
          );
 initial 
   begin
   $monitor("a = %b, b = %b, cin = %b",a,b,cin);
   $monitor(" halfAdderSum = %b, halfCarryOut = %b,FullAdderSum = %b, FullCarryOut = %b",sh,ch,sf,cf);

    for (i = 0; i <= 3'd7; i=i+1) 
    begin
      {a,b,cin} = i;
      #10;  
    end
    #10 $finish;
  end
endmodule


