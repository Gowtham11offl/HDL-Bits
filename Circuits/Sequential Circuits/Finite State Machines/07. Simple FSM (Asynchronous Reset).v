module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    
    reg [1:0] state, next_state; 
    
    localparam A=2'b00;
    localparam B=2'b01;
    localparam C=2'b10;
    localparam D=2'b11;

    always @ (*) begin 
        case(state)
            
            A : 
                if(in)
                    next_state <= B;
            else
                next_state <= A; 
            
            B : 
                if(in)
                    next_state <= B;
            else
                next_state <= C;
            
            C : 
                if(in)
                    next_state <= D;
            else
                next_state <= A;
            D : 
                 if(in)
                    next_state <= B;
            else
                next_state <= C;
            
        endcase
        
    end
    
    always @ (posedge clk or posedge areset) begin
        
        if(areset)
            state <= A; 
        else
            state <= next_state; 
               
    end
    
    assign out = (state == D) ? 1'b1 : 1'b0;

endmodule
