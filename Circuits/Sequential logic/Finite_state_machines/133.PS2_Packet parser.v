module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); 
    
    reg [1:0] state, next_state;
    parameter FIRST_BYTE=0;
    parameter SECOND_BYTE=1;
    parameter THIRD_BYTE=2;
    parameter DONE=3;
    
    always @(posedge clk )
        begin
        if(reset)
            state <= FIRST_BYTE;
        else 
            state <= next_state;
        end
    always @ (*)
        begin
            case(state)
                FIRST_BYTE : next_state = in[3] ? SECOND_BYTE: FIRST_BYTE;
                SECOND_BYTE :next_state =THIRD_BYTE;
                THIRD_BYTE : next_state = DONE;
                DONE: next_state = in[3] ? SECOND_BYTE : FIRST_BYTE;
                default: next_state=FIRST_BYTE;
            endcase
        end
    assign done = state== DONE;
    

endmodule
