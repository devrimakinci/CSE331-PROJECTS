module mips_testbench ();
reg clock;
wire result;

mips_core test(clock);

initial clock = 0;

initial begin
	#50 clock=~clock; #50 clock=~clock;
	#50 clock=~clock; #50 clock=~clock;
	#50 clock=~clock; #50 clock=~clock;
	#50 clock=~clock; #50 clock=~clock;
	#50 clock=~clock; #50 clock=~clock;
	#50 clock=~clock;
end

initial begin
	$monitor("TIME = %2d, CLK=%1b",$time,clock);
end

endmodule