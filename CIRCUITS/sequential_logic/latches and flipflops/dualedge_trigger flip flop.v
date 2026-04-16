module top_module (
    input clk,
    input d,
    output q
);
    wire posedg,negedg;
    always@(posedge clk)
        posedg<=d;
    always@(negedge clk)
        negedg<=d;
    assign q=clk?posedg:negedg;

endmodule
