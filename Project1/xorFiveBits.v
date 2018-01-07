module xorFiveBits(out,A,B);//5 bitlik iki sayının xor'lanması
input [4:0] A,B; //Input 5 bitlik iki sayı
output [4:0] out; //Outpu 5 bitlik sayı
wire [4:0] A,B,out;


//5 bitin teker teker xor'lanması
xor xor0(out[0],A[0],B[0]);
xor xor1(out[1],A[1],B[1]);
xor xor2(out[2],A[2],B[2]);
xor xor3(out[3],A[3],B[3]);
xor xor4(out[4],A[4],B[4]);

endmodule
