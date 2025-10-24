module top_module(
    input clk,
    input in,
    input reset,  
    output done
); 
    reg [1:0] state,next_state;
    reg [3:0]count;
    parameter IDLE=0;
    parameter RECEIVE=1;
    parameter STOP=2;
    parameter WAIT=3;
    
    always @(posedge clk)
        begin
            if(reset)
                state <= IDLE;
            else
                state <= next_state;
        end
    always @(*)
        begin
           case (state)
               IDLE: next_state = in ? IDLE : RECEIVE;
               RECEIVE: next_state = count > 0 ? RECEIVE : (in ? STOP : WAIT);
               STOP: next_state = in ? IDLE : RECEIVE;
               WAIT: next_state = in ? IDLE : WAIT;
               default: next_state = IDLE;
         endcase
        end
            
            always @ (posedge clk)
                begin
                    if(reset)
                        count <=9;
                    else
                        case(next_state)
                            IDLE:count <=9;
                            STOP:count <=9;
                            RECEIVE:count <= count-1;
                            default:count <= count;
                        endcase
                end
    assign done= state == STOP;

endmodule
