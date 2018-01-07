`define DELAY 30
module fullAdderTestBench();
reg A,B,carryIn;
wire carryOut,sum;

fullAdder testFullAdder(sum,carryOut,A,B,carryIn);

initial begin
A = 1'b0; B = 1'b0; carryIn = 1'b0;
#`DELAY;
A = 1'b0; B = 1'b0; carryIn = 1'b1;
#`DELAY;
A = 1'b0; B = 1'b1; carryIn = 1'b0;
#`DELAY;
A = 1'b0; B = 1'b1; carryIn = 1'b1;
#`DELAY;
A = 1'b1; B = 1'b0; carryIn = 1'b0;
#`DELAY;
A = 1'b1; B = 1'b0; carryIn = 1'b1;
#`DELAY;
A = 1'b1; B = 1'b1; carryIn = 1'b0;
#`DELAY;
A = 1'b1; B = 1'b1; carryIn = 1'b1;
end
 
 
initial
begin
$monitor("time = %2d, a =%1b, b=%1b, carry_in=%1b, sum=%1b, carry_out=%1b", $time, A, B, carryIn, sum, carryOut);
end
 
endmodule