module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    reg [1:0] next_state;
    
    parameter SNT=0;
    parameter WNT=1;
    parameter WT=2;
    parameter ST=3;
    
    always @(posedge clk or posedge areset)
        begin
            if(areset)
                state <=WNT;
            else
                begin
                    if(train_valid)
                        state <= next_state;
                    else
                        state <=state;
                end
        end
            
    
    
    always @(*)
        begin 
            case(state)
                SNT:next_state = train_taken ? WNT:SNT;
                WNT:next_state = train_taken ? WT:SNT;
                WT:next_state = train_taken ? ST :WNT;
                ST:next_state = train_taken ?ST :WT;
                default:next_state <= WNT;
                endcase
        end
                
            

endmodule
