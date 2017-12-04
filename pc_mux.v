module pc_mux(
    input  PCSrc,
    input [7:0] sr0, sr1,
    output reg [7:0] finalSrc
);

always@(*) begin
	if (PCSrc) begin
        	finalSrc = sr1;
	end
    	else begin
        	finalSrc = sr0;
	end
end

endmodule
