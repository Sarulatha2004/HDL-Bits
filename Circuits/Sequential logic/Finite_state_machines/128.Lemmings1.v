module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        
        case(state)
            LEFT:next_state <= bump_left ? RIGHT:LEFT;
            RIGHT: next_state <= bump_right ? LEFT:RIGHT;
            default : next_state <= LEFT;
        endcase
    end

    always @(posedge clk, posedge areset)
        begin
            if(areset)
                state <= LEFT;
            else
                state <= next_state;
         end

    assign walk_left = (state == LEFT)?1'b1:1'b0;
    assign walk_right = (state ==LEFT)? 1'b0:1'b1;

endmodule
