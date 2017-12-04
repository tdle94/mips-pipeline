module id_ex(
	input clk, rst,
	input [15:0] readDataOp1, readDataOp2,
	input [15:0] concatZero, signExtImd,
	input [3:0] IdExOp1, IdExOp2,
	input wb, mem,
	input  [1:0] ex,
	output reg [15:0] outDataOp1, outDataOp2, outConcatZero, outSignExtImd,
	output reg [3:0] outIdExOp1, outIdExOp2,
	output reg outWB, outMEM,
	output reg [1:0] outEX
);

/*(assign outEX = ex;
assign outDataOp1 = readDataOp1;
assign outDataOp2 = readDataOp2;
assign outConcatZero = concatZero;
assign outSignExtImd = signExtImd;
assign outIdExOp1 = IdExOp1;
assign outIdExOp2 = IdExOp2;
assign outWB = wb;
assign outMEM = mem;*/

always@(posedge clk or negedge rst) begin

	if(!rst) begin
		//outDataOp1 <= 16'hxxxx;
		//outDataOp2 <= 16'hxxxx;
		//outConcatZero <= 16'hxxxx;
	end
	else begin
		outEX = ex;
		outDataOp1 = readDataOp1;
		outDataOp2 = readDataOp2;
		outConcatZero = concatZero;
		outSignExtImd = signExtImd;
		outIdExOp1 = IdExOp1;
		outIdExOp2 = IdExOp2;
		outWB = wb;
		outMEM = mem;
	end
end
endmodule
