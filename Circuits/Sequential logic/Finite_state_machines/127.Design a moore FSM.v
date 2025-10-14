module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    reg [1:0] state , next_state; 
    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11; 
    always @(posedge clk)
        begin
        if (reset) 
            state <= A;
        else 
            state <= next_state;
        end
    
    always @(*) begin
        case (state) 
            A: next_state = s[1] ? B : A; 
            B: next_state = s[2] ? C : (s[1] ? B : A); 
            C: next_state = s[3] ? D : (s[2] ? C : B); 
            D: next_state = s[3] ? D : C; 
            default: next_state = A;
        endcase 
    end
    reg lower;
    always @(posedge clk) 
        if (reset)
            lower = 1'b0;
    else 
        lower = next_state < state ? 1'b1 : (next_state > state ? 1'b0 : lower);
    assign fr3 = state == A; 
    assign fr2 = state <= B; 
    assign fr1 = state <= C; 
    assign dfr = state == A || lower;

endmodule
