/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : Lab5_task1                                                   **
 **                                                                          **
 *****************************************************************************/

module Lab5_task1( A,
                   B,
                   C,
                   FF,
                   G,
                   G2A,
                   G2B );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A;
   input B;
   input C;
   input G;
   input G2A;
   input G2B;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output FF;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [7:0] s_logisimBus6;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet2;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet0 = G;
   assign s_logisimNet2 = C;
   assign s_logisimNet5 = G2B;
   assign s_logisimNet7 = A;
   assign s_logisimNet8 = B;
   assign s_logisimNet9 = G2A;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign FF = s_logisimNet11;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_1 (.input1(s_logisimBus6[1]),
               .input2(s_logisimBus6[2]),
               .input3(s_logisimBus6[4]),
               .input4(s_logisimBus6[7]),
               .result(s_logisimNet11));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   D_74LS138   D (.A(s_logisimNet7),
                  .B(s_logisimNet8),
                  .C(s_logisimNet2),
                  .G(s_logisimNet0),
                  .G2A(s_logisimNet9),
                  .G2B(s_logisimNet5),
                  .Y(s_logisimBus6[7:0]));

endmodule
