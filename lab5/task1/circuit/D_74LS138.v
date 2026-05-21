/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : D_74LS138                                                    **
 **                                                                          **
 *****************************************************************************/

module D_74LS138( A,
                  B,
                  C,
                  G,
                  G2A,
                  G2B,
                  Y );

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
   output [7:0] Y;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [7:0] s_logisimBus22;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet23;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet11 = G;
   assign s_logisimNet3  = C;
   assign s_logisimNet5  = A;
   assign s_logisimNet6  = B;
   assign s_logisimNet7  = G2A;
   assign s_logisimNet8  = G2B;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign Y = s_logisimBus22[7:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet17 = ~s_logisimNet5;

   // NOT Gate
   assign s_logisimNet20 = ~s_logisimNet6;

   // NOT Gate
   assign s_logisimNet19 = ~s_logisimNet11;

   // NOT Gate
   assign s_logisimNet2 = ~s_logisimNet3;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet17),
               .input2(s_logisimNet20),
               .result(s_logisimNet1));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet5),
               .input2(s_logisimNet20),
               .result(s_logisimNet13));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet17),
               .input2(s_logisimNet6),
               .result(s_logisimNet0));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet5),
               .input2(s_logisimNet6),
               .result(s_logisimNet12));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_5 (.input1(s_logisimNet1),
               .input2(s_logisimNet2),
               .input3(s_logisimNet4),
               .result(s_logisimBus22[0]));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_6 (.input1(s_logisimNet13),
               .input2(s_logisimNet2),
               .input3(s_logisimNet4),
               .result(s_logisimBus22[1]));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_7 (.input1(s_logisimNet0),
               .input2(s_logisimNet2),
               .input3(s_logisimNet4),
               .result(s_logisimBus22[2]));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_8 (.input1(s_logisimNet1),
               .input2(s_logisimNet3),
               .input3(s_logisimNet4),
               .result(s_logisimBus22[4]));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_9 (.input1(s_logisimNet13),
               .input2(s_logisimNet3),
               .input3(s_logisimNet4),
               .result(s_logisimBus22[5]));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_10 (.input1(s_logisimNet0),
                .input2(s_logisimNet3),
                .input3(s_logisimNet4),
                .result(s_logisimBus22[6]));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_11 (.input1(s_logisimNet12),
                .input2(s_logisimNet3),
                .input3(s_logisimNet4),
                .result(s_logisimBus22[7]));

   NOR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_12 (.input1(s_logisimNet19),
                .input2(s_logisimNet7),
                .input3(s_logisimNet8),
                .result(s_logisimNet4));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_13 (.input1(s_logisimNet12),
                .input2(s_logisimNet2),
                .input3(s_logisimNet4),
                .result(s_logisimBus22[3]));


endmodule
