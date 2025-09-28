module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    wire [11:0]w;

    bcdcount counter0 (clk, reset, c_enable[0],w[3:0]);
    bcdcount counter1 (clk, reset, c_enable[1],w[7:4]);
    bcdcount counter2 (clk, reset, c_enable[2],w[11:8]);
    assign {OneHertz, c_enable} = {w[11:0] == 12'h999, w[7:0] == 8'h99, w[3:0] == 4'h9, 1'b1};

endmodule
