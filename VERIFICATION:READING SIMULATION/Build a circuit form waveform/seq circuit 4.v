module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state
);
  reg next;
    assign next=~a&b&state|a&(b|state);
    always @(posedge clk) 
        state<=next;
    assign q=a^b^state;

endmodule
