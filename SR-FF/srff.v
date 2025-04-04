`timescale 1ns / 1ps
module srff (
  input s, r, clk, rst,
  output reg q, q1
);
  
  always @(posedge clk or posedge rst) begin 
    if (rst) begin 
      q <= 1'd0; 
      q1 <= 1'd1; 
    end else begin
      case ({s, r})
        2'b00: begin q <= q;   q1 <= ~q; end  // No change
        2'b01: begin q <= 1'd0; q1 <= 1'd1; end  // Reset
        2'b10: begin q <= 1'd1; q1 <= 1'd0; end  // Set
        2'b11: begin q <= 1'bx; q1 <= 1'bx; end  // Invalid inputs
      endcase
    end
  end
endmodule
