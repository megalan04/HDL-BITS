module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i;
    always@(*)begin
        for(int i=0;i<100;i++)
            out[99-i]=in[i];
    end

endmodule
