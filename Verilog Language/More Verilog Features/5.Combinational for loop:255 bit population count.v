module top_module( 
    input [254:0] in,
    output [7:0] out );
    integer i;
    always @(*)begin
        out=0;
    for(i=0;i<=254;i++)
        out=in[i]+out;
    end
    

endmodule
