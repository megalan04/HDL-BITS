//building large circuit problem 3
module top_module (
    input clk,
    input reset,      
    input data,
    output start_shifting);
    parameter s0=3'd0,
              s1=3'd1,
              s2=3'd2,
              s3=3'd3,
              s4=3'd4;
    reg[2:0] state,next_state;
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
            s3:next_state=data?s4:s0;
            s4:next_state=s4;
            default:next_state=s0;
        endcase
    end
    assign start_shifting=(state==s4);
    
        

endmodule
