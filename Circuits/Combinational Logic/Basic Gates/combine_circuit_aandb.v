module top_module (input x, input y, output z);
	
    wire z1,z2,z3,z4,z5,z6; 
    A IA1(x,y,z1);
    A IA2(x,y,z3);
    B IB1(x,y,z2);
    B IB2(x,y,z4);
    
    or(z5, z1, z2);
    and(z6, z3, z4);
    xor(z, z5, z6);
    
    
endmodule

module A(input x, input y, output z);
    assign z = (x^y)&x;
endmodule

module B(input x, input y, output z);
    xnor(z,x,y);
endmodule
