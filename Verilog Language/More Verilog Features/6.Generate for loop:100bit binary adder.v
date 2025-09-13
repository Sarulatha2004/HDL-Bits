module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    fulladder FA_0(a[0],b[0], cin, sum[0], cout[0]);
    genvar i;
    generate
        for (i = 1; i < 100; i = i + 1) begin:adder
         fulladder FA_i (a[i], b[i], cout[i - 1], sum[i], cout[i]);
    end
    endgenerate
endmodule
    module fulladder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
assign sum = a ^ b ^ cin;
assign cout = a&b | a&cin | b&cin;
endmodule
