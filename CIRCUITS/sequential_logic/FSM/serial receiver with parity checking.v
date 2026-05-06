module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Modify FSM and datapath from Fsm_serialdata
    parameter[2:0] IDLE=3'd0,  DATA=3'd1, PARITY=3'd2, STOP=3'd3,WAIT=3'd4;
    reg[2:0] state,next_state;
    reg[3:0] count;
    reg[7:0] mem;
    wire odd;
    wire parity_reset;
    
    parity p1(.clk(clk),.reset(parity_reset),.in(in),.odd(odd));
    
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
                if(count==4'd8)begin
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
    
     always @(*)begin
         parity_reset=(!state==DATA);
    end


    // New: Datapath to latch input bits.
    always@(posedge clk)begin
        if(state==DATA && count<8)begin
            mem<={in,mem[7:1]};
        end
        else
            mem<=mem;
    end
    
    assign out_byte=mem;
        

    // New: Add parity checking.
     always@(posedge clk)begin
        if(reset)
            done<=0;
         else if(state==STOP && in==1 && odd)
            done<=1;  
        else
            done<=0;
    end


endmodule
