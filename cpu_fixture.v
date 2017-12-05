`include "cpu.v"

module cpu_fixture;
	reg clk;
	reg rst;
	/*
	wire [7:0] PCAdderOut;
	wire [15:0] InstrucOut;	
	wire [15:0] readDataOp1, readDataOp2, readDataR15;
	wire [15:0] OutDataOp1, OutDataOp2, OutConcatZero, OutSignExtImmd;
	wire [3:0] OutIdExOp1, OutIdExOp2;
	wire [1:0] OutEX;
	wire [15:0] InstrucOut;
	wire [15:0] Op1Val, Op2Val;
	wire [7:0] PCAdderOut;
	wire [3:0] Operation;
	wire [15:0] ALUResult, RegR15Result, ReadOp1Data, ReadOp2Data;
	*/
	cpu youShallNotPass(clk, rst);
	
	initial begin
		clk = 0;
		rst = 0;
		forever #5 clk =~ clk;
	end
	
	initial begin
		$display("\tTime  | PCresult | PCAdderResult | Instruction | Op1Data | Op2Data | R15Data | ALUResult | RegR15Result | Instruction_IF_ID | PCAdder_IF_ID");
		$display("--------------------------------------------------------------------------------------------------");
		$monitor("%d, %b, %b, %h, %h, %h, %h, %h, %h, %h",$time, youShallNotPass.myPC.PCresult,		// PC result 
			                     youShallNotPass.PCAdderResult, 												// PC adder result
					     youShallNotPass.Instruction,												// Instruction
				     	     youShallNotPass.ReadOp1Data, youShallNotPass.ReadOp2Data, youShallNotPass.ReadR15Data,					// Op1, Op2 and R15 Register ReadData
				             youShallNotPass.SwapSrc0, youShallNotPass.OutALUResultExMem, youShallNotPass.ReadAddressData);// ALU result 
					    // youShallNotPass.InstrucOut, youShallNotPass.PCAdderOut,		// if_ed buffer
				           //  youShallNotPass.OutDataOp1, youShallNotPass.OutDataOp2, youShallNotPass.OutConcatZero, youShallNotPass.OutSignExtImmd, youShallNotPass.OutIdExOp1, // id_ex buffer
				            // youShallNotPass.OutIdExOp2, youShallNotPass.OutWB, youShallNotPass.OutMEM, youShallNotPass.OutEX,  // id_ex buffer
				          //   youShallNotPass.OutOp1ValExMem, youShallNotPass.OutOp2ValExMem, youShallNotPass.OutALUResultExMem, youShallNotPass.OutR15ResultExMem, // ex_mem buffer 
					//     youShallNotPass.OutRegOp1ExMem, youShallNotPass.OutRegOp2ExMem, youShallNotPass.OutWBEX, // ex_mem buffer 
				      //       youShallNotPass.OutALUResultExMem, youShallNotPass.MemRd, youShallNotPass.MemWrt ,youShallNotPass.ReadAddressData);	// read from memory for load instruction														
	end	

	initial begin
		#10 rst = ~rst;
	end

	initial begin
		#400 $finish;
	end
endmodule
