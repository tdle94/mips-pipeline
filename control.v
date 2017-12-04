module control(
    input [3:0] opCode,
    output reg [1:0] ALUOp, RegSrc,
    output reg  BrOrJmp,                 // branch or jump
           Branch,
           RegWrt,
           IFlush,
           RegSwp,                  // swap register value op1 <= op2 and op2 <= op1
           ALUSel0, ALUSel1,
           ReadByte,
           MemRd,           // Memory read
           MemWrt,              // memory write
           LoadByte,
	   WBSig, MEMSig
);

always@(opCode) begin
    case (opCode)
        4'b1111: begin          // type A instruction
            BrOrJmp = 1'bx;
            Branch = 0;
            RegWrt = 1;
            RegSwp = 0;
            ALUSel0 = 0;
            ALUSel1 = 0;
            IFlush = 1'b0;
            ReadByte = 1'bx;
            MemRd = 1'bx;
            MemWrt = 1'bx;
            LoadByte = 1'bx;
            RegSrc = 2'b00;          // 4-1 mux to decide which value to read into the register
	    
            ALUOp = 2'bxx;	// is actually EX signal
	    WBSig = 1'b1;		// write back signal
	    MEMSig = 1'b0;		// memory signal
        end
        4'b1000: begin         // and
            BrOrJmp = 1'bx;
            Branch = 0;
            RegWrt = 1;
            RegSwp = 0;
            ALUSel0 = 0;
            ALUSel1 = 1;
            IFlush = 1'b0;
            ReadByte = 1'bx;
            MemRd = 1'bx;
            MemWrt = 1'bx;
            LoadByte = 1'bx;
            RegSrc = 2'b01;           // 4-1 mux to decide which value to read into the register

            ALUOp = 2'b00;
	    WBSig = 1'b1;               // write back signal
	     MEMSig = 1'b0;              // memory signal
        end

        4'b1001: begin          // or instruction
            BrOrJmp = 1'bx;
            Branch = 0;
            RegWrt = 1;
            RegSwp = 0;
            ALUSel0 = 0;
            ALUSel1 = 1;
            IFlush = 1'b0;
            ReadByte = 1'bx;
            MemRd = 1'bx;
            MemWrt = 1'bx;
            LoadByte = 1'bx;
            RegSrc = 2'b01;           // 4-1 mux to decide which value to read into the register

            ALUOp = 2'b11;
	     WBSig = 1'b1;               // write back signal
	     MEMSig = 1'b0;              // memory signal
        end

        4'b1010: begin      // load byte unsigned
            BrOrJmp = 1'bx;
            Branch = 0;
            RegWrt = 1;
            RegSwp = 0;
            ALUSel0 = 1;
            ALUSel1 = 0;
            IFlush = 1'b0;
            ReadByte = 1;
            MemRd = 0;
            MemWrt = 1;
            LoadByte = 1;
            RegSrc = 2'b0x;           // 4-1 mux to decide which value to read into the register

            ALUOp = 2'b10;
	    WBSig = 1'b1;               // write back signal
	    MEMSig = 1'b1;              // memory signal
        end

        4'b1011: begin      // store byte
            BrOrJmp = 1'bx;
            Branch = 0;
            RegWrt = 1;
            RegSwp = 0;
            ALUSel0 = 1;
            ALUSel1 = 0;
            IFlush = 1'b0;
            ReadByte = 1;
            MemRd = 1;
            MemWrt = 0;
            LoadByte = 1'bx;
            RegSrc = 2'bxx;           // 4-1 mux to decide which value to read into the register

            ALUOp = 2'b10;
	     WBSig = 1'b0;               // write back signal
	     MEMSig = 1'b1;              // memory signal
        end

        4'b1100: begin          // load instruction
            BrOrJmp = 1'bx;
            Branch = 0;
            RegWrt = 1;
            RegSwp = 0;
            ALUSel0 = 1;
            ALUSel1 = 0;
            IFlush = 1'b0;
            ReadByte = 0;
            MemRd = 0;
            MemWrt = 1;
            LoadByte = 0;
            RegSrc = 2'b0x;           // 4-1 mux to decide which value to read into the register

            ALUOp = 2'b10;
		WBSig = 1'b1;               // write back signal
		 MEMSig = 1'b1;              // memory signal
        end

        4'b1101: begin      // store instruction
            BrOrJmp = 1'bx;
            Branch = 0;
            RegWrt = 1;
            RegSwp = 0;
            ALUSel0 = 1;
            ALUSel1 = 0;
            IFlush = 1'b0;
            ReadByte = 0;
            MemRd = 1;
            MemWrt = 0;
            LoadByte = 1'bx;
            RegSrc = 2'bxx;    // 4-1 mux to decide which value to read into the register

            ALUOp = 2'b10;
		WBSig = 1'b0;               // write back signal
		MEMSig = 1'b1;              // memory signal
        end

        4'b0101: begin          // branch on less than
            BrOrJmp = 0;
            Branch = 1;
            RegWrt = 1'bx;
            RegSwp = 1'bx;
            ALUSel0 = 1'bx;
            ALUSel1 = 1'bx;
            IFlush = 1'b1;
            ReadByte = 1'bx;
            MemRd = 1'bx;
            MemWrt = 1'bx;
            LoadByte = 1'bx;
            RegSrc = 2'bxx;    // 4-1 mux to decide which value to read into the register

            ALUOp = 2'bxx;
	    WBSig = 1'bx;               // write back signal
	     MEMSig = 1'bx;              // memory signal
        end

        4'b0100: begin          // branch on greater than
            BrOrJmp = 0;
            Branch = 1;
            RegWrt = 1'bx;
            RegSwp = 1'bx;
            ALUSel0 = 1'bx;
            ALUSel1 = 1'bx;
            IFlush = 1'b1;
            ReadByte = 1'bx;
            MemRd = 1'bx;
            MemWrt = 1'bx;
            LoadByte = 1'bx;
            RegSrc = 2'bxx;    // 4-1 mux to decide which value to read into the register

            ALUOp = 2'bxx;
	     WBSig = 1'bx;               // write back signal
	      MEMSig = 1'bx;              // memory signal
        end

        4'b0110: begin          // branch on equal
            BrOrJmp = 0;
            Branch = 1;
            RegWrt = 1'bx;
            RegSwp = 1'bx;
            ALUSel0 = 1'bx;
            ALUSel1 = 1'bx;
            IFlush = 1'b1;
            ReadByte = 1'bx;
            MemRd = 1'bx;
            MemWrt = 1'bx;
            LoadByte = 1'bx;
            RegSrc = 2'bxx;    // 4-1 mux to decide which value to read into the register

            ALUOp = 2'bxx;
	    WBSig = 1'bx;               // write back signal
	     MEMSig = 1'bx;              // memory signal
        end

        4'b0001: begin          // branch jump
            BrOrJmp = 1;
            Branch = 1;
            RegWrt = 1'bx;
            RegSwp = 1'bx;
            ALUSel0 = 1'bx;
            ALUSel1 = 1'bx;
            IFlush = 1'b1;
            ReadByte = 1'bx;
            MemRd = 1'bx;
            MemWrt = 1'bx;
            LoadByte = 1'bx;
            RegSrc = 2'bxx;    // 4-1 mux to decide which value to read into the register

            ALUOp = 2'bxx;
	     WBSig = 1'bx;               // write back signal
	     MEMSig = 1'bx;              // memory signal
        end
endcase
end


endmodule
