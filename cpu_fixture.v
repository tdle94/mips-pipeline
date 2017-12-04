`include "cpu.v"

module cpu_fixture;
	reg clk;
	reg rst;
	//wire [7:0] PCAdderOut;
	//wire [15:0] InstrucOut;	
	//wire [15:0] readDataOp1, readDataOp2, readDataR15;
	wire [15:0] OutDataOp1, OutDataOp2, OutConcatZero, OutSignExtImmd;
	wire [3:0] OutIdExOp1, OutIdExOp2;
	wire [1:0] OutEX;
	wire [15:0] InstrucOut;
	wire [15:0] Op1Val, Op2Val;
	wire [7:0] PCAdderOut;
	wire [3:0] Operation;
	wire [15:0] ALUResult, RegR15Result, ReadOp1Data, ReadOp2Data;
	cpu myCPU (clk, rst, Operation, ReadOp1Data, ReadOp2Data, OutDataOp1, OutDataOp2,  ALUResult, RegR15Result);
	//cpu myCPU(clk, rst, Op1Val, Op2Val, instrucOut);
	initial begin
		clk = 0;
		rst = 0;
		forever #5 clk =~ clk;
	end
	
	initial begin
		$display(" 		Time  	| InstrucOut	| PCAdderOut");
		$display("			-------------------------------------------------");
		$monitor("%d, Op: %b, Op1Data: %b, Op2data: %b, OutOp1: %b, OutOp2: %b,  ALURes: %b, R15Res: %b", $time, Operation, ReadOp1Data, ReadOp2Data, OutDataOp1, OutDataOp2, ALUResult, RegR15Result);

		//$monitor("%d, Op1Val: %b, Op2Val: %b, instruction: %b", $time, Op1Val, Op2Val, instrucOut);
	end	

	initial begin
		#20 rst = ~rst;
	end

	initial begin
		#400 $finish;
	end
endmodule
