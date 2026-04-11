module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c;
    wire [15:0]s0,s1;
    add16 m1(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.cout(c),.sum(sum[15:0]));
    add16 m2(.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.cout(),.sum(s0));
    add16 m3(.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.cout(),.sum(s1));
    assign sum[31:16]=c?s1:s0;  

endmodule
