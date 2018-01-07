module testbenchRegister();

reg [31:0] write_data;
reg [4:0] read_reg_1, read_reg_2, write_reg;
reg signal_reg_write,clk;
wire [31:0] read_data_1, read_data_2;

mips_registers testRegister(read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk);


initial begin
	read_reg_1 = 5'b01010;
	read_reg_2 = 5'b01001;
	write_reg = 5'b01011;
	signal_reg_write = 1'b1;
	clk = 1'b0;
	write_data = 32'b00110000000000000000000000011111;
	#10;
	read_reg_1 = 5'b00010;
	read_reg_2 = 5'b00011;
	write_reg = 5'b00111;
	signal_reg_write = 1'b0;
	clk = 1'b0;
	write_data = 32'b00110000000000000000001111111111;
	#10;
end
initial begin
	$monitor("time=%2d,read_reg_1=%5b,read_reg_2=%5b,write_reg=%5b,rw=%1b,clk=%1b,wd=%32b,rd1=%32b,rd2=%32b",$time,read_reg_1,read_reg_2,write_reg,signal_reg_write,clk,write_data,read_data_1,read_data_2);
end

endmodule