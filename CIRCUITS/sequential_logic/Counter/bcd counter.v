module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    bcdcount c0 (clk, reset, 1'b1, q[3:0]);

    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[3:0] == 4'd9) && (q[7:4] == 4'd9);
    assign ena[3] = (q[3:0] == 4'd9) && (q[7:4] == 4'd9) && (q[11:8] == 4'd9);

  
    bcdcount c1 (clk, reset, ena[1], q[7:4]);
    bcdcount c2 (clk, reset, ena[2], q[11:8]);
    bcdcount c3 (clk, reset, ena[3], q[15:12]);

endmodule

module bcdcount (
    input clk,
    input reset,
    input enable,
    output reg [3:0] Q
);

    always @(posedge clk) begin
        if (reset)
            Q<=4'd0;
        else if (enable) begin
            if (Q==4'd9)
                Q<=4'd0;
            else
                Q<=Q+1;
        end
    end

endmodule
