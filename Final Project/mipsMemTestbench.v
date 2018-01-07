module mipsMemTestbench();

wire [31:0] read_data;
reg [31:0] mem_address,write_data;
reg sig_mem_write,sig_mem_read;

mips_data_mem testMemory(read_data,mem_address,write_data,sig_mem_read,sig_mem_write);

initial begin
	mem_address = 32'b00000000000000000000000000000011;
	write_data = 32'b00000000000000000000000000001111;
	sig_mem_read = 1'b1;
	sig_mem_write = 1'b0;
end

initial begin
	$monitor("time = %2d,data = %32b,sigWr=%1b,sigRd=%1b,mem=%32b,wrData=%32b",$time,read_data,sig_mem_write,sig_mem_read,mem_address,write_data);
end

endmodule
