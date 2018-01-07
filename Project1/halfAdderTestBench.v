`define DELAY 30
module halfAdderTestBench(); 
reg A,B;
wire sum,carryOut;

halfAdder testHalfAdder(sum,carryOut,A,B);

initial begin
A = 1'b0; B = 1'b0;
#`DELAY;
A = 1'b1; B = 1'b0;
#`DELAY;
A = 1'b0; B = 1'b1;
#`DELAY;
A = 1'b1; B = 1'b1;
end
 
 
initial
begin
$monitor("time = %2d, a =%1b, b=%1b, sum=%1b, carry_out=%1b", $time, A, B, sum, carryOut);
end
 
endmodule