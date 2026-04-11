module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
     wire c;
    wire [31:0]s;
    assign s=b^{32{sub}};
    add16 m1(.a(a[15:0]),.b(s[15:0]),.cin(sub),.cout(c),.sum(sum[15:0]));
    add16 m2(.a(a[31:16]),.b(s[31:16]),.cin(c),.cout(),.sum(sum[31:16]));

endmodule
