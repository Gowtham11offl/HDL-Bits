module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    always @ (posedge clk or posedge areset) begin 
        
        if (areset) begin 
            q <= 4'd0; 
        end
        
        else
            case ({load,ena})
                
                2'b00 : begin 
                    q <= q; 
                end
                
                2'b01 : begin
                    q <= {1'b0, q[3:1]};
                end
                
                2'b10 : begin 
                    q <= data; 
                end
                
                2'b11 : begin
                    q <= data; 
                end
                
                default : begin 
                    q<= 4'd0; 
                end
                
            endcase
                    
        
    end
    
    

endmodule
