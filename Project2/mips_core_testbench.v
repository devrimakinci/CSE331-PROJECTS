module mips_testbench ();

reg [31:0] instruction_set;
wire [31:0] result;


mips_core testMIPS(instruction_set,result);

initial begin
instruction_set = 32'b00000001111100000000000000100000; #10; //add
instruction_set = 32'b00000010001010011101000000100001; #10; //addu
instruction_set = 32'b00000001011011001111000000100101; #10; //or
instruction_set = 32'b00000000100010110000100000100100; #10; //and
instruction_set = 32'b00000010001000100111000000100010; #10; //sub
instruction_set = 32'b00000000000110111011100011000011; #10; //sra
instruction_set = 32'b00000000000001111010000101000000; #10; //sll
instruction_set = 32'b00000000000010000001100111000010; #10; //srl
instruction_set = 32'b00000001101100101100100000101011; #10; //sltu

end

initial begin
	$monitor("time = %2d ins = %32b , resut = %32b",$time,instruction_set,result);
end
endmodule
