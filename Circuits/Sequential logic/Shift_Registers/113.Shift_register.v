module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    
    always @(posedge KEY[0])
        begin
        if(KEY[2])
            LEDR<=SW;
        else
            begin
                if(KEY[1])
                    LEDR<= {KEY[3], LEDR[3:1]};
                else
                    LEDR<=LEDR;
            end
        end

endmodule
