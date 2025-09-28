module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @ (posedge clk)
        begin
            if(reset)
                q<=0;
            else
                begin
                  if(~slowena)
                     q<=q;
                  else
                     begin
                        if(q<9)
                          q<=q+1;
                        else
                          q<=0;
                     end
               end
       end

endmodule
