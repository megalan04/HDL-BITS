module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter LEFT=0,RIGHT=1,FALL=2;

    reg[1:0] state,next_state;
    reg direction;
    always @(*) begin
        case(state)
            LEFT:begin
                if (!ground)
                    next_state=FALL;
                else if(bump_left)
                    next_state=RIGHT;
                else
                    next_state=LEFT;
            end
            RIGHT:begin
                if (!ground)
                    next_state=FALL;
                else if(bump_right)
                    next_state=LEFT;
                else
                    next_state=RIGHT;
            end

            FALL:begin
                if (!ground)
                    next_state=FALL;
                
                else 
                    next_state=(direction==0)?LEFT:RIGHT;
            end
            default:next_state=LEFT;
        endcase
    end
    always @(posedge clk or posedge areset) begin
        if(areset)begin
            state<=LEFT;
            direction<=0;
        end
        else begin
            state<=next_state;
         if (state==LEFT)
                direction<=0;
         else if(state==RIGHT)
                direction<=1;
        end
    end
    assign walk_left=(state==LEFT);
    assign walk_right=(state==RIGHT);
    assign aaah=(state==FALL);



endmodule
