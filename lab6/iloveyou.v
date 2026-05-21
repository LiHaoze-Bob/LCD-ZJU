module ILoveYou(
    input [2:0] D,
    output reg a, b, c, d, e, f, g
);

    always @(*) begin
        case(D)
            3'b000: {a,b,c,d,e,f,g} = 7'b1001111;
            3'b001: {a,b,c,d,e,f,g} = 7'b1110001;
            3'b010: {a,b,c,d,e,f,g} = 7'b1100010;
            3'b011: {a,b,c,d,e,f,g} = 7'b1100011;
            3'b100: {a,b,c,d,e,f,g} = 7'b0110000;
            3'b101: {a,b,c,d,e,f,g} = 7'b1000100;
            3'b110: {a,b,c,d,e,f,g} = 7'b0000001;
            3'b111: {a,b,c,d,e,f,g} = 7'b1000001;
            default: {a,b,c,d,e,f,g} = 7'b1111111;
        endcase
    end
endmodule