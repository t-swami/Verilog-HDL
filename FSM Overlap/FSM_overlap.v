`timescale 1ns / 1ps
// 1011010
module FSM_overlap (
    input in,
    input clk, rst,
    output reg out
);

parameter a = 0, b = 1, c = 2, d = 3, e = 4, f = 5, g = 6;
reg [2:0] pState, nState;

// State register (sequential logic)
always @(posedge clk or posedge rst)
begin
    if (rst)
        pState <= a;
    else
        pState <= nState;
end

// Next state and output logic
always @(*) begin
    out = 0;  // default
    case(pState)
        a: begin
            if (in)
                nState = b;
            else
                nState = a;
        end
        b: begin
            if (in)
                nState = b;
            else
                nState = c;
        end
        c: begin
            if (in)
                nState = d;
            else
                nState = a;
        end
        d: begin
            if (in)
                nState = e;
            else begin
                nState = c;
            end
        end
        e: begin
            if (in)
                nState = b;
            else begin
                nState = f;
            end
        end
        f: begin
            if (in)
                nState = g;
            else begin
                nState = a; 
            end
        end
        g: begin
            if (in)
                nState = e;
            else begin
                nState = c;
                out = 1;  
            end
        end
        default: begin
            nState = a;
        end
    endcase
end

endmodule