`timescale 1ns / 1ps

module tb_SR_latch;
    reg R;
    reg S;
    wire Q;
    wire Qbar;

    SR_latch uut (
        .R(R),
        .S(S),
        .Q(Q),
        .Qbar(Qbar)
    );

initial begin
        $dumpfile("tb_SR_latch.vcd");
        $dumpvars(0, tb_SR_latch);
        R = 0; S = 0; #10;
        R = 0; S = 1; #10;
        R = 0; S = 0; #10;
        R = 1; S = 0; #10;
        R = 0; S = 0; #10;
        R = 1; S = 1; #10; 
        R = 1; S = 0; #10;
        R = 0; S = 0; #10; 
        $finish;
    end
endmodule