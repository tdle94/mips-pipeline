module muxBranch(
    input [7:0] op1Reg, op2Reg,
    input BrOrJmp,
    output reg [7:0] BrcDecision
);

always@(*) begin
	if (BrOrJmp) begin
        	BrcDecision = op2Reg << 1;
	end
	else begin
        	BrcDecision = op1Reg << 1;
	end
end


endmodule
