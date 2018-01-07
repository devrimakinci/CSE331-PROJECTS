module likeALU(out,Inp_A,Inp_B,select);//4:1 lik multiplexer
input [4:0] Inp_A,Inp_B; //Input 5 bitlik A ve B sayıları
input [1:0] select; //Input 2 bitlik select
output [4:0] out; //Output 5 bitlik çıktı
wire [4:0] Inp_A,Inp_B,out;
wire [1:0] select;
wire [4:0] andOutput,orOutput,xorOutput,adderOuput;
wire [19:0] tempOut; //select bitine göre seçilecek bitleri tutar.
wire carryIn,carryOut,notselect0,notselect1;

assign carryIn = 0; //CarryIn bitinin 0 atanması

andFiveBits inp0(andOutput,Inp_A,Inp_B); //5 bitin and'lenmesi output->andOutput
adderFiveBits inp1(adderOuput,carryOut,Inp_A,Inp_B,carryIn);//5 bitin toplanması output->adderOuput
orFiveBits inp2(orOutput,Inp_A,Inp_B);//5 bitin or'lanması output->orOutput
xorFiveBits inp3(xorOutput,Inp_A,Inp_B);//5 bitin xor'lanması output->xorOutput

not n1(notselect0,select[0]); //1.select bitinin değilinin alınması
not n2(notselect1,select[1]); //2.select bitinin değilinin alınması

//select bitine göre birinci bitin seçilmesi

and and1(tempOut[0],notselect0,notselect1,andOutput[0]);
and and2(tempOut[1],select[0],notselect1,adderOuput[0]);
and and3(tempOut[2],notselect0,select[1],orOutput[0]);
and and4(tempOut[3],select[0],select[1],xorOutput[0]);

//select bitine göre ikinici bitin seçilmesi

and and5(tempOut[4],notselect0,notselect1,andOutput[1]);
and and6(tempOut[5],select[0],notselect1,adderOuput[1]);
and and7(tempOut[6],notselect0,select[1],orOutput[1]);
and and8(tempOut[7],select[0],select[1],xorOutput[1]);

//select bitine göre üçüncü bitin seçilmesi

and and9(tempOut[8],notselect0,notselect1,andOutput[2]);
and and10(tempOut[9],select[0],notselect1,adderOuput[2]);
and and11(tempOut[10],notselect0,select[1],orOutput[2]);
and and12(tempOut[11],select[0],select[1],xorOutput[2]);

//select bitine göre dördüncü bitin seçilmesi

and and13(tempOut[12],notselect0,notselect1,andOutput[3]);
and and14(tempOut[13],select[0],notselect1,adderOuput[3]);
and and15(tempOut[14],notselect0,select[1],orOutput[3]);
and and16(tempOut[15],select[0],select[1],xorOutput[3]);

//select bitine göre beşinci bitin seçilmesi

and and17(tempOut[16],notselect0,notselect1,andOutput[4]);
and and18(tempOut[17],select[0],notselect1,adderOuput[4]);
and and19(tempOut[18],notselect0,select[1],orOutput[4]);
and and20(tempOut[19],select[0],select[1],xorOutput[4]);

//Seçilen bitlerin hepsinin or'lanarak 5 bitlik çıktıyı oluşturması

or or1(out[0],tempOut[0],tempOut[1],tempOut[2],tempOut[3]);
or or2(out[1],tempOut[4],tempOut[5],tempOut[6],tempOut[7]);
or or3(out[2],tempOut[8],tempOut[9],tempOut[10],tempOut[11]);
or or4(out[3],tempOut[12],tempOut[13],tempOut[14],tempOut[15]);
or or5(out[4],tempOut[16],tempOut[17],tempOut[18],tempOut[19]);


endmodule
