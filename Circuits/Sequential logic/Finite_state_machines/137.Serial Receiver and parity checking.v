module top_module(
    input clk,
    input in,
    input reset,  
    output [7:0] out_byte,
    output done
); 
    
  
    
    reg [1:0] state,next_state;
    reg [3:0]count;
    wire odd;
    wire paritycheck;
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
               RECEIVE: next_state = count > 0 ? RECEIVE : (in ? (odd ? STOP:IDLE) : WAIT);
               STOP: next_state = in ? IDLE : RECEIVE;
               WAIT: next_state = in ? IDLE : WAIT;
               default: next_state = IDLE;
         endcase
        end
            
    always @ (posedge clk)
       begin
                    if(reset)
                        count <=10;
                    else
                        case(next_state)
                            IDLE:count <=10;
                            STOP:count <=10;
                            RECEIVE:count <= count-1;
                            default:count <= count;
                        endcase
        end
    
    parity uut(clk, paritycheck, in, odd);
    assign paritycheck = !(state == RECEIVE);

    assign done= state == STOP;
        
        always @ (posedge clk)
            begin
                 if (reset)
                   out_byte <= 8'b0;
                else if (next_state== RECEIVE && count > 0) 
                    out_byte[9 - count] <= in;
                else 
                    out_byte <= out_byte;                  
             end

endmodule

