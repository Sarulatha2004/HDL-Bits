module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    cntbcd cntbcd_0 (clk, reset, 1'b1, q[3:0]);
    cntbcd cntbcd_1 (clk, reset, ena[1], q[7:4]);
    cntbcd cntbcd_2 (clk, reset, ena[2], q[11:8]);
    cntbcd cntbcd_3 (clk, reset, ena[3], q[15:12]);
assign ena = {q[11:0] == 12'h999, q[7:0] == 8'h99, q[3:0] == 4'h9};

endmodule

module cntbcd (
    input clk,
    input reset,
    input ena,
    output reg [3:0] q
);
always @(posedge clk)
    if (reset) q <= 0;
    else
        begin
          if (~ena) 
              q <= q;
          else
            begin
              if(q<9)
                q<=q+1;
              else
                q<=0;
           end
        end
endmodule
