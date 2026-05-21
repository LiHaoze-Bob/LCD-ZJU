module DisplayNumber(
    input        clk,
    input        rst,
    input [15:0] hexs,
    input [ 3:0] points,
    input [ 3:0] LEs,
    output[ 3:0] AN,
    output[ 7:0] SEGMENT
);

    wire [31:0] div_res;
    wire [ 3:0] current_hex;
    wire        current_point;
    wire        current_LE;

    clkdiv m0 (
        .clk(clk),
        .rst(rst),
        .div_res(div_res)
    );
    DisplaySync m1 (
        .scan(div_res[18:17]),
        .hexs(hexs),
        .points(points),
        .LEs(LEs),
        .HEX(current_hex),
        .AN(AN),
        .point(current_point),
        .LE(current_LE)
    );

    MyMC14495 m2 (
        .D3(current_hex[3]),
        .D2(current_hex[2]),
        .D1(current_hex[1]),
        .D0(current_hex[0]),
        .LE(current_LE),
        .point(current_point),
        .segments(SEGMENT)
    );

endmodule