`define DELAY 30
module andFiveBitsTestBench();
reg [4:0] A,B;
wire [4:0] out;

andFiveBits test(out,A,B);

initial begin
 A = 5'b00000; B =5'b00000;
 #`DELAY;
 A = 5'b11111; B =5'b00111;
 #`DELAY;
 A = 5'b11000; B =5'b11000;
 #`DELAY;
 A = 5'b10000; B =5'b00000;
 #`DELAY;
 A = 5'b00010; B =5'b00010;
end

initial begin
$monitor("time=%2d, A=%5b, B=%5b,Out=%5b",$time,A,B,out);
end

endmodule
