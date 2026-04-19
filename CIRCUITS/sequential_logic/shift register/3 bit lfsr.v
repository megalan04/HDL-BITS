module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    mux m0(KEY[0],KEY[1],SW[0],LEDR[2],LEDR[0]);
    mux m1(KEY[0],KEY[1],SW[1],LEDR[0],LEDR[1]);
    mux m2(KEY[0],KEY[1],SW[2],LEDR[2]^LEDR[1],LEDR[2]);


endmodule
module mux(
    input clk,
    input L,
    input r_in,
    input q_in,
    output Q
);
    always@(posedge clk)
        begin
            case(L)
                1'b0:Q<=q_in;
                1'b1:Q<=r_in;
            endcase
        end
endmodule
