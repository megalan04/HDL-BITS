module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
     parameter A=0,
              B0=1,B1=2,
              C0=3,C1=4,C2=5,
              D0=6,D1=7,D2=8,D3=9,
              E0=10,E1=11;
    reg [3:0]state,next_state;
  
    always@(posedge clk)begin
        if(reset)
            state<=A;
        else
            state<=next_state;
    end
    always@(*)begin
        case(state)
            A:next_state=s?B0:A;
            B0:next_state=w?C1:C0;
            C0:next_state=w?D1:D0;
            C1:next_state=w?D2:D1;
            D0:next_state=E0;
            D1:next_state=w?E1:E0;
            D2:next_state=w?E0:E1;
            E0:next_state=w?C1:C0;
            E1:next_state=w?C1:C0;
            default:next_state=A;
        endcase
    end
   /* always @(posedge clk)begin
        if(state==E1)
            z<=1'b1;
        else
            z<=1'b0;
    end*/
    assign z=(state==E1);
endmodule
