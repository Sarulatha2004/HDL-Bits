module top_module (
    input clk,
    input reset,     
    input w,
    output z);
    
    reg [2:0] state, next_state;
    parameter A=0;
    parameter B=1;
    parameter C=2;
    parameter D=3;
    parameter E=4;
    parameter F=5;
    
    always @ (posedge clk)
        begin
            if(reset)
                state <= A;
            else 
                state <= next_state;
        end
    always @(*)
        begin
            case (state)
                A:next_state <= w ? A:B;
                B:next_state <= w ? D:C;
                C:next_state <= w ? D:E;
                D:next_state <= w ? A:F;
                E:next_state <= w ? D:E;
                F:next_state <= w ? D:C;
                default:next_state <=A;
            endcase
        end
    assign z= (state ==E) || (state == F);	

endmodule
