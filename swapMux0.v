module swapMux0(
	input [15:0] ALUMux0, OutDataOp2,
	input Swap1,
	output reg [15:0] SwapSrc0
);

always@(*) begin
	if (Swap1) begin
		SwapSrc0 = OutDataOp2;
	end
	else begin
		SwapSrc0 = ALUMux0;
	end
end

endmodule
