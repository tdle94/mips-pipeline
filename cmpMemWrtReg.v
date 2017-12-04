module cmpMemWrtReg(
    input [3:0] op1RegMem, op1RegWrt,
    output reg fwdLoadVal
);

always@(*) begin
    if (op1RegMem == op1RegWrt) begin
        fwdLoadVal <= 1;
    end
    else begin
        fwdLoadVal <= 0;
    end
end

endmodule
