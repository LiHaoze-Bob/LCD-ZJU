`timescale 1ns/1ps
module ALU_tb;
    reg [3:0] A, B;
    reg [1:0] op;
    wire [3:0] res;
    wire Cout;

    ALU uut(A, B, op, res, Cout);

    initial begin
        $dumpfile("ALU.vcd");
        $dumpvars(0, ALU_tb);

        op = 2'b00; A = 4'd15; B = 4'd1; #10;

        op = 2'b01; A = 4'd10; B = 4'd4; #10;

        op = 2'b10; A = 4'b1100; B = 4'b1010; #10;

        op = 2'b11; A = 4'b1100; B = 4'b1010; #10;

        $finish;
    end
endmodule