module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    reg[511:0]q1;
    integer i;
    always@(posedge clk)begin
        if(load) begin
            q1<=data;
        end
        else begin
            for(i=0;i<512;i=i+1)begin
                if(i==0)
                    q1[i]<=q[i+1]^1'b0;  
                else if (i==511)
                    q1[i]<=q[i-1]^1'b0;  
                else
                    q1[i]<=q[i-1]^q[i+1];
            end
        end
    end
    assign q=q1;


endmodule
