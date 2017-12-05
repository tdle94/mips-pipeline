module memMux(
    input [7:0] mem1Byte,
    input [15:0] mem2Byte,
    input StoreByte,
    output reg [15:0] storeVal
);

always@(*) begin
    if (StoreByte) begin
        storeVal = {8'h00, mem1Byte};     // 8 bits
    end
    else begin
        storeVal = mem2Byte;     // 16 bits
    end
end

endmodule
