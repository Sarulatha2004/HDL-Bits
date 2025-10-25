module top_module (
    input clk,
    input resetn,    
    input x,
    input y,
    output f,
    output g
); 
    
    reg [3:0] state , next_state;
    parameter A=0;
    parameter B=1;
    parameter C=2;
    parameter S0=3;
    parameter S1=4;
    parameter S2=5;
    parameter Y0=6;
    parameter G0=7;
    parameter G1=8;
    
    always @ (posedge clk)
        begin
        if(!resetn)
            state <= A;
        else
            state <= next_state;
        end
    always @(*)
        begin
            case(state)
                A:next_state <= B;
                B:next_state <= C;
                C:next_state <= x? S0: C;
                S0:next_state <= x?S0:S1;
                S1: next_state <=x?S2:C;
                S2:next_state <=y?	G1:Y0;
                Y0:next_state <=y? G1:G0;
                G0:next_state <= G0;
                G1:next_state <=G1;
                default : next_state <=A;
            endcase
        end
    assign f=state == B;
    assign g = (state == S2) || (state == Y0) || (state == G1);
            

endmodule
