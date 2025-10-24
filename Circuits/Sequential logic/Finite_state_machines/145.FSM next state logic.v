module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    reg [2:0]Y;
    parameter A=0;
    parameter B=1;
    parameter C=2;
    parameter D=3;
    parameter E=4;
    parameter F=5;
    
    always @ (*)
        begin
            case(y)
                A:Y <= w?A:B;
                B: Y <= w?D:C;
                C: Y <= w?D:E;
                D:Y <=  w?A:F;
                E: Y <= w?D:E;
                F: Y <= w?D:C;
                default:Y <=A;
            endcase
        end
    assign Y2= Y[1];
    
            
                
                

endmodule
