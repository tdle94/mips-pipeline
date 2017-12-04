module controlMux(
	input [1:0] ALUOp,
	input WBSig, MEMSig,
	input zero,
    	input Stall,
	//output reg WBSig, MEMSig,
    	//output reg [1:0] EXSig
	output reg [3:0] controlSig
);


//assign controlSig = {ALUOp, 1'b1, 1'b1};

always@(*) begin
   	if (Stall) begin
		//WBSig = zero;
		//MEMSig = zero;
        	//EXSig = 2'b00;
		controlSig = {ALUOp, WBSig, MEMSig};
	end
    	else begin
		controlSig = {ALUOp, WBSig, MEMSig};
	//	EXSig = ALUOp;
        //	WBSig = 1;
	//	MEMSig = 1;	
	end
end

endmodule
