module controlUnit(regWr,rd,regDest,memRead,memWr,opCode,functCode,instruction,clk);

output reg regWr,regDest,memRead,memWr;
output reg [4:0] rd;
input [5:0] opCode,functCode;
input[31:0] instruction;
input clk;

always @(posedge clk)
begin
	if(opCode == 6'b000000)begin //R-Type
		if (functCode == 6'b001000)begin // jr
			regWr = 1'b0;
			regDest = 1'b0;
			memRead = 1'b0;
			memWr = 1'b0;
			if(regDest == 1)begin
				rd = instruction[15:11]; //rd
			end
			else if(regDest == 0)begin
				rd = instruction[20:16];
			end
		end
		else begin // Except jump register
			regWr = 1'b1;
			regDest = 1'b1;
			memRead = 1'b0;
			memWr = 1'b0;
			if(regDest == 1)begin
				rd = instruction[15:11]; //rd
			end
			else if(regDest == 0)begin
				rd = instruction[20:16];
			end
		end	
	end
	else if (opCode == 6'b001100)begin //andi
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if (opCode == 6'b001010)begin //slti
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if (opCode == 6'b001011)begin //sltiu
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if (opCode == 6'b100011)begin //lw
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b1;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if (opCode == 6'b100100)begin //lbu
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b1;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if (opCode == 6'b100101)begin //lhu
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b1;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if(opCode == 6'b110000)begin //ll
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b1;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if (opCode == 6'b101011)begin //sw
		regWr = 1'b0;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b1;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if (opCode == 6'b101000)begin //sb
		regWr = 1'b0;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b1;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if (opCode == 6'b101001)begin //sh
		regWr = 1'b0;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b1;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if (opCode == 6'b001000)begin //addi
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if (opCode == 6'b001001)begin //addiu
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if(opCode == 6'b001101)begin //ori
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if(opCode == 6'b001110)begin //xori
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if(opCode == 6'b000100)begin //beq
		regWr = 1'b0;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if(opCode == 6'b000101)begin //bne
		regWr = 1'b0;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if(opCode == 6'b000010)begin //jump
		regWr = 1'b0;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
	else if(opCode == 6'b000011)begin //jal
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = 5'b11111;
		end
	end
	else if(opCode == 6'b001111)begin //lui
		regWr = 1'b1;
		regDest = 1'b0;
		memRead = 1'b0;
		memWr = 1'b0;
		if(regDest == 1)begin
			rd = instruction[15:11]; //rd
		end
		else if(regDest == 0)begin
			rd = instruction[20:16];
		end
	end
end

endmodule
