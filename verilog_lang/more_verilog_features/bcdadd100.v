module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [400:0]c;
    assign c[0]=cin;

    genvar i;
    generate
        for(i=0;i<100;i++)
            begin:fa_block
                bcd_fadd fa(.a(a[4*i+3:4*i]),.b(b[4*i+3:4*i]),.cout(c[i+1]),.cin(c[i]),.sum(sum[4*i+3:4*i]));
        end
    endgenerate
    assign cout=c[100];
  

endmodule
