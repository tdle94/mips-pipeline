module mem_wb (
	input clk, rst,
	input [15:0] memRead,
	input [15:0] op1Val, ALUResult, op2Val, R15Result,
	input [3:0]  regOp1,
	input wb, inRegWrt,		// wb is write back signal
	output  [15:0] outMemRead,
	output  [15:0] outOp1Val, outALUResult, outOp2Val, outR15Result,
	output  [3:0]  outRegOp1,
	output  RegWrt
);

reg [15:0] inMemRead, inOp1Val, inALUResult, inOp2Val, inR15Result;
reg [3:0] inRegOp1;


assign outMemRead = memRead;
assign outOp1Val = op1Val;
assign outOp2Val = op2Val;
assign outALUResult = ALUResult;
assign outR15Result = R15Result;
assign outRetOp1 = regOp1;
assign RegWrt = inRegWrt;

always@(posedge clk or negedge rst) begin
	if (!rst) begin
		
	end
	else begin
		inMemRead = memRead;
		inOp1Val = op1Val;
		inOp2Val = op2Val;
		inALUResult = ALUResult;
		inR15Result = R15Result;
		inRegOp1 = regOp1;
	end
end
endmodule
