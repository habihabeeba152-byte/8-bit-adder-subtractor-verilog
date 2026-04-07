module adder_subtractor_8bit (
    input [7:0] A,
    input [7:0] B,
    input M,             
    output [7:0] S,
    output Cout
);

    wire [7:0] w;
    wire [7:0] carry;
    wire cin;
    
    xor in(cin,M,1'b0);
    xor x0(w[0],M,B[0]);
    xor x1(w[1],M,B[1]);
    xor x2(w[2],M,B[2]);
    xor x3(w[3],M,B[3]);
    xor x4(w[4],M,B[4]);
    xor x5(w[5],M,B[5]);
    xor x6(w[6],M,B[6]);
    xor x7(w[7],M,B[7]);

   
    full_adder FA0 (.A(A[0]), .B(w[0]), .Cin(cin),.Sum(S[0]), .Cout(carry[0]));
    full_adder FA1 (.A(A[1]), .B(w[1]), .Cin(carry[0]), .Sum(S[1]), .Cout(carry[1]));
    full_adder FA2 (.A(A[2]), .B(w[2]), .Cin(carry[1]), .Sum(S[2]), .Cout(carry[2]));
    full_adder FA3 (.A(A[3]), .B(w[3]), .Cin(carry[2]), .Sum(S[3]), .Cout(carry[3]));
    full_adder FA4 (.A(A[4]), .B(w[4]), .Cin(carry[3]), .Sum(S[4]), .Cout(carry[4]));
    full_adder FA5 (.A(A[5]), .B(w[5]), .Cin(carry[4]), .Sum(S[5]), .Cout(carry[5]));
    full_adder FA6 (.A(A[6]), .B(w[6]), .Cin(carry[5]), .Sum(S[6]), .Cout(carry[6]));
    full_adder FA7 (.A(A[7]), .B(w[7]), .Cin(carry[6]), .Sum(S[7]), .Cout(carry[7]));
   
   
   xor(Cout,carry[7],M);
endmodule



module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

    assign Sum  = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule

