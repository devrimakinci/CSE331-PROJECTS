module mips_core(instruction, result);

input [31:0] instruction;
output [31:0] result;

wire [31:0] instruction;
reg [31:0] ALUResult,writeResult;
wire [4:0] rs,rt,rd,shamt;
wire [5:0] funct;
wire [31:0] rsContent,rtContent;
reg signed [31:0] rsSigned,rtSigned;
reg sigWr = 1'b0,clk = 1'b0;

parser parse(rs,rt,rd,shamt,funct,instruction);
mips_registers readMIPSRegister(rsContent,rtContent,writeResult,rs,rt,rd,sigWr,clk);

always @(*)
begin
	rtSigned = rtContent;
	rsSigned = rsContent;
end

always @(*)
begin
	if (funct == 0)
		 ALUResult = rtContent << shamt;
	else if (funct == 2)
		ALUResult = rtContent >> shamt;
	else if (funct == 3)
		ALUResult = rtSigned >>> shamt;		
	else if (funct == 32)
		ALUResult = rsSigned + rtSigned;
	else if (funct == 33)
		ALUResult = rsContent + rtContent;
	else if (funct == 34)
		ALUResult = rsSigned - rtSigned;
	else if (funct == 36)
		ALUResult = rsContent & rtContent;
	else if (funct == 37)
		ALUResult = rsContent | rtContent;
	else if (funct == 43)
		ALUResult = rsContent < rtContent;
	writeResult = ALUResult;
	sigWr = 1'b1;
	clk = 1'b1;
end

assign result = ALUResult;
endmodule
