module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    
    circuit a1 (KEY[0], KEY[1], SW[0] , LEDR[2], LEDR[0]); 
    circuit a2 (KEY[0], KEY[1], SW[1] , LEDR[0], LEDR[1]); 
    circuit a3 (KEY[0], KEY[1], SW[2] , LEDR[1]^LEDR[2], LEDR[2]); 

endmodule


module circuit(

    input clk, 
    input l,
    input r_in, 
    input q_in, 
    output reg q
); 
    
    wire x; 
    assign x = l ? r_in : q_in;
    
    
    always @ (posedge clk) begin 
        
        q <= x;
        
    end
    
endmodule 
