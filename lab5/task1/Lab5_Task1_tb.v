`timescale 1ns / 1ps

module Lab5_Task1_tb();

    // 输入信号定义
    reg A, B, C;
    reg G_in, G2A_in, G2B_in;
    
    // 输出信号定义
    wire F_out;

    // 实例化模块 - 严格匹配你查到的 Lab5_task1 端口名
    Lab5_task1 uut (
        .A(A),
        .B(B),
        .C(C),
        .FF(F_out),   // 你查到的输出端口叫 FF
        .G(G_in),     // 对应输入 G
        .G2A(G2A_in), // 对应输入 G2A
        .G2B(G2B_in)  // 对应输入 G2B
    );

    initial begin
        // 创建波形文件
        $dumpfile("task1.vcd");
        $dumpvars(0, Lab5_Task1_tb);

        // --- 初始化使能信号（让译码器工作） ---
        G_in = 1; 
        G2A_in = 0; 
        G2B_in = 0;

        // --- 遍历 8 种组合 ---
        A = 0; B = 0; C = 0; #50;
        A = 1; B = 0; C = 0; #50;
        A = 0; B = 1; C = 0; #50;
        A = 1; B = 1; C = 0; #50;
        A = 0; B = 0; C = 1; #50;
        A = 1; B = 0; C = 1; #50;
        A = 0; B = 1; C = 1; #50;
        A = 1; B = 1; C = 1; #50;

        $display("Task 1 Simulation Finished!");
        $finish;
    end

endmodule