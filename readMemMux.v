module readMemMux(
	input [15:0] readMem,
	input LoadByte,
	output reg [15:0] result
);

reg [15:0] concatZero;

always@(*) begin
	if (LoadByte) begin
		concatZero = {8'h00, readMem[15:8]};
		result = concatZero;
	end
	else begin
		result = readMem;
	end
end
endmodule
