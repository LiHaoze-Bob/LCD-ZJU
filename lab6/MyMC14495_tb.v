`timescale 1ns / 1ps

module MyMC14495_tb();
    reg D0, D1, D2, D3;
    reg LE, point;
    wire p, a, b, c, d, e, f, g;
    
    MyMC14495 uut (
        .D0(D0), .D1(D1), .D2(D2), .D3(D3),
        .LE(LE), .point(point),
        .p(p), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g)
    );
    
    integer i;

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0, MyMC14495_tb);
        

        LE = 1; point = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
        #20;
        
        LE = 0; point = 1;
        #20;
        
        for (i = 0; i < 16; i = i + 1) begin
            {D3, D2, D1, D0} = i;
            #20;
        end
        
        $finish;
    end
endmodule