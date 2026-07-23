module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    wire [3:0] x0, x1, x2; 
    
    
    bcdcount counter0 (clk, reset, c_enable[0], x0);
    bcdcount counter1 (clk, reset, c_enable[1], x1);
    bcdcount counter2 (clk, reset, c_enable[2], x2);
    
    assign c_enable = {(x1 == 4'd9) & (x0 == 4'd9) ,x0 == 4'd9,1'b1};
    assign OneHertz = (x2 == 4'd9) & (x1 == 4'd9) & (x0 == 4'd9 ); 

endmodule
