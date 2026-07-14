module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire c1,c2,c3,c4;
    assign sum[4] = c4; 

    full_add fadd1(x[0], y[0], 0, c1,sum[0]);
    full_add fadd2(x[1], y[1], c1,c2,sum[1]);
    full_add fadd3(x[2], y[2], c2,c3,sum[2]);
    full_add fadd4(x[3], y[3], c3,c4,sum[3]);
    
endmodule


module full_add (input x, y, cin, output cout, sum); 
    
    assign sum = x ^ y ^ cin;
    assign cout = (x&y) | (y&cin) | (cin&x) ;
    
endmodule

