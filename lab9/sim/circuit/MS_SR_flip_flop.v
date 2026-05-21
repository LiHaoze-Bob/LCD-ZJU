/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : MS_SR_flip_flop                                              **
 **                                                                          **
 *****************************************************************************/

module MS_SR_flip_flop( D,
                        Q,
                        Qbar,
                        clk );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input D;
   input clk;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output Q;
   output Qbar;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet2;
   wire s_logisimNet3;
   wire s_logisimNet4;
   wire s_logisimNet5;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet0 = clk;
   assign s_logisimNet5 = D;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign Q    = s_logisimNet4;
   assign Qbar = s_logisimNet1;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet3 = ~s_logisimNet0;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   C_D_latch   master_latch (.C(s_logisimNet3),
                             .D(s_logisimNet5),
                             .Q(s_logisimNet2),
                             .Qbar());

   C_D_latch   slave_latch (.C(s_logisimNet0),
                            .D(s_logisimNet2),
                            .Q(s_logisimNet4),
                            .Qbar(s_logisimNet1));



endmodule
