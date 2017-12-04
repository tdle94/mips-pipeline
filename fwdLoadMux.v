module fwdLoadMux(
    input [15:0] memWrt,
    input [15:0] memRead,
    input FwdLoadVal,
    output reg [15:0] result
);

always@(*) begin
    if (FwdLoadVal) begin
        result = memRead;
    end
    else begin
        result = memWrt;
    end
end

endmodule
