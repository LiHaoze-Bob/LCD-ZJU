`timescale 1ns / 1ps

module tb_counter_223;

    reg clk;
    reg rstn;
    wire [7:0] Q;

    counter_223 uut (
        .clk(clk),
        .rstn(rstn),
        .Q(Q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_counter_223.vcd");
        $dumpvars(0, tb_counter_223);

        clk = 0;
        rstn = 0;
        
        #12;
        rstn = 1;
        
        #2300;
        
        #3;
        rstn = 0;
        #10;
        rstn = 1;
        
        #50;
        $finish;
    end

endmodule