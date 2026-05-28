module RevCounter( 
    input wire clk,
    input wire rst,
    input wire s,
    output reg [15:0] cnt = 16'h0000,
    output wire Rc
);

    always @(posedge clk) begin
        if (rst) begin
            cnt <= 16'h0000;
        end else begin
            if (s == 1'b0) begin
                cnt <= cnt + 1'b1;
            end else begin
                cnt <= cnt - 1'b1;
            end
        end
    end

    assign Rc = (s == 1'b0) ? (cnt == 16'hFFFF) : (cnt == 16'h0000);

endmodule