module mips_core(clock);
input clock;

wire [31:0] instruction;
reg [31:0] data_mem [255:0];

initial begin
	$readmemb("data.mem", data_mem);
end

wire [31:0] rsContent,rtContent,memContent,memcontent,address;
reg [31:0] writeMem,memAddr;
wire [25:0] targetAddress;
wire [15:0] immed;
wire [4:0] rs, rt, shamt;
wire [4:0] rd;
wire [5:0] funcCode,opCode;
reg [5:0] regOpCode;
wire regWriteSignal;
wire memReadSig,memWriteSig;
wire destReg; // rt veya rd yi secmek icin tanimlanmis bir sinyaldir.
reg zero;
reg [31:0] writeData,tempWriteData,upperImmed;
reg [31:0] ALUResult;
wire [27:0] extendAddress;
reg signed [31:0] rsSigned,rtSigned;
wire [31:0] temp;
reg[31:0] PC = 32'b0;
wire zeroBit;
wire[31:0] signExtend,jumpAddress;

assign zeroBit = 1'b0;

assign opCode = instruction[31:26]; //opCode
assign funcCode = instruction[5:0]; //funcCode

controlUnit contSig(regWriteSignal,rd,destReg,memReadSig,memWriteSig,opCode,funcCode,instruction,clock);

assign rs = instruction[25:21];  //rs
assign rt = instruction[20:16]; //rt
assign shamt = instruction[10:6]; //shamt
assign immed = instruction[15:0]; //immediate field
assign targetAddress = instruction[25:0]; //target address

// SignExtend ve Jump İcin adres hesaplamalari
assign signExtend = {{16{immed[15]}},immed};
assign extendAddress = {{2{zeroBit}},targetAddress};
assign temp = PC + 1;
assign jumpAddress = {{temp[31:28]},extendAddress};

// Upper Immediately Islemi
always @(*) begin
	upperImmed = {immed,16'b0};
end

assign address = rsContent + signExtend;
assign memContent = data_mem[address];

mips_instr_mem instructionmem(instruction, PC);

always @(posedge clock)
begin
	rtSigned = rtContent;
	rsSigned = rsContent;
	regOpCode = opCode;
end

always @(posedge clock) begin
	if (opCode == 43)begin // Store Word
		ALUResult = rsContent + signExtend;
		memAddr = ALUResult;
		writeMem = rtContent;
	end
	else if (opCode == 40)begin // Store Byte
		ALUResult = rsContent + signExtend;
		memAddr = ALUResult;
		writeMem = rtContent;
	end
	else if (opCode == 41)begin // Store Halfword
		ALUResult = rsContent + signExtend;
		memAddr = ALUResult;
		writeMem = rtContent;
	end
end

always @(posedge clock) // ALU
begin
	if (opCode == 12)begin	// And Immediately
		ALUResult = rsContent & signExtend;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (opCode == 13)begin // Or Immediately
		ALUResult = rsContent | signExtend;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if(opCode == 14)begin // Xor Immediately
		ALUResult = rsContent ^ signExtend;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if(opCode == 3)begin // Jump and Link
		writeData = PC + 2;
		zero = 1'b0;
	end
	else if(opCode == 4)begin // Branch Equal
		if(rsContent == rtContent)begin
			zero = 1'b1;
		end
		else begin
			zero = 1'b0;
		end
	end
	else if(opCode == 5)begin // Branch Not Equal
		if(rsContent != rtContent)begin
			zero = 1'b1;
		end
		else begin
			zero = 1'b0;
		end
	end
	else if (opCode == 10)begin // Set Less Than Immediately
		ALUResult = rsSigned < signExtend;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (opCode == 11)begin // Set Less Than Immediately Unsigned
		ALUResult = rsContent < signExtend;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (opCode == 35)begin // Load Word
		writeData = memContent;
		zero = 1'b0;
	end
	else if (opCode == 36)begin // Load Byte Unsigned
		writeData = {24'b0,data_mem[address][7:0]};
		zero = 1'b0;
	end
	else if (opCode == 37)begin // Load Halfword Unsigned
		writeData = {16'b0,data_mem[address][15:0]};
		zero = 1'b0;
	end
	else if (opCode == 48)begin // Load Linked
		writeData = memContent;
		zero = 1'b0;
	end
	else if (opCode == 15)begin // Load Upper Immediately
		writeData = upperImmed;
		zero = 1'b0;
	end
	else if (opCode == 43)begin // Store Word
		writeData = rtContent;
		zero = 1'b0;
	end
	else if (opCode == 40)begin // Store Byte
		writeData = rtContent;
		zero = 1'b0;
	end
	else if (opCode == 41)begin // Store Halfword
		writeData = rtContent;
		zero = 1'b0;
	end
	else if (opCode == 8)begin // Add Immediately
		ALUResult = rsSigned + signExtend;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (opCode == 9)begin // Add Unsigned Immediately
		ALUResult = rsContent + signExtend;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 0)begin // Shift Left Logical
		ALUResult = rtContent << shamt;
		writeData = ALUResult;
		zero = 1'b0;
	end
	 else if (funcCode == 2)begin // Shift Right Logical
		ALUResult = rtContent >> shamt;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 3)begin // Shift Right Arithmetic
		ALUResult = rtSigned >>> shamt;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 32)begin // Add Signed
		ALUResult = rsSigned + rtSigned;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 33)begin // Add Unsigned
		ALUResult = rsContent + rtContent;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 34)begin // Substract Signed
		ALUResult = rsSigned - rtSigned; 
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 35)begin // Substract Unsigned
		ALUResult = rsContent - rtContent;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 36)begin // And
		ALUResult = rsContent & rtContent;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 37)begin // Or
		ALUResult = rsContent | rtContent; 
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 38)begin // Xor
		ALUResult = rsContent ^ rtContent; 
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 39)begin // Nor
		ALUResult = ~(rsContent | rtContent); 
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 42)begin // Set Less Than
		ALUResult = rsSigned < rtSigned;
		writeData = ALUResult;
		zero = 1'b0;
	end
	else if (funcCode == 43)begin  // Set Less Than Unsigned
		ALUResult = rsContent < rtContent;
		writeData = ALUResult;
		zero = 1'b0;
	end
end

mips_registers registers(rsContent,rtContent,writeData,rs,rt,rd,regWriteSignal,clock);	
mips_data_mem memory(memcontent,memAddr,writeMem,memReadSig,memWriteSig,regOpCode,clock);

always @(posedge clock) begin 
	if (opCode == 6'b000100) begin //beq
		if(zero == 1)begin
			PC = PC + 1 + signExtend;
		end
		else if(zero == 0)begin
			PC = PC + 1;
		end
	end
	else if (opCode == 6'b000101) begin //bne
		if(zero == 1)begin
			PC = PC + 1 + signExtend;
		end
		else if(zero == 0)begin
			PC = PC + 1;
		end
	end
	else if (opCode == 6'b00000)begin  
		if (funcCode == 6'b001000)begin // jr
			PC = rsContent;
		end
		else begin
			PC = PC + 1;
		end
	end
	else if (opCode == 6'b000010)begin // jump
		PC = jumpAddress;
	end
	else if (opCode == 6'b000011)begin // jal
		PC = jumpAddress;
	end
	else begin
		PC = PC + 1 ;
	end
end 

endmodule
