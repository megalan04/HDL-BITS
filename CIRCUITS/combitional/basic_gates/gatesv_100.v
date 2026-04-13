module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    reg [98:0] out_both1;
    reg [99:1] out_any1;
    reg [99:0] out_different1;
    
    always@(*) begin
        integer i,j,k;
         for(i=0;i<99;i=i+1) begin
             out_both1[i]=in[i]&in[i+1];
        end
        for(j=99;j>=1;j=j-1) begin 
            out_any1[j]=in[j]|in[j-1];
        end
        for(k=0;k<99;k=k+1) begin 
            out_different1[k]=in[k]^in[k+1];
        end
        out_different1[99]=in[99]^in[0];
    end
assign out_both=out_both1;
assign out_any=out_any1;
assign out_different=out_different1;    
endmodule
