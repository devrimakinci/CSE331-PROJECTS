module mips_data_mem (read_data, mem_address, write_data, sig_mem_read, sig_mem_write,opCode,clk);
output [31:0] read_data;
input [31:0] mem_address;
input [31:0] write_data;
input [5:0] opCode;
input sig_mem_read;
input sig_mem_write;
input clk;

reg [31:0] data_mem  [255:0];
reg [31:0] read_data;

initial begin
	$readmemb("data.mem", data_mem);
end

always @(posedge clk) begin
	if (sig_mem_read) begin
		read_data = data_mem[mem_address];
	end
	
	if (sig_mem_write) begin
		if (opCode == 6'b101000) begin // Store Byte
			data_mem[mem_address][7:0] = write_data[7:0];
			$display("MemAddresss = %32b, data=%32b",mem_address,data_mem[mem_address]);
		end
		else if (opCode == 6'b101001) begin // Store Halfword
			data_mem[mem_address][15:0] = write_data[15:0];
			$display("MemAddresss = %32b, data=%32b",mem_address,data_mem[mem_address]);
		end
		else if (opCode == 6'b101011) begin // Store Word
			data_mem[mem_address] = write_data[31:0];
			$display("MemAddresss = %32b, data=%32b",mem_address,data_mem[mem_address]);
		end
		$writememb("res_data.mem", data_mem);
	end
end

endmodule