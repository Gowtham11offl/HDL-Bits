module top_module (
    input clk,
    input x,
    output z
);

    reg x1, x2, x3;

    always @(posedge clk) begin
        x1 <= x ^ x1;
        x2 <= x & ~x2;
        x3 <= x | ~x3;
    end

    assign z = ~(x1 | x2 | x3);

endmodule
