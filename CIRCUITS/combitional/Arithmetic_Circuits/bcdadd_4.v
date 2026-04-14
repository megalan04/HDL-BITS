module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
   
    wire c0,c1,c2,c3;
    bcd_fadd b1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.sum(sum[3:0]),.cout(c0));
    bcd_fadd b2(.a(a[7:4]),.b(b[7:4]),.cin(c0),.sum(sum[7:4]),.cout(c1));
    bcd_fadd b3(.a(a[11:8]),.b(b[11:8]),.cin(c1),.sum(sum[11:8]),.cout(c2));
    bcd_fadd b4(.a(a[15:12]),.b(b[15:12]),.cin(c2),.sum(sum[15:12]),.cout(c3));
    
    assign cout=c3;




endmodule
