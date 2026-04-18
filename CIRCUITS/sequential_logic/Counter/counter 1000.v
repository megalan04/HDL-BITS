module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    
    wire[3:0]q1,q2,q3;
    assign c_enable[0]=1'b1;
    assign c_enable[1]=(q1==4'd9);
    assign c_enable[2]=(q1==4'd9)&&(q2==4'd9);
    
    assign OneHertz=(q1==4'd9)&&(q2==4'd9)&&(q3==4'd9);
    
    bcdcount c0(clk,reset|OneHertz,c_enable[0],q1);
    bcdcount c1(clk,reset|OneHertz,c_enable[1],q2);
    bcdcount c2(clk,reset|OneHertz,c_enable[2],q3);
    
    

endmodule
