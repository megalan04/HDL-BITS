//build large circuit problem 2
module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    reg[3:0]q1;
    always@(posedge clk)begin
        if(shift_ena)begin
           q1<={q1[2:0],data}; 
        end
        else if(count_ena)begin
            q1<=q1-1;
        end
    end
    assign q=q1;

endmodule
