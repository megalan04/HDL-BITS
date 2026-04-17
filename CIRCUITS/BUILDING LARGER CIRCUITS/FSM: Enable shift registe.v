module top_module (
    input clk,
    input reset,      // S
    output shift_ena);
    reg[2:0]cont;
    always@(posedge clk)begin
        if(reset)begin
            cont<=2'd0;
        end
        else begin
            if(cont==4)begin
                cont<=cont;
            end
            else
              cont<=cont+1;
        end
    end
    assign shift_ena=(cont<=3);
    

endmodule
