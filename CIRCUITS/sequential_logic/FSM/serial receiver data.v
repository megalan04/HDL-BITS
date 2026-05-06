module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
    parameter[1:0] IDLE=2'd0, WAIT=2'd1, DATA=2'd2, STOP=2'd3;
    reg[1:0] state,next_state;
    reg[3:0] count;
    reg[7:0] mem;
    
    always@(posedge clk)begin
        if(reset)
            state<=IDLE;
        else
            state<=next_state;
    end
     always@(posedge clk)begin
        if(reset)
            count<=4'd0;
         else begin
          if(state==DATA)begin
            //if(count==3'd7)
            // count<=3'd0;
            //else
             count<=count+1;
         end
         else if(state==IDLE)
             count<=4'd0;
         else
             count<=count;
         end
     end
    
    always@(*)begin
        case(state)
            IDLE:begin
                if(!in)
                    next_state=DATA;
                else
                    next_state=IDLE;
            end
           // START:begin
             //   next_state=DATA;
            //end
            DATA:begin
                if(count==4'd7)begin
                    next_state=STOP;
                end
                else
                    next_state=DATA;
            end
            STOP:begin
                if(in)begin
                    next_state=IDLE;
                end
                else
                    next_state=WAIT;
            end
            WAIT:next_state=in?IDLE:WAIT;
            default:next_state=IDLE;
        endcase
    end
  always@(posedge clk)begin
        if(reset)
            done<=0;
      else if(state==STOP && in==1)
            done<=1;  
        else
            done<=0;
    end

    // assign done=(state==STOP && in==1 && count==7);

    // New: Datapath to latch input bits.
    always@(posedge clk)begin
        if(state==DATA)begin
            mem<={in,mem[7:1]};
        end
        else
            mem<=mem;
    end
    
    assign out_byte=mem;
        

endmodule
