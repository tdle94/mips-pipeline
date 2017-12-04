module alu_control(
    input [1:0] aluOp,
    input [3:0] funct,
    output reg [3:0] operation
);

always@(aluOp or funct) begin
	if (funct == 4'b0000)     begin	// add operation
        	operation = 4'b0000;
	end
	else if (funct == 4'b0001)  begin      // subtract operation
        	operation = 4'b0001;
	end
	else if (funct == 4'b0100) begin       // multiplication operation
        	operation = 4'b0010;
	end
	else if (funct == 4'b0101) begin       // division operation
        	operation = 4'b0011;
	end
	else if (funct == 4'b0111) begin       // move operation
        	operation = 4'b0100;
	end
	else if (funct == 4'b1000) begin        // swap operation
        	operation = 4'b0101;
	end
	else begin
		if (aluOp == 2'b00)  begin                           // and operation
            		operation = 4'b0110;
		end
		else if (aluOp == 2'b11)  begin                      // or operation
            		operation = 4'b0111;
		end
		else if (aluOp == 2'b10) begin                                        // load, store, load byte and store byte operation
            		operation = 4'b1000;
		end
		else	begin
            		operation = 4'bxxxx;
		end
	end
end


endmodule
