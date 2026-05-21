`timescale 1ns / 1ps

module tb_MS_SR_flip_flop;
    reg D;
    reg clk;
    wire Q;
    wire Qbar;

    MS_SR_flip_flop uut (
        .D(D),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

    always #10 clk = ~clk;

    initial begin
        $dumpfile("tb_MS_SR_flip_flop.vcd");
        $dumpvars(0, tb_MS_SR_flip_flop);
        D = 0; clk = 0; #15;
        D = 1; #20;
        D = 0; #20;
        D = 1; #20;
        D = 0; #20;
        $finish;
    end
endmodule