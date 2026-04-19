module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter S0=2'b01,   
              S1=2'b10;

    reg[1:0]state,next_state;
    always@(posedge clk or posedge areset)begin
        if(areset)
            state<=S0;
        else
            state<=next_state;
    end
    always @(*) begin
        case(state)
            S0:next_state=x?S1:S0;
            S1:next_state=S1;
            default:next_state=S0;
        endcase
    end
    assign z=(state==S0)?x:~x;

endmodule
