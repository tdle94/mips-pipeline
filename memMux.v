module memMux(
    input [7:0] mem1Byte,
    input [15:0] mem2Byte,
    input storeByte,
    output reg [7:0] result0,
    output reg [15:0] result1
);

always@(*) begin
    if (storeByte) begin
        result0 = mem1Byte;     // 8 bits
    end
    else begin
        result1 = mem2Byte;     // 16 bits
    end
end

endmodule