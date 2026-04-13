odule top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    wire [100:0]c;
    assign c[0]=cin;

    genvar i;
    generate
        for(i=0;i<100;i++)
            begin:fa_block
                full_adder fa_2(.a(a[i]),.b(b[i]),.cout(c[i+1]),.cin(c[i]),.sum(sum[i]));
        end
    endgenerate
    assign cout=c[100:1];
endmodule
module full_adder(
    input a, b,
    input cin,
    output cout,
    output sum
);
    assign sum=a^b^cin;
    assign cout=(a&b)|(cin&a)|(b&cin);
endmodule
