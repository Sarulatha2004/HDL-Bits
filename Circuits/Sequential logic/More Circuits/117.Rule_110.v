module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    
    
    always @(posedge clk)
     begin
      if (load) 
        q <= data;
      else
        q <= ~(q>>1)&q | q&~(q<<1) | ~q&(q<<1);
     end
endmodule
