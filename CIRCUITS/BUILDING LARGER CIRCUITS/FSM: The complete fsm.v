//building large circuit problem 5
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    parameter s0=4'd0,
              s1=4'd1,
              s2=4'd2,
              s3=4'd3,
              sh0=4'd4,
              sh1=4'd5,
              sh2=4'd6,
              sh3=4'd7,
              cont=4'd8,
              success=4'd9;
    reg[3:0]state,next_state;
    always@(posedge clk)begin
        if(reset)begin
            state<=s0;
        end
        else
            state<=next_state;
    end
    always@(*)begin
        case(state)
            s0:next_state=data?s1:s0;
            s1:next_state=data?s2:s0;
            s2:next_state=data?s2:s3;
            s3:next_state=data?sh0:s0;
            
            sh0:next_state=sh1;
            sh1:next_state=sh2;
            sh2:next_state=sh3;
            sh3:next_state=cont;
            
            cont:next_state=done_counting?success:cont;
            
           success:next_state=ack?s0:success;
            
            default:next_state=s0;
        endcase
    end
    always@(*)begin
        shift_ena=0;
        counting=0;
        done=0;
        
        case(state)
            sh0,sh1,sh2,sh3:shift_ena=1;
            cont:counting=1;
            success:done=1;
        endcase
    end
    
     

endmodule

