`include "pc.v"
`include "memMux.v"
`include "andUnit.v"
`include "branchAdder.v"
`include "instruction_mem.v"
`include "pc_adder.v"
`include "if_id.v"
`include "pc_mux.v"
`include "register_mem.v"
`include "signExt.v"
`include "shift_left.v"
`include "muxBranch.v"
`include "control.v"
`include "hazardDetection.v"
`include "data_memory.v"
`include "controlMux.v"
`include "cmpUnit.v"
`include "branchAnd.v"
`include "id_ex.v"
`include "aluMux0.v"
`include "aluMux1.v"
`include "swapMux1.v"
`include "swapMux0.v"
`include "fwd0.v"
`include "fwd1.v"
`include "alu.v"
`include "alu_control.v"
`include "ex_m.v"
`include "forwardUnit.v"
 
module cpu(input  clk, rst);

/*********** Fetch wire connection ***************/
wire [7:0] NextAddress;
wire [7:0] PCresult, PCAdderResult, PCAdderOut;
wire [15:0] Instruction, InstrucOut;
/************************************************/


/********* Decode wire connection **********/
// Register file 
wire [3:0] WrtRegR15, WrtRegOp1;
wire [15:0] WrtDataOp1, WrtDataOp2, WrtDataR15;
wire [15:0] ReadOp1Data, ReadOp2Data, ReadR15Data;
// control unit
wire [1:0] ALUOp, RegSrc;
wire BrOrJmp, Branch, RegWrt, IFlush, RegSwp, ALUSel0, ALUSel1, ReadByte, MemRd, MemWrt, LoadByte, WBSig, MEMSig;
// hazard detection unit
wire Stall, WrtIfId, PCWrt;
//compare unit
wire PCsrc;
// id/ex buffer
wire CmpResult;
wire [3:0] ControlSig;
//wire [1:0] EXSig;
// Mux branch
wire [7:0] BrcDecision;
wire [7:0] BrcAddress;			// branch address
// id ex buffer
wire [15:0] OutDataOp1, OutDataOp2, OutConcatZero, OutSignExtImmd;
wire [3:0] OutIdExOp1, OutIdExOp2;
wire OutWB, OutMEM;
wire [1:0] OutEX;

/*******************************************/




/***********Execution wire connection *********/
// the muxes before ALU
wire [15:0] ALUSrc0, ALUSrc1, SwapSrc0, SwapSrc1, ALUMux0, ALUMux1,  ALUSrcOut0, ALUSrcOut1;
//wire [15:0] ALUSrc0, ALUSrc1, SwapSrc0, SwapSrc1, ALUMux0, ALUMux1;
// alu wire

// forward unit wire
wire FwdA, FwdB, Swap0, Swap1;
// alu control unit
wire [3:0] Operation;		// execution signal for the ALU to determine which operation to do
wire [15:0] ALUResult, RegR15Result;
// ex mem buffer 
wire [15:0] OutOp1ValExMem, OutOp2ValExMem, OutALUResultExMem, OutR15ResultExMem;
wire [3:0] OutRegOp1ExMem, OutRegOp2ExMem;
wire OutWBEX;
/********************************************************/

/************** Memory wire connection **********/
wire [15:0] DataAddressIn;
wire [15:0] ReadAddressData;
/*********************************************/

/**** Fetch stage **/
pc		        myPC(NextAddress, PCresult, rst, clk, 1'b1);
pc_adder		pcAdder(PCresult, PCAdderResult);
pc_mux			pcMux(PCsrc, PCAdderResult, BrcAddress, NextAddress);
instruction_mem		instrucMem(PCresult, clk, rst, Instruction);
if_id			ifidBuffer(clk, rst, Instruction, PCAdderResult, 1'b1, IFlush, InstrucOut, PCAdderOut);


/**** Decode stage **/
muxBranch	       muxBrc({ {4{InstrucOut[11]}}, InstrucOut[11:8]}, { {4{InstrucOut[7]}}, InstrucOut[7:4]},
	                         BrOrJmp, BrcDecision);
branchAdder	       brcAdder(BrcDecision, PCAdderOut, BrcAddress);

register_mem 		regFile(RegWrt, RegSwp, clk, rst, InstrucOut[11:8],  InstrucOut[7:4], 
	               WrtRegR15, WrtRegOp1, 
		       WrtDataOp1, WrtDataOp2, WrtDataR15, 
		       ReadOp1Data, ReadOp2Data, ReadR15Data);

control		       controlUnit(InstrucOut[15:12], ALUOp, RegSrc, BrOrJmp, Branch, RegWrt, 
		 		   IFlush, RegSwp, ALUSel0, ALUSel1, StoreByte, MemRd, MemWrt, LoadByte, WBSig, MEMSig);

hazardDetection	       hazardControl(InstrucOut[11:8], InstrucOut[7:4], OutIdExOp1, MemRd, Stall, WrtIfId, PCWrt);

cmpUnit		       compareUnit(ReadOp1Data, ReadR15Data, CmpResult);
andUnit		       andU(CmpResult, Branch, PCsrc); 
controlMux	       controlM(ALUOp, WBSig, MEMSig, 1'b0, 1'b0, ControlSig);

id_ex		       idexBuffer(clk, rst, ReadOp1Data, ReadOp2Data, {8'h00, InstrucOut[7:0]}, { {12{InstrucOut[3]}}, InstrucOut[3:0]}, 
				  InstrucOut[11:8], InstrucOut[7:4], ControlSig[1], ControlSig[0], ControlSig[3:2], OutDataOp1, OutDataOp2,
				  OutConcatZero, OutSignExtImmd, OutIdExOp1, OutIdExOp2, OutWB, OutMEM, OutEX);

/**** Execution stage **/
aluMux0		aluSrc0(OutDataOp1, OutSignExtImmd, ALUSel0, ALUMux0);
aluMux1	 	aluSrc1(OutDataOp2, OutConcatZero, ALUSel1, ALUMux1);
swapMux0	swpMux0(ALUMux0, OutDataOp2, 1'b0, SwapSrc0);
swapMux1	swpMux1(ALUMux1, OutDataOp1, 1'b0, SwapSrc1);
fwd0		fwdMux0(SwapSrc0, OutALUResultExMem, 1'b0, ALUSrcOut0);
fwd1		fwdMux1(SwapSrc1, OutALUResultExMem, 1'b0, ALUSrcOut1);
alu		aluUnit(ALUSrcOut0, ALUSrcOut1, Operation, ALUResult, RegR15Result);	// ALUResult will be store back to op1 register and R15Result will be store back to R15 register
alu_control	aluCtrU(OutEX, OutSignExtImmd[3:0], Operation);
ex_m		exmemBuffer(clk, rst, OutDataOp1, OutDataOp2, ALUResult, RegR15Result, OutIdExOp1, OutIdExOp2, OutWB, OutMEM, 
	                    OutOp1ValExMem, OutOp2ValExMem, OutALUResultExMem, OutR15ResultExMem, OutRegOp1ExMem, OutRegOp2ExMem, OutWBEX); 
forwardUnit	fwdUnit(OutIdExOp1, OutIdExOp2, OutRegOp1ExMem, OutRegOp2ExMem, OutWBEX, FwdA, FwdB, Swap0, Swap1); 

/***** Memory stage ****/
//memMux		memoryMux(OutALUResultExMem[7:0], OutALUResultExMem, StoreByte, DataAddressIn);
data_memory	dataMemory(clk, rst, OutALUResultExMem, OutOp1ValExMem, ReadAddressData, MemRd, MemWrt); 
endmodule
