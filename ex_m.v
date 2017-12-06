module ex_m (
	input clk, rst,
	input [15:0] op1Val, op2Val,
	input [15:0] ALUResult, R15Result,
	input [3:0] regOp1,regOp2,
	input wb, mem, 	// write back and mem signal
	output [15:0] outOp1Val, outOp2Val,
	output [15:0] outALUResult, outR15Result,
	output [3:0] outRegOp1,outRegOp2,
	output outWB
);

reg [15:0] inOp1Val, inOp2Val, inALUResult, inR15Result;
reg [3:0] inRegOp1, inRegOp2;
reg inWB;

assign outOp1Val = op1Val;
assign outOp2Val = op2Val;
assign outALUResult = ALUResult;
assign outR15Result = R15Result;
assign outRegOp1 = regOp1;
assign outRegOp2 = regOp2;
assign outWB = wb;

always@(posedge clk or negedge rst) begin
	if (!rst) begin
		
	end
	else begin
		inOp1Val = op1Val;
		inOp2Val = op2Val;
		inALUResult = ALUResult;
		inR15Result = R15Result;
		inRegOp1 = regOp1;
		inRegOp2 = regOp2;
		inWB = wb;
	end
end
endmodule
