module DisplaySync(
    input [ 1:0] scan,
    input [15:0] hexs,
    input [ 3:0] points,
    input [ 3:0] LEs,
    output reg [ 3:0] HEX,
    output reg [ 3:0] AN,
    output reg       point,
    output reg       LE
);

    always @(*) begin
        case (scan)
            2'b00: begin
                HEX = hexs[3:0];
                AN = 4'b1110;
                point = points[0];
                LE = LEs[0];
            end
            2'b01: begin
                HEX = hexs[7:4];
                AN = 4'b1101;
                point = points[1];
                LE = LEs[1];
            end
            2'b10: begin
                HEX = hexs[11:8];
                AN = 4'b1011;
                point = points[2];
                LE = LEs[2];
            end
            2'b11: begin
                HEX = hexs[15:12];
                AN = 4'b0111;
                point = points[3];
                LE = LEs[3];
            end
            default: begin
                HEX = 4'b0000;
                AN = 4'b1111;
                point = 1'b1;
                LE = 1'b0;
            end
        endcase
    end

endmodule 