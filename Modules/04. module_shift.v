module top_module ( input clk, input d, output q );
	
    wire q1,q2;
    
    my_dff uut(.clk(clk), .d(d),.q(q1)); 
    my_dff iit(.clk(clk), .d(q1),.q(q2));
    my_dff vit(.clk(clk), .d(q2),.q(q));
    
endmodule

