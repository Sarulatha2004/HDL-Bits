module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    wire [1:0] carry ;
    counter60 ss0(clk , reset , ena , carry[0] , ss[7:0]) ;
    counter60 mm0(clk , reset , carry[0] , carry[1] , mm[7:0]) ;
    counter12 hh0(clk , reset , carry[1] && carry[0] , pm , hh[7:0]) ;
    
endmodule

module counter60(
    input clk ,
    input reset ,
    input en ,
    output carry ,
    output reg [7:0] Q
);
    assign carry = (Q == 8'h59) ;
    always @(posedge clk)  
        begin
           if(reset)  
               Q <= 0 ;
           else if(en) 
             begin
               Q[3:0] <= (Q[3:0] == 4'h9) ? 0 : Q[3:0] + 1 ;
               if(Q[3:0] == 4'h9)  
                  Q[7:4] <= (Q[7:4] == 4'h5) ? 0 : Q[7:4] + 1 ;
              end
        end
endmodule

module counter12(
    input clk ,
    input reset ,
    input en ,
    output reg pm ,
    output reg [7:0] Q  
);
    always @(posedge clk)  
        begin
           if(reset)   
               Q <= 8'b0001_0010 ;
           else if(en)
               begin
                   case(Q[3:0]) 
                        4'b1001 : Q[7:0] <= 8'b0001_0000 ;
                        4'b0010 : begin
                                      if(Q[7:4] == 4'h1) 
                                         Q <= 8'h01 ;
                                      else    
                                         Q[3:0] <= Q[3:0] + 1 ;
                                  end
                        default : Q[3:0] <= Q[3:0] + 1 ;
                   endcase
               end
        end

    always @(posedge clk)  
      begin
        if(reset)  
            pm <= 0 ;
        else if(en && Q[7:0] == 8'h11) 
            pm <= ~pm ;
        else 
            pm <= pm ;
      end

endmodule
