`timescale 1ns / 1ps

module tb_C_D_latch;
    reg D;
    reg clk;
    wire Q;
    wire Qbar;

    C_D_latch uut (
        .D(D),
        .C(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        $dumpfile("tb_C_D_latch.vcd");
        $dumpvars(0, tb_C_D_latch);
        D = 0; clk = 0; #10;
        D = 1; clk = 0; #10;
        D = 1; clk = 1; #10;
        D = 0; clk = 1; #10;
        D = 0; clk = 0; #10;
        D = 1; clk = 0; #10;
        D = 1; clk = 1; #10;
        $finish;
    end
endmodule