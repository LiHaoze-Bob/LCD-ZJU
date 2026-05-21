module adder_sub_4bit(
    input [3:0] A, B,
    input sub, 
    output [3:0] S,
    output cout
);
    wire c1, c2, c3;
    wire [3:0] b_xor;
    assign b_xor = B ^ {4{sub}};
    full_adder fa0(A[0], b_xor[0], sub, S[0], c1);
    full_adder fa1(A[1], b_xor[1], c1,  S[1], c2);
    full_adder fa2(A[2], b_xor[2], c2,  S[2], c3);
    full_adder fa3(A[3], b_xor[3], c3,  S[3], cout);
endmodule