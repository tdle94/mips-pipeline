module data_memory(
	input [15:0] address,		// memory access
	input [15:0] wrtData,			// data want to read
	output reg [15:0] readData,		// output data
	input MemRead, MemWrt, clk, rst
);

reg [15:0] memory[15:0];

always@(posedge clk or negedge rst) begin
	if (!rst) begin
		memory[0] <= 16'h2BCD;
		memory[2] <= 16'h0000;
		memory[4] <= 16'h1234;
		memory[6] <= 16'hDEAD;
		memory[8] <= 16'hBEEF;
	end
	else begin
		if (MemWrt) begin
			memory[address] = wrtData;
		end
		else if (MemRead) begin
			readData = memory[address];
		end
	end
end
endmodule
