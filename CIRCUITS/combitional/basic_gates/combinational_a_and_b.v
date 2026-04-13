module top_module (input x, input y, output z);
    wire a1;
    wire a2;
    wire b1;
    wire b2;
    wire or1;
    wire and1;
    assign a1=(x^y)&x;
    assign b1=~(x^y);
    
    assign a2=(x^y)&x;
    assign b2=~(x^y);
    
    assign or1=a1|b1;
    assign and1=a2&b2;
    
    assign z=or1^and1;
    
    
    



endmodule
