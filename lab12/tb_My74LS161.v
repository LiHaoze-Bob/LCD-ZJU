`timescale 1ns / 1ps

module tb_My74LS161;

    reg CP;
    reg CRn;
    reg LDn;
    reg [3:0] D;
    reg CTT;
    reg CTP;
    wire [3:0] Q;
    wire CO;
    My74LS161 uut (
        .CP(CP), 
        .CRn(CRn), 
        .LDn(LDn), 
        .D(D), 
        .CTT(CTT), 
        .CTP(CTP), 
        .Q(Q), 
        .CO(CO)
    );
    always #5 CP = ~CP;
    initial begin
        $dumpfile("tb_My74LS161.vcd");
        $dumpvars(0, tb_My74LS161);
        CP = 0;
        CRn = 0;
        LDn = 1;
        D = 4'b0000;
        CTT = 0;
        CTP = 0;
        #12;
        CRn = 1;
        @(posedge CP);
        #1;
        D = 4'b1010;
        LDn = 0;
        @(posedge CP);
        #1;
        LDn = 1;
        CTT = 1;
        CTP = 1;
        repeat (7) @(posedge CP);
        #1;
        CTT = 0;
        repeat (2) @(posedge CP);
        #1;
        CTT = 1;
        CTP = 0;
        repeat (2) @(posedge CP);
        #1;
        CTP = 1;
        repeat (3) @(posedge CP);
        #3;
        CRn = 0;
        #5;
        CRn = 1;
        repeat (3) @(posedge CP);
        $finish;
    end
endmodule