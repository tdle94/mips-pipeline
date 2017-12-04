module mem_wb (
	input [15:0] memRead,
	input [15:0] op1Val, ALUResult, op2Val, R15Result,
	input [3:0] regR15, regOp1,
	input wb, clk, rst,		// wb is write back signal
	output reg [15:0] outMemRead,
	output reg [15:0] outOp1Val, outALUResult, outOp2Val, outR15Result,
	output reg [3:0] outReg15, outRegOp1,
	output reg RegWrt
);

always@(posedge clk or negedge rst) begin
	if (!rst) begin
		outMemRead = memRead;
		outOp1Val = 0;
		outOp2Val = 0;

	end
	else begin
		outMemRead = memRead;
		outOp1Val = op1Val;
		outOp2Val = op2Val;
		outALUResult = ALUResult;
		outR15Result = R15Result;
		outReg15 = regR15;
		outRegOp1 = regOp1;
		RegWrt = wb;
	end
end
endmodule