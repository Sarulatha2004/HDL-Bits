module top_module();
    reg [1:0]in;
    wire out;
    andgate uut(.in(in),.out(out));
    initial begin
        $dumpfile("and.vcd");
        $dumpvars;
        $monitor("in:%b   out:%b  " , in ,out);
        in=2'b00;#10;
        in=2'b01;#10;
        in=2'b10;#10;
        in=2'b11;#10;
    end

endmodule
