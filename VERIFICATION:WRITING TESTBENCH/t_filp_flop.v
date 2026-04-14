module top_module ();
    reg clk;
    reg reset;
    reg t;
    wire q;
    tff dut(.*);
    initial begin
     clk=1;
     forever #5 clk=~clk;
    end
    initial begin
        clk=0;reset=0;t=1;
        #5 reset=1; 
        #5 t=0;
        #5 t=1;
        #5 reset=0;t=0; 
        #5 t=1;
    end

endmodule
