module MyMC14495(
    input D0, D1, D2, D3,
    input LE,
    input point,
    output reg p,
    output reg a, b, c, d, e, f, g
);

    always @(*) begin
        if (LE == 1'b0) begin
            case({D3, D2, D1, D0})
                4'h0: {a,b,c,d,e,f,g} = 7'b0000001; 
                4'h1: {a,b,c,d,e,f,g} = 7'b1001111; 
                4'h2: {a,b,c,d,e,f,g} = 7'b0010010; 
                4'h3: {a,b,c,d,e,f,g} = 7'b0000110; 
                4'h4: {a,b,c,d,e,f,g} = 7'b1001100; 
                4'h5: {a,b,c,d,e,f,g} = 7'b0100100; 
                4'h6: {a,b,c,d,e,f,g} = 7'b0100000; 
                4'h7: {a,b,c,d,e,f,g} = 7'b0001111; 
                4'h8: {a,b,c,d,e,f,g} = 7'b0000000; 
                4'h9: {a,b,c,d,e,f,g} = 7'b0000100; 
                4'hA: {a,b,c,d,e,f,g} = 7'b0001000; 
                4'hB: {a,b,c,d,e,f,g} = 7'b1100000; 
                4'hC: {a,b,c,d,e,f,g} = 7'b0110001; 
                4'hD: {a,b,c,d,e,f,g} = 7'b1000010; 
                4'hE: {a,b,c,d,e,f,g} = 7'b0110000; 
                4'hF: {a,b,c,d,e,f,g} = 7'b0111000; 
                default: {a,b,c,d,e,f,g} = 7'b1111111;
            endcase
        end else begin
            {a,b,c,d,e,f,g} = 7'b1111111;
        end
        

        if (point == 1'b1) begin
            p = 1'b0;
        end else begin
            p = 1'b1;
        end
    end

endmodule