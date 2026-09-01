module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    reg [31:0] in_p;
    integer i;
    always @(posedge clk)begin
           in_p<=in;
        if(reset) begin
            out<=32'd0;
        end
        else begin
            for(i=0;i<32;i=i+1)begin
                case({in_p[i],in[i]})
                    2'b10:out[i]<=1'b1;
                    default:out[i]<=out[i];
                endcase
            end
            
        end
    end

endmodule
