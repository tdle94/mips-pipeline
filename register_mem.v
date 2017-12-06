module register_mem(
    input RegWrt, RegSwp, clk, rst,
    input [3:0] readOp1, readOp2,                // read the register value
    input [3:0] wrtRegOp1,         // write the register value
    input [15:0] wrtDataOp1, wrtDataOp2, wrtDataR15,     // write a value into these register
    output [15:0] readOp1Data, readOp2Data, readR15Data  // read value of op1, op2 and register 15
);


// list of available register content
reg [15:0] Registers [0:15];
assign readOp1Data = Registers[readOp1];
assign readOp2Data = Registers[readOp2];
assign readR15Data = Registers[15];

// write and write on positive clock edge
always@(posedge clk or negedge rst) begin
    // initialize register value
    if (!rst) begin
        Registers[0] <= 16'h0000;
        Registers[1] <= 16'h0F00;
        Registers[2] <= 16'h0050;
        Registers[3] <= 16'hFF0F;
        Registers[4] <= 16'hF0FF;
        Registers[5] <= 16'h0040;
        Registers[6] <= 16'h6666;
        Registers[7] <= 16'h00FF; 
        Registers[8] <= 16'hFF88;
        Registers[9] <= 16'h0000;
        Registers[10] <= 16'h0000;
        Registers[11] <= 16'h0000;
        Registers[12] <= 16'hCCCC;
        Registers[13] <= 16'h0002;
        Registers[14] <= 16'h0000;
        Registers[15] <= 16'h0000;
    end
    else begin
    	if (RegWrt && !RegSwp) begin
        	Registers[wrtRegOp1] <= wrtDataOp1;
       		//Registers[15] <= wrtDataR15;
    	end
    	else if (RegWrt && RegSwp) begin      // swap register's value
        	Registers[readOp2] <= wrtDataOp1;
        	Registers[readOp1] <= wrtDataOp2;
    	end
    end
end

endmodule
