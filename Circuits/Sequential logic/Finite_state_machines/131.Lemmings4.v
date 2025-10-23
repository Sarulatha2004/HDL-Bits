module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    
    reg [3:0]state,next_state;
    parameter LEFT=0;
    parameter RIGHT=1;
    parameter FALL_LEFT=2;
    parameter FALL_RIGHT=3;
    parameter DIG_LEFT=4;
    parameter DIG_RIGHT=5;
    parameter SPLATTER=6;
    
    always @(posedge clk or posedge areset)
        begin
            if(areset)
                state <= LEFT;
            else
                state <= next_state;
        end
    
    reg [4:0]count;
    
    
    always @(posedge clk or posedge areset)
        begin
            if(areset)
                count <=0;
            else if(state == FALL_LEFT || state == FALL_RIGHT)
                count <= count < 20 ? count +1:count;
            else if(state == LEFT || state == RIGHT)
                count <=0;
            else
                count <= count;
        end
    always @(*)
        begin
            case(state)
                LEFT:next_state <= ground ? (dig ?DIG_LEFT:(bump_left ? RIGHT:LEFT)) : FALL_LEFT;
                RIGHT:next_state <= ground ? (dig ? DIG_RIGHT:(bump_right ? LEFT:RIGHT)): FALL_RIGHT;
                FALL_LEFT:next_state <=ground ? (count >= 20 ? SPLATTER :LEFT):FALL_LEFT;
                FALL_RIGHT:next_state <= ground ? (count >= 20 ? SPLATTER :RIGHT) : FALL_RIGHT;
                DIG_LEFT:next_state <= ground ? DIG_LEFT: FALL_LEFT;
                DIG_RIGHT :next_state <= ground ? DIG_RIGHT : FALL_RIGHT;
                SPLATTER :next_state <= SPLATTER;
                default:next_state <= LEFT;
            endcase
        end
    assign walk_left =( state == SPLATTER) ? 1'b0:(state == LEFT);
    assign walk_right = ( state == SPLATTER) ? 1'b0:(state == RIGHT);
    assign aaah= (state==SPLATTER) ? 1'b0: (state == FALL_LEFT || state == FALL_RIGHT);
    assign digging = (state == SPLATTER) ? 1'b0:(state==DIG_LEFT || state == DIG_RIGHT); 
    


endmodule
