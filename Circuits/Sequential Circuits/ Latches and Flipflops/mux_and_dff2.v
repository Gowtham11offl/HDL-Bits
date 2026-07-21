module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always @ (posedge clk) begin 
        
        if(E == 1'b0 && L == 1'b0)
            Q <= Q; 
        else if (E == 1'b0 && L == 1'b1)
            Q <= R;
        else if (E == 1'b1 && L == 1'b0)
            Q <= w; 
        else
            Q <= R; 
    end

endmodule
