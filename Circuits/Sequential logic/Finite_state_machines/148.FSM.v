module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
    
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
                A:next_state = w ? B:A;
                B:next_state = w ? C:D;
                C:next_state = w ? E:D;
                D:next_state = w ? F:A;
                E:next_state = w ? E:D;
                F:next_state = w ? C:D;
                default:next_state =A;
            endcase
        end
    assign z= (state ==E) || (state == F);	

endmodule
