module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state
);
    reg state_reg=0;
    assign state=state_reg;
    always @(posedge clk) begin
        state_reg<=(a&b)|(state_reg&(a|b));
    end
    assign q=(a&b)|(state_reg&a);

endmodule
