module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    wire [7:0]x,y;
    assign x=(a<b)?a:b;
    assign y=(c<d)?c:d;
    assign min=(x<y)?x:y;
endmodule
