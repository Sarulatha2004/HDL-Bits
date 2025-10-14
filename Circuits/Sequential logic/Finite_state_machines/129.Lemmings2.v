module top_module(
    input clk,
    input areset,    
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT =0;
    parameter RIGHT =1;
    parameter FALL_LEFT =2;
    parameter FALL_RIGHT=3;
    reg [1:0]state,next_state;
    
    always @(posedge clk or posedge areset)
        begin
            if(areset)
                state <= LEFT;
            else
                state <= next_state;
        end
    always @(*)
        begin
            case(state)
                LEFT: next_state <= ground ? (bump_left?RIGHT:LEFT):FALL_LEFT;
                RIGHT:next_state <= ground ? (bump_right ? LEFT:RIGHT):FALL_RIGHT ;
                FALL_LEFT: next_state <= ground ? LEFT:FALL_LEFT;
                FALL_RIGHT:next_state <= ground ? RIGHT :FALL_RIGHT;
                default: next_state <= LEFT;
                
            endcase
        end
    assign walk_left = state== LEFT;
    assign walk_right = state == RIGHT;
    assign aaah= state == FALL_LEFT || state ==FALL_RIGHT;
                

endmodule
