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
		$display("\tTime  | PCresult | Intruction | Op1 Val | Op2 Val | Concat Zero | Sign Ext Immd | ALUOp | RegSrc | BrOrJmp | Branch | RegWrt | IFlush | RegSwp | ALUSel0 | ALUSel1 | ReadByte | MemRd |MemWrt | LoadByte | WBSig | MEMSig | ALUResult | RegR15Result | ReadAddressData | Wrt Back to Reg Op1 | Wrt back to Reg 15 | Wrt back to Reg Op2");
		$display("--------------------------------------------------------------------------------------------------");
		$monitor("%d, %h, %h, %h, %h, %h, %h, %b, %b, %b, %b, %b, %b, %b, %b, %b, %b, %b, %b, %b, %b, %b, %h, %h, %h, %h, %h, %h", $time,  
			youShallNotPass.PCresult, youShallNotPass.InstrucOut,			
			youShallNotPass.OutDataOp1, youShallNotPass.OutDataOp2, youShallNotPass.OutConcatZero, youShallNotPass.OutSignExtImmd,  // ID/EX buffer
			youShallNotPass.ALUOp, youShallNotPass.RegSrc, youShallNotPass.BrOrJmp, youShallNotPass.Branch, youShallNotPass.RegWrt, // main control unit
			youShallNotPass.IFlush, youShallNotPass.RegSwp, youShallNotPass.ALUSel0, youShallNotPass.ALUSel1, youShallNotPass.ReadByte, // main control unit
			youShallNotPass.MemRd, youShallNotPass.MemWrt, youShallNotPass.LoadByte, youShallNotPass.WBSig, youShallNotPass.MEMSig,	// main control unit
			youShallNotPass.ALUResult, youShallNotPass.RegR15Result, // ALU result
			youShallNotPass.ReadAddressData,		// Read from memory
			youShallNotPass.WrtDataOp1, youShallNotPass.WrtDataR15, youShallNotPass.WrtDataOp2		// Write from WB stage to the register. Put A type result to Op1 or R15. Swap between Op1 and Op2 
		);
			
				     	    
				           
	end	

	initial begin
		#10 rst = ~rst;
	end

	initial begin
		#400 $finish;
	end
endmodule
