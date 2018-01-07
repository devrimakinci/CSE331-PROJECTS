module orFiveBits(out,A,B); //5 bitlik iki sayıyı or'lar.
input [4:0] A,B; //Input 5 bitlik iki sayı
output [4:0] out; //Output 5 bitlik sayı
wire [4:0] A,B,out;

//5 bitin teker teker or'lanması
or or0(out[0],A[0],B[0]);
or or1(out[1],A[1],B[1]);
or or2(out[2],A[2],B[2]);
or or3(out[3],A[3],B[3]);
or or4(out[4],A[4],B[4]);

endmodule
