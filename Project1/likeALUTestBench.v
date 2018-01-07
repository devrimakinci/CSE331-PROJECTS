`define DELAY 30
module likeALUTestBench();
reg [4:0] Inp_A,Inp_B;
reg [1:0] select;
wire [4:0] out;

likeALU testALU(out,Inp_A,Inp_B,select);

initial begin
//TEST-1
Inp_A = 5'b01100; Inp_B = 5'b10001; select = 2'b00;
#`DELAY;
Inp_A = 5'b01100; Inp_B = 5'b10001; select = 2'b01;
#`DELAY;
Inp_A = 5'b01100; Inp_B = 5'b10001; select = 2'b10;
#`DELAY;
Inp_A = 5'b01100; Inp_B = 5'b10001; select = 2'b11;
#`DELAY;

//TEST-2
Inp_A = 5'b11111; Inp_B = 5'b00001; select = 2'b00;
#`DELAY;
Inp_A = 5'b11111; Inp_B = 5'b00001; select = 2'b01;
#`DELAY;
Inp_A = 5'b11111; Inp_B = 5'b00001; select = 2'b10;
#`DELAY;
Inp_A = 5'b11111; Inp_B = 5'b00001; select = 2'b11;
#`DELAY;

//TEST-3
Inp_A = 5'b11010; Inp_B = 5'b01111; select = 2'b00;
#`DELAY;
Inp_A = 5'b11010; Inp_B = 5'b01111; select = 2'b01;
#`DELAY;
Inp_A = 5'b11010; Inp_B = 5'b01111; select = 2'b10;
#`DELAY;
Inp_A = 5'b11010; Inp_B = 5'b01111; select = 2'b11;
#`DELAY;

//TEST-4
Inp_A = 5'b11111; Inp_B = 5'b00000; select = 2'b00;
#`DELAY;
Inp_A = 5'b11111; Inp_B = 5'b00000; select = 2'b01;
#`DELAY;
Inp_A = 5'b11111; Inp_B = 5'b00000; select = 2'b10;
#`DELAY;
Inp_A = 5'b11111; Inp_B = 5'b00000; select = 2'b11;
#`DELAY;

//TEST-5
Inp_A = 5'b10101; Inp_B = 5'b01100; select = 2'b00;
#`DELAY;
Inp_A = 5'b10101; Inp_B = 5'b01100; select = 2'b01;
#`DELAY;
Inp_A = 5'b10101; Inp_B = 5'b01100; select = 2'b10;
#`DELAY;
Inp_A = 5'b10101; Inp_B = 5'b01100; select = 2'b11;

end

initial begin
$monitor("time=%2d, Inp_A=%5b, Inp_B=%5b, select=%2b, Output=%5b",$time,Inp_A,Inp_B,select,out);
end

endmodule
