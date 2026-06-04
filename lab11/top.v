module Top(
    input clk,
    input [3:0] BTN_Y, 
    input [15:0] SW,
    output BTN_X,
    output[3:0]AN,
    output[7:0] SEGMENT
);

    wire [31:0] my_clkdiv;
    wire [2:0] btn_out;
    reg [11:0] num; // 低4位为A，中4位为B，高4位为C
    wire [3:0] A1, A2, B1, B2, C1, C2; // C1 未使用
    wire [3:0] mux_out;
    wire Co;
    wire [3:0] ALU_res;

    /* SW[1:0] 控制 A 或 B 的加/减自增操作 */
    wire A_Ctrl = SW[0];
    wire B_Ctrl = SW[1];
    /* SW[3:2] 选择 ALU 的运算类型 */
    wire [1:0] ALU_Ctrl = SW[3:2];
    /* SW[5:4] 总线传输选择信号：00-A, 01-B, 10-C, 11-常数0 */
    wire [1:0] Trans_select = SW[5:4];

    // 从 12 位 reg 中提取出对应的 4 位寄存器值
    wire [3:0] reg_A_val = num[ 3: 0];
    wire [3:0] reg_B_val = num[ 7: 4];
    wire [3:0] reg_C_val = num[11: 8];

    assign BTN_X = 1'b0;

    // 分频模块
    clkdiv m0(.clk(clk), .rst(1'b0), .div_res(my_clkdiv));

    // 按键消抖模块
    pbdebounce m1(.clk(my_clkdiv[17]), .button(BTN_Y[0]), .pbreg(btn_out[0]));
    pbdebounce m2(.clk(my_clkdiv[17]), .button(BTN_Y[1]), .pbreg(btn_out[1]));
    pbdebounce m3(.clk(my_clkdiv[17]), .button(BTN_Y[2]), .pbreg(btn_out[2]));

    // 自增自减模块（A1 = A +/- 1, B1 = B +/- 1）
    AddSub4b m4(.A(reg_A_val), .B(4'b0001), .Ctrl(A_Ctrl), .S(A1));
    AddSub4b m5(.A(reg_B_val), .B(4'b0001), .Ctrl(B_Ctrl), .S(B1));

    // 数据传输总线多路选择器
    Mux4to1b4 m6(.D0(reg_A_val), .D1(reg_B_val), .D2(reg_C_val), .D3(4'b0000),
                .S(Trans_select), .Y(mux_out));

    // ALU 模块（运算结果为 ALU_res）
    ALU m7(.A(reg_A_val), .B(reg_B_val), .res(ALU_res), .Cout(Co), .op(ALU_Ctrl));

    // 七段数码管显示模块
    DisplayNumber m8(.clk(clk), .hexs({reg_A_val, reg_B_val, ALU_res, reg_C_val}), 
                     .LEs(4'b0000), .points(4'b0000), .rst(1'b0), .AN(AN),
                     .SEGMENT(SEGMENT));

    /* ======= 补全的代码部分 ======= */
    assign A2 = (1'b0 == SW[15]) ? A1 : mux_out; 
    assign B2 = (1'b0 == SW[15]) ? B1 : mux_out;
    assign C2 = (1'b0 == SW[15]) ? ALU_res : mux_out;

    always@(posedge btn_out[0]) num[3:0]   <= A2;
    always@(posedge btn_out[1]) num[7:4]   <= B2;
    always@(posedge btn_out[2]) num[11:8]  <= C2;
    /* ============================= */

endmodule