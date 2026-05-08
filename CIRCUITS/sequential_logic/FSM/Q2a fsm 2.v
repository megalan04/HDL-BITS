module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter [1:0] A=2'd0,
                    B=2'd1,
                    C=2'd2,
                    D=2'd3;
                    
    reg [1:0] state,next_state;
    
    always@(posedge clk )begin
        if(!resetn)begin
            state<=A;
        end
        else
            state<=next_state;
    end
    
    always@(*)begin
        case(state)
            A:begin
                if(r[1])begin
                    next_state=B;
                end
                else if(r[2])
                    next_state=C;
                else if(r[3])
                    next_state=D;
                else
                    next_state=A;
            end
            B:begin
                if(r[1])begin
                    next_state=B;
                end
                else
                    next_state=A;
            end
            C:begin
                if(r[2])begin
                    next_state=C;
                end
                else
                    next_state=A;
            end
            D:begin
                if(r[3])begin
                    next_state=D;
                end
                else
                    next_state=A;
            end
        endcase
    end
    assign g[1]=(state==B);
    assign g[2]=(state==C);
    assign g[3]=(state==D);

endmodule
