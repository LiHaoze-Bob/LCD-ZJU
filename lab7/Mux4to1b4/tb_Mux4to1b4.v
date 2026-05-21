`timescale 1ns / 1ps

module tb_Mux4to1b4();

    reg [1:0] S;
    reg [3:0] D0;
    reg [3:0] D1;
    reg [3:0] D2;
    reg [3:0] D3;
    wire [3:0] Y;

    Mux4to1b4 uut (
        .S(S),
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .Y(Y)
    );

    initial begin
        $dumpfile("wave.vcd");  
        $dumpvars(0, tb_Mux4to1b4); 
        D0 = 4'hA;
        D1 = 4'hB;
        D2 = 4'hC;
        D3 = 4'hD;
        
        S = 2'b00;
        #10;
        S = 2'b01;
        #10;
        S = 2'b10;
        #10;
        S = 2'b11;
        #10;
        #10
        $finish;
    end

endmodule