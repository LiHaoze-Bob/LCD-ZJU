module ALU(
    input [3:0] A,
    input [3:0] B,
    input [1:0] op,
    output [3:0] res,
    output       Cout
);

    reg [4:0] temp;

    always @(*) begin
        case(op)
            2'b00: begin 
                temp = A + B;
            end
            2'b01: begin 
                temp = A - B;
            end
            2'b10: begin 
                temp = {1'b0, A & B}; 
            end
            2'b11: begin 
                temp = {1'b0, A | B}; 
            end
            default: begin
                temp = 5'b00000;
            end
        endcase
    end

    assign res  = temp[3:0];
    assign Cout = temp[4];

endmodule