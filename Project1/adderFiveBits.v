module adderFiveBits(sum,carryOut,A,B,carryIn);//5 bitlik sayıları toplayan tam toplayıcı
input [4:0] A,B; //Input 5 bitlik A ve B sayıları
input carryIn; //Elde girişi
output [4:0] sum; //Output 5 bitlik toplam
output carryOut; //Elde
wire [4:0] A,B,sum;
wire carryIn,carryOut;
wire C1,C2,C3,C4; //Diğer bitler gelecek olan eldeler

//5 bitlik bir sayının toplanması
fullAdder FA0(sum[0],C1,A[0],B[0],carryIn);
fullAdder FA1(sum[1],C2,A[1],B[1],C1);
fullAdder FA2(sum[2],C3,A[2],B[2],C2);
fullAdder FA3(sum[3],C4,A[3],B[3],C3);
fullAdder FA4(sum[4],carryOut,A[4],B[4],C4);

endmodule
