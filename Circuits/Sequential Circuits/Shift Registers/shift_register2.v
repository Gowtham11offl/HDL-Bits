module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    MUXDFF m1(KEY[0],KEY[1],KEY[2],KEY[3],SW[3],LEDR[3]);
    MUXDFF m2(KEY[0],KEY[1],KEY[2],LEDR[3],SW[2],LEDR[2]);
    MUXDFF m3(KEY[0],KEY[1],KEY[2],LEDR[2],SW[1],LEDR[1]);
    MUXDFF m4(KEY[0],KEY[1],KEY[2],LEDR[1],SW[0],LEDR[0]);

endmodule

module MUXDFF (

input clk,
input E,L,W,R,
output Q

);
    wire X1, X2; 
    assign X1 = E ? W : Q; 
    assign X2 = L ? R : X1;
    
    always @(posedge clk) begin 
        
        	Q <= X2;
        
    end
   

endmodule
