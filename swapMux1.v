module swapMux1(
	input [15:0] ALUMux1, OutDataOp1,
	input Swap1,
	output reg [15:0] SwapSrc1
);

always@(*) begin
	if (Swap1) begin
		SwapSrc1 = OutDataOp1;
	end
	else begin
		SwapSrc1 = ALUMux1;
	end
end

endmodule
