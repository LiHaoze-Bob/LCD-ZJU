module adder_sub_tb;
    reg [3:0] A, B;
    reg sub;
    wire [3:0] S;
    wire cout;

    adder_sub_4bit uut(A, B, sub, S, cout);

    initial begin
        $dumpfile("adder_sub.vcd");
        $dumpvars(0, adder_sub_tb);
        sub = 0; A = 4'd5; B = 4'd3; #10;
        sub = 0; A = 4'd15; B = 4'd1; #10;
        sub = 1; A = 4'd10; B = 4'd4; #10;
        sub = 1; A = 4'd3; B = 4'd5; #10;

        $finish;
    end
endmodule