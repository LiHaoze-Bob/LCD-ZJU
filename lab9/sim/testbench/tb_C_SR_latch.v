`timescale 1ns / 1ps

module tb_C_SR_latch;
    reg R;
    reg S;
    reg C;
    wire Q;
    wire Qbar;

    C_SR_latch uut (
        .R(R),
        .S(S),
        .C(C),
        .Q(Q),
        .Qbar(Qbar)
    );

initial begin
        $dumpfile("tb_C_SR_latch.vcd");
        $dumpvars(0, tb_C_SR_latch);
        R = 0; S = 0; C = 0; #10;
        R = 0; S = 1; C = 0; #10;
        R = 0; S = 1; C = 1; #10;
        R = 0; S = 0; C = 1; #10;
        R = 1; S = 0; C = 1; #10;
        R = 1; S = 0; C = 0; #10;
        R = 0; S = 1; C = 0; #10;
        R = 1; S = 1; C = 1; #10; 
        R = 1; S = 0; C = 1; #10; 
        R = 0; S = 0; C = 1; #10; 
        $finish;
    end
endmodule