module pc(
    input [7:0] NextAddress,
    output reg [7:0] PCresult,
    input rst, clk,PCWrt
);

wire [7:0] currentAddress;
assign currentAddress = NextAddress;

always@(posedge clk or negedge rst) begin
    if (!rst)begin
        PCresult = 8'hFE;
    end
    else begin
	    if (PCWrt) begin
		PCresult = NextAddress;
    	    end
	    else begin
		PCresult = currentAddress;
	    end
    end
end
endmodule

