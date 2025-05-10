`timescale 1ns / 1ps

module tb_mealyFSM_1010;

  // Inputs
  reg clk;
  reg rst;
  reg in;

  // Output
  wire out;

  // Instantiate the Unit Under Test (UUT)
  mealyFSM_1010 uut (
    .in(in), 
    .clk(clk), 
    .rst(rst), 
    .out(out)
  );

  always #5 clk = ~clk;

  initial begin
  
 $monitor ("Time = %t, in = %b , out = %b",$time,in,out);
  
    clk = 0;
    rst = 1;
    in = 0;

    #10;
    rst = 0;

    
    
    #10 in = 1;  
    #10 in = 0;  
    #10 in = 1;  
    #10 in = 0;  
    // 1010
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;  


    #10 in = 1;
    #10 in = 1;
    #10 in = 0;

    #10 in = 0;

    #20 $finish;
  end

endmodule
