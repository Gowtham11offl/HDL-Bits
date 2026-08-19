module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire and1, and2, or1;
    wire and3, and4, or2;
    
    and(and1, p1c, p1b, p1a);
    and(and2, p1f, p1e, p1d);
    or(p1y, and1, and2);
    
    and(and3, p2a, p2b);
    and(and4, p2c, p2d);
    or (p2y, and3, and4);
    

endmodule

