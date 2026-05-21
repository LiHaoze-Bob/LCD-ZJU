module CreateNumber(
    input clk,          // 系统时钟
    input btn,          // 经过消抖后的按键信号
    input sub,          // 0 为加法 (Inc), 1 为减法 (Dec)
    output reg [3:0] num
);
    wire [3:0] next_num;
    wire co;

    // 实例化之前完成的四位加减法器
    // A 为当前寄存器的值，B 固定为 1，实现 +1 或 -1
    adder_sub_4bit as_inst (
        .A(num),
        .B(4'b0001),
        .sub(sub),
        .S(next_num),
        .cout(co)
    );

    reg btn_prev;
    always @(posedge clk) begin
        btn_prev <= btn;
        // 检测按键上升沿
        if (btn && !btn_prev) begin
            num <= next_num;
        end
    end
endmodule