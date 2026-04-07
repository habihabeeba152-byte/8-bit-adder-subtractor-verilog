`timescale 1ns/1ps

module tb_adder_subtractor;

    reg [7:0] A, B;
    reg M;
    wire [7:0] S;
    wire Cout;

    // Instantiate DUT
    adder_subtractor_8bit uut (
        .A(A),
        .B(B),
        .M(M),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        $display("Time\tA\tB\tM\t|\tS\tCout");
        $monitor("%0t\t%d\t%d\t%b\t|\t%d\t%b", $time, A, B, M, S, Cout);

        // Initialize (VERY IMPORTANT to avoid X)
    

        // ADDITION TESTS
        A = 8'b11011010; B = 8'b10001111;  M = 0; #10;
        A = 8'b10010010; B = 8'b11111111; M = 0; #10;

        // SUBTRACTION TESTS
       A = 8'b11011010; B = 8'b10101110;  M = 1; #10;
        A = 8'b10010010; B = 8'b11111111; M = 1; #10;
        
        
        

        $finish;
    end

endmodule
