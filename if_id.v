// Module for IF/ID Buffer

module if_id (
	input clk, rst,
	input [15:0] instrucIn, 
	input [7:0] adderIn,
	input wrtIfId, IFlush,
	output reg [15:0] instrucOut, 
	output reg [7:0] adderOut);

// Output from the register
wire [15:0] ifInstruc;
wire [7:0] ifAdder;
assign ifInstruc = instrucOut;
assign ifAdder = adderIn;

always@(posedge clk or negedge rst) begin
	if (!rst) begin
		adderOut = 0;
		instrucOut = 0;
	end
	else begin
		if (wrtIfId) begin	// no stalling. wrtIfId  asserted. if not asserted then stall and do nothing
			adderOut = adderIn;
			instrucOut = instrucIn;
		end
		else if (IFlush) begin		// flush instruction
			instrucOut = 16'h0000;
		end
		else begin			//  stalling
			instrucOut = ifInstruc;
			adderOut = ifAdder;
		end
	end
end
endmodule
