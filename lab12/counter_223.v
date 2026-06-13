module counter_223(
    input clk,
    input rstn,
    output [7:0] Q
);

    wire [3:0] Q_low;
    wire [3:0] Q_high;
    wire CO_low;
    wire CO_high;
    wire chip_CRn;

    assign Q = {Q_high, Q_low};
    assign chip_CRn = rstn && ~(Q == 8'b1101_1111);

    My74LS161 low_inst (
        .CP(clk),
        .CRn(chip_CRn),
        .LDn(1'b1),
        .D(4'b0000),
        .CTT(1'b1),
        .CTP(1'b1),
        .Q(Q_low),
        .CO(CO_low)
    );

    My74LS161 high_inst (
        .CP(clk),
        .CRn(chip_CRn),
        .LDn(1'b1),
        .D(4'b0000),
        .CTT(CO_low),
        .CTP(CO_low),
        .Q(Q_high),
        .CO(CO_high)
    );

endmodule