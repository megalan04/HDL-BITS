module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    
    always @(*) begin
        case ({j,k})
            2'b00:next_state=state;
            2'b01:next_state=OFF;
            2'b10:next_state=ON;
            2'b11:next_state=~state;
            default:next_state=OFF;
        endcase
    end
    always@(posedge clk or posedge areset)begin
        if(areset)
            state<=OFF;
        else
            state<=next_state;
    end
    assign out=(state==ON);

endmodule
