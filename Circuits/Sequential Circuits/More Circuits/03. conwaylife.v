module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q );
    
    reg [15:0] d[15:0];
    reg [255:0] toroid;
    integer i,j,k,l,m,n;
    integer count;
    
    always @(*) begin
        for (i=0;i<16;i=i+1)begin
          d[i]=q[16*i+:16];
        end
        for (i=0;i<16;i=i+1)begin
          for (j=0;j<16;j=j+1) begin
              k=(i==15)?0:i+1;
              l=(i==0)?15:i-1;
              m=(j==15)?0:j+1;
              n=(j==0)?15:j-1;
              count=d[k][m]+d[k][j]+d[k][n]+d[i][m]+d[i][n]+d[l][m]+d[l][j]+d[l][n];
              case(count)
                2:toroid[16*i+j]=d[i][j];
                3:toroid[16*i+j]=1;
                default:toroid[16*i+j]=0;
            endcase
          end
        end
     end

    always @(posedge clk)begin
       if (load) 
           q<=data;
       else 
           q<=toroid;
    end 

endmodule
