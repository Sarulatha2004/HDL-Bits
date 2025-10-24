module top_module (
    input clk,
    input reset,  
    input s,
    input w,
    output z
);
    reg[1:0]count;
    reg [1:0] state,next_state;
    parameter A=0;
    parameter B=1;
    parameter C=2;
    parameter D=3;
    
    always @ (posedge clk )
        begin
           if(reset)
               state <= A;
           else
                state <= next_state;
        end
    always @(*)
        begin
            case(state)
            A:next_state <= s ? B:A;
            B:next_state <= C;
            C:next_state <= D;
            D:next_state <=B;
            default: next_state <= A;
            endcase
        end
    always @(posedge clk)
        begin
            if(reset)
                count <=0;
            else
                case(state)
                    B:count<=w;
                    C:count <= count+w;
                    D:count <= count+w;
                    default:count<=0;
                endcase
        end
    assign z= state==B && count ==2;
                  

endmodule
