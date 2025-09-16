module top_module (
    input clk,
    input j,
    input k,
    output Q);
    always @(posedge clk)
        Q=j?(k?~Q:1):(k?0:Q);

endmodule
