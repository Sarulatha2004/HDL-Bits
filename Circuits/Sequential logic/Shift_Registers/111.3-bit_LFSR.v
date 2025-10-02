module top_module (
	input [2:0] SW,      
	input [1:0] KEY,     
	output [2:0] LEDR);  
    always @(posedge KEY[0])
      begin
        if(KEY[1])
            LEDR<=SW;
        else
            LEDR<={LEDR[2]^LEDR[1],LEDR[0],LEDR[2]};
      end


endmodule
