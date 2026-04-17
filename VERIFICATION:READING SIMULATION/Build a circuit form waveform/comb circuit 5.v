module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );
    
    reg[3:0]q1;
    always@(*)begin
        case(c)
            4'd0:q1=b;
            4'd1:q1=e;
            4'd2:q1=a;
            4'd3:q1=d;
            4'd4:q1=4'hf;
            4'd5:q1=4'hf;
            4'd6:q1=4'hf;
            4'd7:q1=4'hf;
            4'd8:q1=4'hf;
            4'd9:q1=4'hf;
            4'd10:q1=4'hf;
            4'd11:q1=4'hf;
            4'd12:q1=4'hf;
            4'd13:q1=4'hf;
            4'd14:q1=4'hf;
            4'd15:q1=4'hf;
        endcase
    end
    assign q=q1;
           
            
            

endmodule
