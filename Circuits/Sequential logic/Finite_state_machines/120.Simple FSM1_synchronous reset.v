module top_module(clk, reset, in, out);
    input clk;
    input reset;    
    input in;
    output out;
    reg out;


    reg present_state, next_state;
    parameter A=0;
    parameter B=1;

    always @(posedge clk) begin
        if (reset)  
            present_state <= B;
        else 
            present_state <= next_state;

        end
    always @ (*) begin
        case (present_state)
            A: next_state = in ? A:B;
            B: next_state = in ? B:A;
            default : next_state=  B;
        endcase
    end
 assign out = present_state == B;
  

endmodule
