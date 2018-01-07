module fullAdder (sum,carryOut,A,B,carryIn); //Tam toplayıcı
input A,B,carryIn; //Input bir bitlik A ve B sayıları ve elde girişi
output sum,carryOut; //Output toplam ve elde
wire A,B,carryIn,sum,carryOut;
wire tempSum,tempCarryOut1,tempCarryOut2;

//Toplamın bulunması
halfAdder calculateSum1 (tempSum,tempCarryOut1,A,B);
halfAdder calculateSum2 (sum,tempCarryOut2,tempSum,carryIn);

//Eldenin bulunması
or calculateCarry (carryOut,tempCarryOut1,tempCarryOut2);

endmodule
