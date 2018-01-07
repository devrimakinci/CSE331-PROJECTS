module halfAdder (sum,carryOut,A,B); //Yarım toplayıcı
input A,B; //Input bir bitlik A ve B sayıları
output sum,carryOut; //Output olarak toplam(sum) ve elde(carryOut)
wire A,B,sum,carryOut;

xor calculateSum (sum,A,B); //Sum değişkenin hesaplanması
and calculateCarryOut (carryOut,A,B); //carryOut(Elde) hesaplanması

endmodule
