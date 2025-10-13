module top_module(
    input clk,
    input reset,  
    input j,
    input k,
    output out); 

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        case(state)
            OFF:next_state = j? ON:OFF;
            ON :next_state = k? OFF:ON;
            default: next_state <= OFF;
        endcase
    end
    
          assign out = state == ON;

    always @(posedge clk) begin
        if(reset)
            state <= OFF;
        else
            state <= next_state;
    end

  

endmodule

