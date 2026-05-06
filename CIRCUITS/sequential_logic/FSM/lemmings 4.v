module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging
);
    parameter LEFT=0,RIGHT=1,FALL=2,DIG=3,SPLAT=4;
    reg [2:0]state,next_state; 
    reg direction;                
    reg [7:0]count;              
    always@(*)begin
        case(state)
            LEFT:begin
                if(!ground)
                    next_state=FALL;
                else if(dig)
                    next_state=DIG;
                else if(bump_left)
                    next_state=RIGHT;
                else
                    next_state=LEFT;
            end
            RIGHT:begin
                if(!ground)
                    next_state=FALL;
                else if(dig)
                    next_state=DIG;
                else if(bump_right)
                    next_state=LEFT;
                else
                    next_state=RIGHT;
            end
            DIG:begin
                if(!ground)
                    next_state=FALL;
                else
                    next_state=DIG;
            end
          FALL: begin
                  if (!ground)
                     next_state=FALL;
                  else begin
                      if (count>19)
                         next_state=SPLAT;
                     else
                         next_state=(direction==0)?LEFT:RIGHT;
                  end
          end
            SPLAT:begin
                next_state=SPLAT;  
            end
            default:next_state=LEFT;
        endcase
    end
    always@(posedge clk or posedge areset)begin
        if(areset)
            state<=LEFT;
        else
            state<=next_state;
    end
    always@(posedge clk or posedge areset)begin
        if(areset)
            direction<=0; 
        else begin
            if(next_state==LEFT)
                direction<=0;
            else if(next_state==RIGHT)
                direction<=1;
        end
    end
    always@(posedge clk or posedge areset)begin
        if(areset)
            count<=0;
        else begin
            if (state==FALL&&!ground)
               count<=count+1'b1; 
            else
                count<=0;
        end
    end
    assign walk_left=(state==LEFT);
    assign walk_right=(state==RIGHT);
    assign aaah=(state==FALL);
    assign digging=(state==DIG);

endmodule
