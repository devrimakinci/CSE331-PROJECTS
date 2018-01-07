module mipsInstrTestbench();

reg [31:0] PC;
wire [31:0] instruction;

mips_instr_mem test(instruction,PC);

initial begin
	PC = 32'b00000000000000000000000000000001; #10;
	PC = 32'b00000000000000000000000000000011; #10;
end

initial begin
	$monitor("time = %2d,ins = %32b",$time,instruction);
end
endmodule