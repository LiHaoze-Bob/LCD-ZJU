`timescale 1ns / 1ps

module tb_RevCounter;

    reg clk;
    reg rst;
    reg s;
    wire [15:0] cnt;
    wire Rc;

    RevCounter uut (
        .clk(clk), 
        .rst(rst), 
        .s(s), 
        .cnt(cnt), 
        .Rc(Rc)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        $dumpfile("tb_RevCounter.vcd");
        $dumpvars(0, tb_RevCounter);
    end

    initial begin
        rst = 1;
        s = 0;
        #40;
        
        @(posedge clk);
        #1 rst = 0;
        #100;
        
        @(posedge clk);
        #1 uut.cnt = 16'hFFFE; 
        #60; 
        
        @(posedge clk);
        #1 s = 1;
        #100;
        
        @(posedge clk);
        #1 uut.cnt = 16'h0002;
        #60; 
        
        @(posedge clk);
        #1 rst = 1;
        #20;
        #1 rst = 0;
        
        #100;
        $finish;
    end
      
endmodule