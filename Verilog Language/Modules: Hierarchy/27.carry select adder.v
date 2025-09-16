module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0]w1,w2,sum1,sum2;
    add16 adder_1(a[15:0],b[15:0],0,sum[15:0],w1);
    add16 adder_2(a[31:16],b[31:16],0,sum1,w2);
    add16 adder_3(a[31:16],b[31:16],1,sum2,w2);
    
    always @ (*) begin
        case(w1)
            0:sum[31:16]=sum1;
            1:sum[31:16]=sum2;
        endcase
    end

endmodule
