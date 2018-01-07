module andFiveBits(out,A,B);//5 bitlik iki sayıyı and'ler.
input [4:0] A,B;//Input 5 bitlik iki sayı
output [4:0] out;//Output 5 bitlil sayı
wire [4:0] A,B,out;

//5 bitin teker teker and'lenmesi
and and0(out[0],A[0],B[0]);
and and1(out[1],A[1],B[1]);
and and2(out[2],A[2],B[2]);
and and3(out[3],A[3],B[3]);
and and4(out[4],A[4],B[4]);

endmodule
