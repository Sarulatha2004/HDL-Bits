module top_module (
    input clk,
    input aresetn,    
    input x,
    output z ); 
    
    reg [1:0] state,next_state;
    
    parameter S0=0;
    parameter S1=1;
    parameter S2=2;
    
    always @(posedge clk or negedge aresetn)
        begin
          if(!aresetn)
            state <= S0;
          else
              state <= next_state;
        end
    always @(x or state)
        begin
            case(state)
                S0: next_state = x?S1:S0;
                S1:next_state  = x?S1:S2;
                S2:next_state = x? S1:S0;
                default :next_state = S0;
            endcase
        end
    assign z= x==1 && state == S2; 

endmodule
