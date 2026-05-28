module FD(
    input wire clk,
    input wire D,
    output wire Q,
    output wire Qn
);
    reg Q_reg = 1'b0;
    always @(posedge clk) begin
        Q_reg <= D;
    end
    assign Q = Q_reg;
    assign Qn = ~Q_reg;
endmodule

module Counter4b(
    input wire clk,
    output wire Qa,
    output wire Qb,
    output wire Qc,
    output wire Qd,
    output wire Rc
);

    wire Da, Db, Dc, Dd;
    wire Qna, Qnb, Qnc, Qnd;

    FD fd_a (.clk(clk), .D(Da), .Q(Qa), .Qn(Qna));
    FD fd_b (.clk(clk), .D(Db), .Q(Qb), .Qn(Qnb));
    FD fd_c (.clk(clk), .D(Dc), .Q(Qc), .Qn(Qnc));
    FD fd_d (.clk(clk), .D(Dd), .Q(Qd), .Qn(Qnd));

    assign Da = Qna;
    assign Db = Qb ^ Qa;
    assign Dc = Qc ^ (Qa & Qb);
    assign Dd = Qd ^ (Qa & Qb & Qc);

    assign Rc = Qa & Qb & Qc & Qd;

endmodule