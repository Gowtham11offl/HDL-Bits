module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        case (state)
            
            A: 
                if(in)
                    next_state = A;
            	else
                    next_state = B; 
            
            B : 
                if(in)
                    next_state = B;
            	else
                    next_state = A;
            
            default : begin 
                next_state = B;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if(areset)
            state <= B; 
        else
            state <= next_state;  
    end

    // Output logic
    assign out = (state == A)? 1'b0 : 1'b1;

endmodule
