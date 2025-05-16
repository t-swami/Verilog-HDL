`timescale 1ns / 1ps

module fsm_overlap_1011010_tb;
    reg in, clk, rst;
    wire out;

    FSM_overlap uut (.in(in), .clk(clk), .rst(rst), .out(out));

    reg [6:0] temp;
    integer i;

    always #5 clk = ~clk;

    initial begin
    $monitor("Temp = %b, out = %b",temp,out);
        clk = 0;
        rst = 1;
        in = 1; #10;
        rst = 0;

        temp = 7'b1011010; 
        i = 0;

        repeat(7) begin
            passing(temp[6 - i]); 
            i = i + 1;
        end
        
        temp = 7'b1011011;
        i = 0;
        repeat(7) begin
            passing(temp[6 - i]); 
            i = i + 1;
        end
        
        temp = 7'b1011001;
        i = 0;
        repeat(7) begin
            passing(temp[6 - i]); 
            i = i + 1;
        end
        
        temp = 7'b1011000;
        i = 0;
        repeat(7) begin
            passing(temp[6 - i]); 
            i = i + 1;
        end
        
         $stop;
    end

    task passing(input reg x);
        begin
            in = x;
            #10;
        end
    endtask

endmodule
