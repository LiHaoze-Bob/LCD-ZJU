`timescale 1ns / 1ps

module D_74LS138_tb();

// Inputs
   reg G;
   reg G2A;
   reg G2B;
   reg C;
   reg A;
   reg B;

// Output
   wire [7:0] Y;

   // 【注意】请确保 circuit/ 文件夹下的模块名确实是 D_74LS138
   // 如果报错找不到模块，请检查是否需要改为 Logisim_D_74LS138
   D_74LS138 m0 (
    .Y(Y),
    .G(G),
    .G2A(G2A),
    .G2B(G2B),
    .A(A),
    .B(B), 
    .C(C)
   );

// Initialize Inputs
  initial begin
    // ===== 1. 为了使用 Surfer，必须添加以下两行 =====
    $dumpfile("wave.vcd");        // 指定生成的波形文件名
    $dumpvars(0, D_74LS138_tb);   // 记录 D_74LS138_tb 模块下的所有信号
    // ===========================================

    C = 0; B = 0; A = 0;
    G = 1; G2A = 0; G2B = 0; #50;
    {C, B, A} = 3'b000;
    
    // 遍历 0-7 的组合
    repeat(8) begin
      #50; {C, B, A} = {C, B, A} + 3'b1; 
    end

    // 测试使能信号无效的情况
    G=1'b0; G2A=1'b0; G2B=1'b0; #50;
    G=1'b1; G2A=1'b1; G2B=1'b0; #50;
    G=1'b1; G2A=1'b0; G2B=1'b1; #50;

    // ===== 2. 仿真结束指令 =====
    $display("Simulation Finished");
    $finish; 
  end

endmodule // D_74LS138_tb