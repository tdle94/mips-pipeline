`include "pc_adder.v"

module test_addr;

reg [7:0] in = 3;
wire [7:0] out;
reg clk;



pc_adder myAddr(in, out);

initial begin
	clk = 1;	
	forever #5 clk =~ clk;
end

initial begin
	$monitor("ADDR:  %d, %d, %d %d", $time, clk, in, myAddr.nextAddress);
	#50 $finish;
end

initial begin	
	#10 in = 5;
	#10 in = 8;
	#10 in = 15;
end

endmodule
