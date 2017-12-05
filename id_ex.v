module id_ex(
	input clk, rst,
	input [15:0] readDataOp1, readDataOp2,
	input [15:0] concatZero, signExtImd, 
	input [3:0] IdExOp1, IdExOp2,
	input wb, mem,
	input  [1:0] ex,
	output  [15:0] outDataOp1, outDataOp2, outConcatZero, outSignExtImd, 
	output  [3:0] outIdExOp1, outIdExOp2,
	output  outWB, outMEM,
	output  [1:0] outEX
);

reg [15:0] inDataOp1, inDataOp2, inConcatZero, inSignExtImd;
reg [3:0] inIdExOp1, inIdExOp2;
reg inWB, inMEM;
reg inEX;

assign outEX = inEX;
assign outDataOp1 = inDataOp1;
assign outDataOp2 = inDataOp2;
assign outConcatZero = inConcatZero;
assign outSignExtImd = inSignExtImd;
assign outIdExOp1 = inIdExOp1;
assign outIdExOp2 = inIdExOp2;
assign outWB = inWB;
assign outMEM = inMEM;

always@(posedge clk or negedge rst) begin

	if(!rst) begin
		//outDataOp1 <= 16'hxxxx;
		//outDataOp2 <= 16'hxxxx;
		//outConcatZero <= 16'hxxxx;
	end
	else begin
		inEX = ex;
		inDataOp1 = readDataOp1;
		inDataOp2 = readDataOp2;
		inConcatZero = concatZero;
		inSignExtImd = signExtImd;
		inIdExOp1 = IdExOp1;
		inIdExOp2 = IdExOp2;
		inWB = wb;
		inMEM = mem;
	end
end
endmodule
