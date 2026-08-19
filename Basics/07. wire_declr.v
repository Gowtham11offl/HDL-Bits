`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	
    wire p,q;
    and(p,a,b);
    and(q,c,d);
    or(out,p,q);
   assign out_n=~out;
endmodule

