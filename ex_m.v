module ex_m (
	input [15:0] op1Val, op2Val,
	input [15:0] ALUResult, R15Result,
	input [3:0] regOp1,regOp2,
	input wb, mem, clk, rst,	// write back and mem signal
	output reg [15:0] outOp1Val, outOp2Val,
	output reg [15:0] outALUResult, outR15Result,
	output reg [3:0] outRegOp1,outRegOp2,
	output reg outWB
);

always@(posedge clk or negedge rst) begin
	if (!rst) begin
		outOp1Val = 0;
		outOp2Val = 0;
		outALUResult = 0;
		outR15Result = 0;
		//outRegR15 = 0;
		outRegOp1 = 0;
		outRegOp2 = 0;
		outWB = 0;
	end
	else begin
		outOp1Val = op1Val;
		outOp2Val = op2Val;
		outALUResult = ALUResult;
		outR15Result = R15Result;
		//outRegR15 = regR15;
		outRegOp1 = regOp1;
		outRegOp2 = regOp2;
		outWB = wb;
	end
end

endmodule
