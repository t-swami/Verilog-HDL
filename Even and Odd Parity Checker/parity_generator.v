`timescale 1ns / 1ps
module parity_generator(input [7:0] in,
                        output reg evenParity,
                        output reg oddParity
                        );
    integer i;
    always @(*) begin
        evenParity = 0;
        for(i = 0; i < 8; i = i + 1)
            evenParity = evenParity ^ in[i];
            oddParity = ~evenParity;            // we can do by xnor gate also for odd Parity.
     end
endmodule
