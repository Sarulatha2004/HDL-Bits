module top_module(
    input clk,
    input areset,   
    input in,
    output out);

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    
        case(state)
            A:next_state= in ? A:B;
            B:next_state = in ? B:A;
            default:next_state =B;
        endcase
       
       
    end
 assign out = state == B;
    always @(posedge clk, posedge areset) begin
        
         if(areset)
            state <= B;
        else
            state <= next_state;
    end


endmodule
