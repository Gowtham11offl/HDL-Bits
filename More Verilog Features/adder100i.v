module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    wire [100:0] co; 

    assign co[0] = cin; 

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : f_addr
            fulladder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(co[i]),
                .cout(co[i+1]),
                .sum(sum[i])
            );
        end
    endgenerate

    assign cout = co[100:1]; 

endmodule

module fulladder(
    input a, b, cin,
    output cout, sum
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
