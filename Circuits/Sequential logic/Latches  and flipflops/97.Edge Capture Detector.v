module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]last;
    always @(posedge clk) begin
        last<=in;
        if(reset)
            begin
                out<=32'b0;
            end
        else
            begin
                out<=out | (last & ~in);
            end
    end
endmodule
