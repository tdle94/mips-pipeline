module hazardDetection(
	input [3:0] op1_ifid, op2_ifid,
	input [3:0] op1_idex,
	input MemRead,
	output reg Stall, WrtIfId, PCWrt
);

always@(*) begin
	if (MemRead && (op1_idex == op1_ifid || op1_idex == op2_ifid)) begin	// hazard Stall
		Stall = 1;
		WrtIfId = 0;
		PCWrt = 0;
	end
	else begin		// no hazard no stall
		Stall = 0;
		WrtIfId = 1;
		PCWrt = 1;
	end
end

endmodule
