module top_module ( );
    reg clk;
    dut clock (.clk(clk));
    always #5 clk=~clk;
    initial begin
        $dumpfile("clk.vcd");
        $dumpvars;
        clk=0;
    end


endmodule
