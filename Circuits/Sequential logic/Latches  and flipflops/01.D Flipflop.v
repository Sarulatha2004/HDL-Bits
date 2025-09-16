module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//

                   // Use a clocked always block
    always @(posedge clk) begin
        q<=d;
    end//   copy d to q at every positive edge of clk
    //   Clocked always blocks should use non-blocking assignments

endmodule
