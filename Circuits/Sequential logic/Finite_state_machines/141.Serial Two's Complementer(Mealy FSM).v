module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg [1:0]state,next_state;
    parameter A=0;
    parameter B=1;
    always @(posedge clk or posedge areset)
        begin
            if(areset)
                state <= A;
            else
                state <= next_state;
        end
    always @(x or state)
        begin
            case(state)
                A:begin
                    next_state = x ? B:A;
                    z=x;
                end
                B:begin
                    next_state =B;
                    z=~x;
                end
                default:next_state =A;
            endcase
        end


endmodule


