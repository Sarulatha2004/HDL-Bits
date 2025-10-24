module top_module (
    input clk,
    input reset, 
    input x,
    output z
);
    
    reg [2:0]state,next_state;
    parameter S0=0;
    parameter S1=1;
    parameter S2=2;
    parameter S3=3;
    parameter S4=4;
    
    always @(posedge clk)
        begin
            if(reset) 
                state <= S0;
            else
                state <= next_state;
        end
    always @(x or state)
        begin
            case(state)
                 S0: next_state <= x? S1: S0;
                 S1: next_state <= x? S4: S1;
                 S2: next_state <= x? S1: S2;
                 S3: next_state <= x? S2: S1;
                 S4: next_state <= x? S4: S3;
                default:next_state <= S0;
            endcase
        end
    assign z=(state == S3) || (state == S4);


endmodule
