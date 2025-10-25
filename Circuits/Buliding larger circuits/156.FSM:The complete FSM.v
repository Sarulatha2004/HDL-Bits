module top_module (
    input clk,
    input reset,      
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    reg[3:0] state,next_state;
    parameter S0=0;
    parameter S1=1;
    parameter S2=2;
    parameter S3=3;
    parameter B0=4;
    parameter B1=5;
    parameter B2=6;
    parameter B3=7;
    parameter COUNT=8;
    parameter WAIT=9;
    
    always @(posedge clk)
        begin
            if(reset)
                state <= S0;
            else
                state <= next_state;
        end
    always @(*) begin
        case(state)
            S0: next_state = data ? S1: S0;
            S1: next_state = data ? S2: S0;
            S2: next_state = data ? S2: S3;
            S3: next_state = data ? B0: S0;
            B0: next_state = B1;
            B1: next_state = B2;
            B2: next_state = B3;
            B3: next_state = COUNT;
            COUNT: next_state = done_counting ? WAIT: COUNT;
            WAIT: next_state = ack ? S0 : WAIT;
            default : next_state = S0;
        endcase
    end
    
    assign shift_ena = (state == B0) || (state == B1) || (state == B2) || (state == B3) ;
    assign counting = state == COUNT;
    assign done = state == WAIT;
endmodule
