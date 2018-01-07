module mipsRegisterTestbench();

wire [31:0] read_data_1, read_data_2;
reg [31:0] write_data;
reg [4:0] read_reg_1, read_reg_2, write_reg;
reg signal_reg_write, clk;

mips_registers test(read_data_1,read_data_2,write_data,read_reg_1,read_reg_2,write_reg,signal_reg_write,clk);

initial begin

write_data = 32'b00000000000000000000000000000011;
read_reg_1 = 5'b01010;
read_reg_2 = 5'b01011;
write_reg = 5'b00001;
signal_reg_write = 1'b1;
clk = 1'b1;
end

initial begin
	$monitor("time = %2d,data = %32b,rs=%5b,rt=%5b,rd=%5b,sig=%1b,clk=%1b,rd1=%32b,rd2=%32b",$time,write_data,read_reg_1,read_reg_2,write_reg,signal_reg_write,clk,read_data_1,read_data_2);
end

endmodule
