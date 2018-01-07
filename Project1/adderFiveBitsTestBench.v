`define DELAY 30
module adderFiveBitsTestBench();
reg [4:0]A,B;
reg carryIn;
wire [4:0]sum;
wire carryOut;

adderFiveBits test(sum,carryOut,A,B,carryIn);

initial begin
A = 5'b11001; B = 5'b00111; carryIn = 1'b0;
#`DELAY;
A = 5'b00000; B = 5'b00001; carryIn = 1'b1;
#`DELAY;
A = 5'b00010; B = 5'b00010; carryIn = 1'b0;
#`DELAY;
A = 5'b10000; B = 5'b00011; carryIn = 1'b1;
#`DELAY;
A = 5'b01100; B = 5'b10000; carryIn = 1'b0;
#`DELAY;
A = 5'b00001; B = 5'b11111; carryIn = 1'b0;
end

initial begin
$monitor ("time = %2d, A = %5b, B = %5b, carryIn = %1b, sum = %5b, carryOut = %1b",$time,A,B,carryIn,sum,carryOut);
end

endmodule
