module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire w1;
    wire [31:0]xor_out;
    assign xor_out = {32{sub}}^b;
    add16 adder1 (a[15:0],xor_out[15:0],sub,sum[15:0],w1); 
    add16 adder2 (a[31:16],xor_out[31:16],w1,sum[31:16]); 

endmodule
