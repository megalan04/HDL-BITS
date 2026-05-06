module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);
    parameter [4:0] s0=4'd0,s1=4'd1,s2=4'd2,s3=4'd3,s4=4'd4,s5=4'd5,s6=4'd6,s7=4'd7,s8=4'd8,s9=4'd9;
    
    assign next_state[s0]=(state[0]&~in)|(state[1]&~in)|(state[2]&~in)|(state[3]&~in)|(state[4]&~in)|(state[7]&~in)|(state[8]&~in)|(state[9]&~in);
    assign next_state[s1]=(state[0]&in)|(state[8]&in)|(state[9]&in);
    assign next_state[s2]=(state[1]&in);
    assign next_state[s3]=(state[2]&in);
    assign next_state[s4]=(state[3]&in);
    assign next_state[s5]=(state[4]&in);
    assign next_state[s6]=(state[5]&in);
    assign next_state[s7]=(state[6]&in)|(state[7]&in);
    assign next_state[s8]=(state[5]&~in);
    assign next_state[s9]=(state[6]&~in);
    
    assign out1=state[9]||state[8];
    assign out2=state[9]||state[7];
    
    
endmodule
