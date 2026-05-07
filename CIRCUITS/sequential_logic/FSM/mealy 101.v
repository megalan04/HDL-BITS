module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter [4:0] NONE=4'd0,ONE=4'd1,TWO=4'd2,THREE=4'd3,FOUR=4'd4,FIVE=4'd5,SIX=4'd6,ERROR=4'd7,DISCARD=4'd8,FLAG=4'd9;
    reg[4:0]state,next_state;
    
    
    
    always@(posedge clk)begin
        if(reset)begin
            state<=NONE;
        end
        else
            state<=next_state;
    end
    
    always@(*)begin
        case(state)
            NONE:begin
                if(in)
                    next_state=ONE;
                else
                    next_state=NONE;
            end
            ONE:begin
                if(in)
                    next_state=TWO;
                else
                    next_state=NONE;
            end
            TWO:begin
                if(in)
                    next_state=THREE;
                else
                    next_state=NONE;
            end
            THREE:begin
                if(in)
                    next_state=FOUR;
                else
                    next_state=NONE;
            end
            FOUR:begin
                if(in)
                    next_state=FIVE;
                else
                    next_state=NONE;
            end
            FIVE:begin
                if(in)
                    next_state=SIX;
                else
                    next_state=DISCARD;
            end
            SIX:begin
                if(in)
                    next_state=ERROR;
                else
                    next_state=FLAG;
            end
            ERROR:begin
                if(in)
                    next_state=ERROR;
                else
                    next_state=NONE;
            end
            DISCARD:begin
                if(in)
                    next_state=ONE;
                else
                    next_state=NONE;
            end
            FLAG:begin
                if(in)
                    next_state=ONE;
                else
                    next_state=NONE;
            end
        endcase
    end
    assign disc=(state==DISCARD);
    assign flag=(state==FLAG);
    assign err=(state==ERROR);
    
            
    
    

endmodule
