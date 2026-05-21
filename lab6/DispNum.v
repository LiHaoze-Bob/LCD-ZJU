module DispNum(
    input [1:0] BTN,
    input[7:0] SW,
    output [7:0] SEGMENT,
    output [3:0] AN,
    output BTN_X
);
    wire a, b, c, d, e, f, g, p;

    MyMC14495 mc14495_inst(
        .D0(SW[0]),
        .D1(SW[1]),
        .D2(SW[2]),
        .D3(SW[3]),
        .LE(BTN[1]),
        .point(BTN[0]),
        .p(p),
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g)
    );

    assign SEGMENT = {p, g, f, e, d, c, b, a};
    

    assign AN = ~SW[7:4]; 
    
    assign BTN_X = 1'b0;

endmodule