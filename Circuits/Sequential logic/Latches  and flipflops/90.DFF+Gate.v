module top_module (
    input clk,
    input in, 
    output out);
    wire din;
    assign din=in^out;
    always @(posedge clk)
        out<=din;

endmodule
