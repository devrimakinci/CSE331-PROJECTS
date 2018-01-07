module mips_registers
(
	output reg [31:0] read_data_1, read_data_2,
	input [31:0] write_data,
	input [4:0] read_reg_1, read_reg_2, write_reg,
	input signal_reg_write, clk
);
	reg [31:0] registers [31:0];	
	//1 kere okunuyor. 
	//diğer işlemler register file üstünde yapılıyor.
	initial begin
		$readmemb("registers.mem", registers);
	end
	

	always @(posedge clk) 
	begin
		if (signal_reg_write == 1) begin
			registers[write_reg] = write_data;
			$writememb("res_registers.mem", registers);
			$display("WriteReg = %5b, data=%32b",write_reg,registers[write_reg]);
		end
	end
	
	always @(negedge clk)
	begin
		read_data_1 = registers[read_reg_1];
		read_data_2 = registers[read_reg_2];
	end

endmodule