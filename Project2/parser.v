module parser(regSource,regTarget,regDest,shamt,functCode,instruction);

input [31:0] instruction;
output [4:0] regDest,regSource,regTarget,shamt;
output [5:0] functCode;

wire [31:0] instruction;
wire [4:0] regDest,regSource,regTarget,shamt;
wire [5:0] functCode;

assign regSource[0] = instruction[21];
assign regSource[1] = instruction[22];
assign regSource[2] = instruction[23];
assign regSource[3] = instruction[24];
assign regSource[4] = instruction[25];

assign regTarget[0] = instruction[16];
assign regTarget[1] = instruction[17];
assign regTarget[2] = instruction[18];
assign regTarget[3] = instruction[19];
assign regTarget[4] = instruction[20];

assign regDest[0] = instruction[11];
assign regDest[1] = instruction[12];
assign regDest[2] = instruction[13];
assign regDest[3] = instruction[14];
assign regDest[4] = instruction[15];

assign shamt[0] = instruction[6];
assign shamt[1] = instruction[7];
assign shamt[2] = instruction[8];
assign shamt[3] = instruction[9];
assign shamt[4] = instruction[10];

assign functCode[0] = instruction[0];
assign functCode[1] = instruction[1];
assign functCode[2] = instruction[2];
assign functCode[3] = instruction[3];
assign functCode[4] = instruction[4];
assign functCode[5] = instruction[5];

endmodule
