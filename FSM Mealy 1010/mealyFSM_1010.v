`timescale 1ns / 1ps

module mealyFSM_1010 (
    input in,
    input clk, rst,
    output reg out
);

parameter s1 = 0, s2 = 1, s3 = 2, s4 = 3;
reg [1:0] pState, nState;

// State register (sequential logic)
always @(posedge clk or posedge rst)
begin
    if (rst)
        pState <= s1;
    else
        pState <= nState;
end

// Next state and output logic
always @(*) begin
    out = 0;  // default
    case(pState)
        s1: begin
            if (in)
                nState = s2;
            else
                nState = s1;
        end
        s2: begin
            if (in)
                nState = s2;
            else
                nState = s3;
        end
        s3: begin
            if (in)
                nState = s4;
            else
                nState = s1;
        end
        s4: begin
            if (in)
                nState = s2;
            else begin
                nState = s1;
                out = 1;  
            end
        end
        default: begin
            nState = s1;
        end
    endcase
end

endmodule
