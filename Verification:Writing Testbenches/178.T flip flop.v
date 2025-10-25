module top_module ();
    reg clk,reset,t;
    wire q;
    tff uut(.clk(clk), .reset(reset), .t(t), .q(q));
    always #5 clk=~clk;
    initial begin
        clk=0;
        reset=1;#10
        reset=0;
        t=1;#5;
        t=0;#5
        t=1;#10
        reset=1;#5
        t=0;#5
        reset=0;#5
        t=1;#5;
    end

    

endmodule
