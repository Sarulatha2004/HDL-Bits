module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [2:0] state ,next_state;
    parameter A=0;
    parameter B=1;
    parameter C=2;
    parameter D=3;
    parameter E=4;
    
    always @(posedge clk)
        begin
            if(reset)
                state <= A;
            else
                state <= next_state;
        end
    always @(*)
        begin
            case(state)
                A: begin
                    next_state = B;
                    shift_ena =1'b1;
                end
                B: begin
                    next_state = C;
                    shift_ena =1'b1;
                end
                C: begin
                    next_state = D;
                    shift_ena =1'b1;
                end
                D: begin
                    next_state = E;
                    shift_ena =1'b1;
                end
                E: begin
                    next_state = E;
                    shift_ena =1'b0;
                end
            endcase
        end

endmodule
