module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter [3:0] STATE1=4'd2,STATE2=4'd3,STATE3=4'd4,STATE4=4'd5,STATE5=4'd6,STATE6=4'd0,STATE7=4'd1,MEK=4'd7,LEO=4'd8;
    reg[3:0]state,next_state;
    
    always@(posedge clk)begin
        if(!resetn)
            state<=STATE6;
        else
            state<=next_state;
    end
    
    always@(*)begin
        case(state)
            STATE6:begin
                next_state=STATE7;
            end
            STATE7:begin
                next_state=STATE1;
            end
            STATE1:begin
                if(x)
                    next_state=STATE2;
                else
                    next_state=STATE1;
            end
            STATE2:begin
                if(!x)
                    next_state=STATE3;
                else
                    next_state=STATE2;
            end
            STATE3:begin
                if(x)
                    next_state=STATE4;
                else
                    next_state=STATE1;
            end
            STATE4:begin
                if(y)
                    next_state=MEK;
                else
                    next_state=STATE5;
            end
            STATE5:begin
                if(y)
                    next_state=MEK;
                else
                    next_state=LEO;
            end
            MEK:
                next_state=MEK;
            LEO:
                next_state=LEO;
                default:next_state=STATE6;
        endcase
    end
    assign f=(state==STATE7);
        assign g=(state==STATE4||state==STATE5||state==MEK);
        
                

endmodule
