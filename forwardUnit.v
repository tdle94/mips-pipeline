module forwardUnit(
    input [3:0] op1_idex, op2_idex,           // ID/EX.op1 and ID/EX.op2_idex
    input [3:0] op1_exmem, op2_exmem,                   // EX/M.op1
    input wrtback_sig,                 // write back signal
    output reg forwardA, forwardB, swap0, swap1
);

// data dependency for load and type A instruction
always@(*) begin
    if (wrtback_sig && op1_exmem == op1_idex) begin
        forwardA = 1;
    end
    else if (wrtback_sig && op1_exmem == op2_idex) begin
        forwardB = 1;
    end
    else begin
        forwardA = 0;
        forwardB = 0;
    end
end

// swap hazard
always@(*) begin
	if (op2_exmem == op1_idex) begin
		swap1 = 1;
	end
	if (op2_exmem == op2_idex) begin
		swap0 = 1;
	end
end
endmodule
