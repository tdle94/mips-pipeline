module readMemMux(
	input LoadByte,
	input [15:0] readMem,
	output reg [15:0] result
);

always@(*) begin
	if (LoadByte) begin
		result = {8'h00, readMem[7:0]};
	end
	else begin
		result = readMem;
	end
end
endmodule
