module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    
    reg [7:0] D; 
    
    always @ (posedge clk) begin 
        
        if(enable)
            D <= {D[6:0], S}; 
		else
            D <= D;  
            
    end
    
    always @(*) begin 
        
        case ({A,B,C})
            3'b000 : Z = D[0];
            3'b001 : Z = D[1];
            3'b010 : Z = D[2];
            3'b011 : Z = D[3];
            3'b100 : Z = D[4];
            3'b101 : Z = D[5];
            3'b110 : Z = D[6];
            3'b111 : Z = D[7];
            
         default : begin 
             Z <= 1'b0; 
         end
        endcase
        
    end

endmodule
