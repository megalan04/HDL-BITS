module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter s0=1'b0,
              s1=1'b1;
    reg next_state,state;
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            state<=s0;
        end
        else
            state<=next_state;
    end
        always@(*)begin
            case(state)
                s0:begin
                    if(x==1)begin
                        next_state=s1;
                    end
                    else
                        next_state=s0;
                end
                s1:begin
                    next_state=s1;
                end
                default:next_state=s0;
            endcase
        end
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            z<=0;
        end
        else begin
            case(state)
                s0:z=x;
                s1:z=~x;
            endcase
        end
    end
    
              

endmodule
