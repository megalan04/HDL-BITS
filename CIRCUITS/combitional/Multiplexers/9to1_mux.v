module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    reg[15:0]out1;
always@(*)begin
        case(sel)
             4'd0:out1=a;
             4'd1:out1=b;
             4'd2:out1=c;
             4'd3:out1=d;
             4'd4:out1=e;
             4'd5:out1=f;
             4'd6:out1=g;
             4'd7:out1=h;
             4'd8:out1=i;
            default:out1='1;
        endcase
    end
    assign out=out1;
endmodule
