`timescale 1ns / 1ps
//


module tb;
reg [3:0]a,b;
reg ctrl;
wire [3:0]q,cout;
wire cFinal;

adder_Subtractor dur(.a(a),
                       .b(b),
                       .ctrl(ctrl),
                       .q(q),
                       .cout(cout),
                       .cFinal(cFinal)
                        );
initial begin
$monitor ( "ctrl = %b, a = %b, b = %b ,Answer = %b, Final Carry = %b", ctrl,a,b,q,cFinal); 
//for adder 
    ctrl = 1'd0; a = 4'd4; b = 4'd7; #2
    ctrl = 1'd0; a = 4'd5; b = 4'd15; #2
    ctrl = 1'd0; a = 4'd2; b = 4'd10; #2
    
// for subtractor
       ctrl = 1'd1; a = 4'd8; b = 4'd7; #2
       ctrl = 1'd1; a = 4'd15; b = 4'd5; #2
       ctrl = 1'd1; a = 4'd9; b = 4'd5; #2
       $stop;
       
       
end
endmodule
