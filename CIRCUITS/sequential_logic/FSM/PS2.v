module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    parameter [1:0] SEARCH=2'd0,BYTE1=2'd1,BYTE2=2'd2,BYTE3=2'd3;
    reg [1:0]state,next_state;
    // State transition logic (combinational)
    always@(*)begin
        case(state)
            SEARCH:begin
                if(in[3])begin
                    next_state=BYTE1;
                end
                else
                    next_state=SEARCH;
            end
            BYTE1:begin
                next_state=BYTE2;
            end
            BYTE2:begin
                next_state=BYTE3;
            end
            BYTE3:begin
                if(in[3])
                    next_state=BYTE1;
                else
                    next_state=SEARCH;
            end
            default: next_state=SEARCH;
        endcase
    end
    

    // State flip-flops (sequential)
    always@(posedge clk or posedge reset)begin
        if(reset)begin
            state<=1'b0;
        end
        else
            state<=next_state;
    end
 
    // Output logic
    assign done=(state==BYTE3);

endmodule
