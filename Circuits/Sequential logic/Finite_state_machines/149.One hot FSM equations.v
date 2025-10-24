module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    assign Y1 = w & y[0];
    assign Y3 = (~w & y[1]) | (~w & y[2]) |(~w & y[4]) |(~w & y[5]);

endmodule
